#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SITE_DIR="${1:-$ROOT_DIR/_site}"
PAGEFIND_VERSION="${PAGEFIND_VERSION:-1.5.2}"
PAGEFIND_INCLUDE_CHARACTERS="${PAGEFIND_INCLUDE_CHARACTERS:-_-.:/}"

if ! command -v npx >/dev/null 2>&1; then
    echo "npx is required to build the Pagefind index" >&2
    exit 1
fi

if [[ ! -d "$SITE_DIR" ]]; then
    echo "Site directory not found: $SITE_DIR" >&2
    exit 1
fi

echo "Building Pagefind index in $SITE_DIR/pagefind"

npx --yes "pagefind@${PAGEFIND_VERSION}" \
    --site "$SITE_DIR" \
    --output-subdir "pagefind" \
    --include-characters "$PAGEFIND_INCLUDE_CHARACTERS" \
