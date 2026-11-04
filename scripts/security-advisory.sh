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
developer: "${publisher}"
---

<INTRO>
<DETAILS>

<!-- [START] -->
${description}
<!-- [END] -->

## Solution

<SOLUTION>

EOF

echo "Created: ${outfile}"
