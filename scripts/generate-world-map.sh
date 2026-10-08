#!/bin/bash
#
# Generates the world map SVGs (images/world-map-<name>.svg, one per projection) from Natural Earth data.
#
# - Source data: Natural Earth admin-0 countries (public domain), https://www.naturalearthdata.com/
# - Tooling: mapshaper (run through npx, no project dependency), https://github.com/mbloch/mapshaper
#
# Every country is a <path data-iso="XX"> (ISO 3166-1 alpha-2). Small countries additionally get a
# <circle data-iso="XX"> marker, so they stay visible when highlighted. Colors are applied via CSS.
#
# All settings below can be overridden through environment variables, for example:
#   PROJECTIONS="robinson:robin" ./scripts/generate-world-map.sh
#   OUTPUT_DIR=/tmp SIMPLIFY_INTERVAL=8000 ./scripts/generate-world-map.sh
#

set -euo pipefail

cd "$(dirname "$0")/.."

# Natural Earth release, pinned so the output is reproducible
NE_VERSION="${NE_VERSION:-v5.1.2}"

# Natural Earth "point of view" for disputed areas (only available for the 10m scale).
# "deu" = official German view: Crimea belongs to Ukraine, Taiwan, Kosovo and Western Sahara are
# shown separately, Northern Cyprus and Somaliland are part of Cyprus and Somalia.
# Use "" for the de facto view, other options: iso, tlc, fra, gbr, usa, ...
NE_POV="${NE_POV:-deu}"

# Reassign Natural Earth features (by ADM0_A3 code) to another ISO code, separated by spaces.
# Example: REASSIGN="WSB:GB ESB:GB" merges the British bases on Cyprus into the United Kingdom.
# Features without an ISO code (e.g. Bir Tawil) are rendered as neutral land without data-iso.
REASSIGN="${REASSIGN:-}"

# Split parts of a country into their own ISO code, as "<country>:<new code>:<west>,<south>,<east>,<north>".
# Every polygon of <country> whose center lies inside the bounding box (degrees) gets the new code.
# Default: the French overseas departments, which Natural Earth includes in France.
SPLIT="${SPLIT:-FR:GF:-55,1.5,-51,6.5 FR:MQ:-61.3,14.3,-60.7,15 FR:GP:-62,15.8,-60.9,16.6 FR:RE:55,-21.5,56,-20.8 FR:YT:44.9,-13.1,45.4,-12.5}"

# Projections as "<file name>:<proj4 name>", separated by spaces. Each one is written to world-map-<file name>.svg.
# Flat (rectangular): mill = Miller, gall = Gall stereographic, patterson = Patterson
# Round (globe-like): eqearth = Equal Earth, robin = Robinson, wintri = Winkel Tripel
# Miller shows Europe (where most customers are) larger than area-true projections do, which is intended.
PROJECTIONS="${PROJECTIONS:-miller:mill eqearth:eqearth gall:gall}"

# Northern and southern limit in degrees, everything outside is cut.
# Use -90 as SOUTH_LIMIT to keep Antarctica.
NORTH_LIMIT="${NORTH_LIMIT:-85}"
SOUTH_LIMIT="${SOUTH_LIMIT:--60}"

# SVG width in pixels (only defines the viewBox, the map scales with CSS)
WIDTH="${WIDTH:-1000}"

# Simplification in meters (higher = smaller file, less detail)
SIMPLIFY_INTERVAL="${SIMPLIFY_INTERVAL:-15000}"

# Islands smaller than this are removed (km²)
MIN_ISLAND_KM2="${MIN_ISLAND_KM2:-20}"

# Countries smaller than this get an additional circle marker (km²) and its radius in pixels
MARKER_MAX_KM2="${MARKER_MAX_KM2:-20000}"
MARKER_RADIUS="${MARKER_RADIUS:-4}"

OUTPUT_DIR="${OUTPUT_DIR:-images}"
CACHE_DIR="${CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/kimai-world-map/$NE_VERSION}"
MAPSHAPER="${MAPSHAPER:-npx --yes mapshaper@0.7}"

