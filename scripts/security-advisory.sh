#!/bin/bash

set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Error: GHSA advisory ID required." >&2
    echo "Usage: $0 <GHSA-xxxx-xxxx-xxxx>" >&2
    exit 1
fi

ADVISORY_ID="$1"

for cmd in gh jq; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: '$cmd' is required but not installed." >&2
        exit 1
    fi
done

echo "Fetching advisory ${ADVISORY_ID} ..."
DATA="$(gh api "repos/kimai/kimai/security-advisories/${ADVISORY_ID}")"

# Extract fields
title="$(jq -r '.summary' <<< "$DATA")"
ghsa_id="$(jq -r '.ghsa_id' <<< "$DATA")"
cve_id="$(jq -r '.cve_id // ""' <<< "$DATA")"
severity="$(jq -r '.severity' <<< "$DATA")"
state="$(jq -r '.state' <<< "$DATA")"
published_at="$(jq -r '.published_at // .created_at' <<< "$DATA")"
affected="$(jq -r '.vulnerabilities[0].vulnerable_version_range // ""' <<< "$DATA")"
patched="$(jq -r '.vulnerabilities[0].patched_versions // ""' <<< "$DATA")"
publisher="$(jq -r '.publisher.login // ""' <<< "$DATA")"
author="$(jq -r '(.credits_detailed[]? | select(.type == "reporter") | .user.login) // (.credits[0].user.login) // ""' <<< "$DATA")"
description="$(jq -r '.description // ""' <<< "$DATA")"

# Format date for Jekyll: "2026-04-16 21:19:11 +0000"
post_date="$(date -u -j -f "%Y-%m-%dT%H:%M:%SZ" "$published_at" "+%Y-%m-%d %H:%M:%S +0000")"
post_day="$(date -u -j -f "%Y-%m-%dT%H:%M:%SZ" "$published_at" "+%Y-%m-%d")"

slug="$(tr '[:upper:]' '[:lower:]' <<< "$ghsa_id")"
outfile="collections/_security/${post_day}-${slug}.md"

if [ -f "$outfile" ]; then
    echo "Error: ${outfile} already exists." >&2
    exit 1
fi

# Extract a named section from GitHub's markdown description (### Heading)
extract_section() {
    local heading="$1"
    awk -v h="$heading" '
        /^### / { cur=substr($0,5); sub(/^[[:space:]]+/,"",cur); sub(/[[:space:]]+$/,"",cur); in_s=(tolower(cur)==tolower(h)); next }
        in_s { print }
    ' <<< "$description" | sed '/./,$!d' | sed -e 's/[[:space:]]*$//'
}

summary_text="$(extract_section "Summary")"
details_text="$(extract_section "Details")"
impact_text="$(extract_section "Impact")"

# Intro: prefer Summary section, fall back to title
intro="${summary_text:-$title}"

# Info body: prefer Details, then Impact, then generic fallback
info_body="${details_text}"
if [ -n "$impact_text" ]; then
    if [ -n "$info_body" ]; then
        info_body="${info_body}

${impact_text}"
    else
        info_body="$impact_text"
    fi
fi
if [ -z "$info_body" ]; then
    info_body="This issue affected Kimai versions ${affected}."
fi

# Solution text
if [ -n "$patched" ]; then
    solution_text="Users should update to \`${patched}\` or newer."
else
    solution_text="Users should update to a patched Kimai version."
fi

cat > "$outfile" <<EOF
---
title: "$(sed 's/"/\\"/g' <<< "$title")"
date: "${post_date}"
ghsa_id: "${ghsa_id}"
cve_id: $([ -n "$cve_id" ] && echo "\"${cve_id}\"")
severity: "${severity}"
affected_version: "${affected}"
patched_version: "${patched}"
author: "${author}"
published: "${publisher}"
state: "${state}"
---

${intro}

## Info

${info_body}

## Solution

${solution_text}
EOF

echo "Created: ${outfile}"
