#!/usr/bin/env sh

set -e

CONFIG_FILE="_config.yml"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_value>"
    exit 1
fi

new_value="$1"

# Use awk to update the kimai_v2_version value in the CONFIG_FILE
awk -v new_version="$new_value" '/kimai_v2_version:/ {$2 = "\"" new_version "\""} 1' "$CONFIG_FILE" > temp.yml && mv temp.yml "$CONFIG_FILE"

echo "Updated $CONFIG_FILE: Set kimai_v2_version to '$new_value'"