# ---------------------------------------------------------------------------------------------------

for cmd in curl npx; do
    command -v "$cmd" >/dev/null || { echo "Missing required command: $cmd"; exit 1; }
done

countries_file="ne_10m_admin_0_countries${NE_POV:+_$NE_POV}.geojson"
lakes_file="ne_110m_lakes.geojson"

mkdir -p "$CACHE_DIR"
for file in "$countries_file" "$lakes_file"; do
    if [ ! -s "$CACHE_DIR/$file" ]; then
        echo "Downloading $file ($NE_VERSION) ..."
        curl -sfL -o "$CACHE_DIR/$file.tmp" "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/$NE_VERSION/geojson/$file"
        mv "$CACHE_DIR/$file.tmp" "$CACHE_DIR/$file"
    fi
done

# "WSB:GB ESB:GB" => {"WSB":"GB","ESB":"GB"}
reassign_js="{"
for pair in $REASSIGN; do
    reassign_js+="\"${pair%%:*}\":\"${pair##*:}\","
done
reassign_js="${reassign_js%,}}"

# "FR:GF:-55,1.5,-51,6.5" => [["FR","GF",-55,1.5,-51,6.5]]
split_js="["
for rule in $SPLIT; do
    IFS=: read -r split_from split_to split_bbox <<< "$rule"
    split_js+="[\"$split_from\",\"$split_to\",$split_bbox],"
done
split_js="${split_js%,}]"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

for entry in $PROJECTIONS; do
    name="${entry%%:*}"
    projection="${entry##*:}"
    tmp_svg="$tmp_dir/world-map-$name.svg"
    output="$OUTPUT_DIR/world-map-$name.svg"

    # the "ocean" rectangle only limits the map to NORTH_LIMIT/SOUTH_LIMIT, it is not part of the output
    $MAPSHAPER \
        -i "$CACHE_DIR/$countries_file" name=countries \
        -each "iso = ($reassign_js)[ADM0_A3] || (ISO_A2_EH == '-99' ? '' : ISO_A2_EH)" \
        -filter-fields iso \
        -explode \
        -each "($split_js).forEach(function (r) { if (iso == r[0] && this.centroidX >= r[2] && this.centroidX <= r[4] && this.centroidY >= r[3] && this.centroidY <= r[5]) { iso = r[1]; } }, this)" \
        -dissolve iso \
        -erase "$CACHE_DIR/$lakes_file" \
        -rectangle bbox=-180,"$SOUTH_LIMIT",180,"$NORTH_LIMIT" name=ocean \
        -clip ocean target=countries \
        -each 'area_km2 = this.area / 1e6' target=countries \
        -filter "iso != '' && area_km2 < $MARKER_MAX_KM2" target=countries + name=markers \
        -points inner target=markers \
        -filter-fields iso target=countries,markers \
        -style r="$MARKER_RADIUS" target=markers \
        -proj +proj="$projection" densify target=countries,markers \
        -simplify interval="$SIMPLIFY_INTERVAL" keep-shapes target=countries \
        -filter-islands min-area="$((MIN_ISLAND_KM2 * 1000000))" target=countries \
        -o "$tmp_svg" format=svg width="$WIDTH" precision=0.1 svg-data=iso id-prefix=world-map- \
            target=countries,markers

    {
        echo "<!-- Generated by scripts/generate-world-map.sh - do not edit manually."
        echo "     Data: Natural Earth $NE_VERSION (public domain), point of view: ${NE_POV:-de facto}, projection: $projection -->"
        sed -E \
            -e '/^<\?xml/d' \
            -e 's/<svg xmlns="http:\/\/www.w3.org\/2000\/svg" version="1.2" baseProfile="tiny" width="[0-9.]+" height="[0-9.]+"/<svg xmlns="http:\/\/www.w3.org\/2000\/svg" class="world-map" role="img"/' \
            "$tmp_svg"
    } > "$output"

    echo "Wrote $output ($(wc -c < "$output" | tr -d ' ') bytes, $(grep -c 'data-iso=' "$output") elements with ISO code)"
done
