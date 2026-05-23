#!/usr/bin/env bash
# Fetches new testimonials from senja.io and appends them to _data/testimonials.yml.
# Images (avatar, logo) are downloaded to images/testimonials/.
# Usage: SENJA_TOKEN=your_token ./scripts/import-senja-testimonials.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
YAML_FILE="$ROOT_DIR/_data/testimonials.yml"
IMAGES_DIR="$ROOT_DIR/images/testimonials"
API_BASE="https://api.senja.io/v1"

# ── Preflight checks ──────────────────────────────────────────────────────────

for cmd in curl jq; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: '$cmd' is required but not installed." >&2
        exit 1
    fi
done

if [[ -z "${SENJA_TOKEN:-}" ]]; then
    echo "Error: SENJA_TOKEN is not set." >&2
    echo "" >&2
    echo "  The Senja API token is required to fetch testimonials." >&2
    echo "  Retrieve it from: https://app.senja.io → Automate → API" >&2
    echo "" >&2
    echo "  Run the script with the token inline:" >&2
    echo "    SENJA_TOKEN=your_token ./scripts/import-senja-testimonials.sh" >&2
    echo "" >&2
    echo "  Or export it in your shell first:" >&2
    echo "    export SENJA_TOKEN=your_token" >&2
    echo "    ./scripts/import-senja-testimonials.sh" >&2
    exit 1
fi

mkdir -p "$IMAGES_DIR"

# ── Helpers ───────────────────────────────────────────────────────────────────

slugify() {
    echo "$1" \
        | sed 's/[äÄ]/ae/g; s/[öÖ]/oe/g; s/[üÜ]/ue/g; s/[ß]/ss/g' \
        | tr '[:upper:]' '[:lower:]' \
        | sed 's/[^a-z0-9]/-/g' \
        | sed 's/-\+/-/g; s/^-//; s/-$//'
}

# Download a URL to images/testimonials/ and echo the filename (or "" on skip).
download_image() {
    local url="$1"
    local basename="$2"

    [[ -z "$url" || "$url" == "null" ]] && echo "" && return

    # Derive extension from URL path (ignore query string)
    local path="${url%%\?*}"
    local ext="${path##*.}"
    ext="${ext,,}"          # lowercase
    case "$ext" in
        jpg|jpeg|png|gif|webp|svg) ;;
        *) ext="jpg" ;;
    esac

    local filename="${basename}.${ext}"
    local filepath="$IMAGES_DIR/$filename"

    if [[ -f "$filepath" ]]; then
        echo "  [skip] $filename already exists" >&2
        echo "$filename"
        return
    fi

    if curl -s -f -L --max-time 30 -o "$filepath" "$url" 2>/dev/null; then
        echo "  [dl]   $filename" >&2
        echo "$filename"
    else
        echo "  [warn] Failed to download $url" >&2
        echo ""
    fi
}

# Emit a YAML block-scalar value (8-space indent for content).
# For single-line values without special chars we use the plain scalar.
yaml_text() {
    local val="$1"
    if [[ -z "$val" || "$val" == "null" ]]; then
        echo "''"
        return
    fi

    # Multi-line → block scalar
    if [[ "$val" == *$'\n'* ]]; then
        echo "|"
        while IFS= read -r line; do
            printf '        %s\n' "$line"
        done <<< "$val"
        return
    fi

    # Single-line: escape single quotes and wrap
    local escaped="${val//\'/\'\'}"
    echo "'${escaped}'"
}

# ── Fetch testimonials ────────────────────────────────────────────────────────

echo "Fetching testimonials from senja.io…"
RESPONSE=$(curl -s -f \
    -H "Authorization: Bearer $SENJA_TOKEN" \
    -H "Accept: application/json" \
    "$API_BASE/testimonials")

# Normalise: walk the response until we find an array of objects.
# Handles: bare array, {data:[…]}, {data:{items:[…]}}, etc.
ITEMS=$(echo "$RESPONSE" | jq -c '
    def find_array:
        if type == "array" and (length == 0 or (.[0] | type) == "object") then .[]
        elif type == "object" then (.[] | find_array)
        else empty
        end;
    find_array
' 2>/dev/null || true)

COUNT=$(printf '%s' "$ITEMS" | grep -c '^{' || true)
echo "Found $COUNT testimonial(s) to import."
if [[ "$COUNT" -eq 0 ]]; then
    echo "Debug — raw response:" >&2
    echo "$RESPONSE" | jq '.' 2>/dev/null || echo "$RESPONSE" >&2
    exit 0
fi

# ── Process each testimonial ──────────────────────────────────────────────────

while IFS= read -r item; do
    # Core fields — try multiple candidate names the API might use
    name=$(echo "$item"     | jq -r '.customer_name // ""')
    position=$(echo "$item" | jq -r '.customer_job_title // .customer_tagline // .job_title // ""')
    company=$(echo "$item"  | jq -r '.customer_company // .company // ""')
    url=$(echo "$item"      | jq -r '(.customer_url // .url // .website // "") | if . == "" then "" else . end')
    rating=$(echo "$item"   | jq -r '.rating // 5')
    text=$(echo "$item"     | jq -r '.text // .review // ""')
    date=$(echo "$item"     | jq -r '.created_at // .date // ""' | cut -c1-10)
    type=$(echo "$item"     | jq -r 'if .video_url and .video_url != "" and .video_url != null then "video" else "text" end')
    video_url=$(echo "$item" | jq -r '.video_url // ""')

    # Image URLs — try multiple field names
    avatar_url=$(echo "$item" | jq -r \
        '.customer_photo_url // .customer_avatar_url // .photo_url // .avatar_url // .avatar // ""')
    logo_url=$(echo "$item" | jq -r \
        '.company_logo_url // .logo_url // .company_logo // .logo // ""')
    thumbnail_url=$(echo "$item" | jq -r '.thumbnail_url // ""')

    echo ""
    echo "→ $name"

    slug=$(slugify "$name")

    # Download images
    avatar_file=$(download_image "$avatar_url" "$slug")
    logo_file=$(download_image "$logo_url" "${slug}-logo")

    # Prepare YAML scalars
    name_yaml=$(yaml_text "$name")
    position_yaml=$(yaml_text "$position")
    company_yaml=$(yaml_text "$company")
    url_yaml=$(yaml_text "$url")
    text_yaml=$(yaml_text "$text")

    # Build the YAML block
    {
        echo "-"
        echo "    rating: $rating"
        echo "    name: $name_yaml"
        echo "    position: $position_yaml"
        echo "    company: $company_yaml"
        echo "    url: $url_yaml"
        printf '    text: %s\n' "$text_yaml"
        echo "    translations:"
        printf '        en: %s\n' "$text_yaml"
        echo "    date: '${date}'"
        echo "    tags: []"
        echo "    avatar: '${avatar_file}'"
        echo "    logo: '${logo_file}'"
        if [[ "$type" == "video" ]]; then
            echo "    video: '${video_url}'"
            echo "    thumbnail: '${thumbnail_url}'"
        else
            echo "    video: ''"
        fi
        echo "    type: $type"
        echo "    source: senja"
        echo "    origin: ''"
    } >> "$YAML_FILE"

    echo "  [ok] Appended to testimonials.yml"
done <<< "$ITEMS"

echo ""
echo "Done. Review _data/testimonials.yml — fill in tags and translations manually."
