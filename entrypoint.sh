#!/usr/bin/env bash

# Default behavior - find all .md files
FIND_CMD="find . -name \"*.md\""

# If arguments are provided, treat them as ignore patterns
if [ $# -gt 0 ]; then
    for pattern in "$@"; do
        if [[ -n "$pattern" ]]; then
            FIND_CMD="$FIND_CMD -not -path \"$pattern\""
        fi
    done
fi

# Execute find command and process each markdown file
eval "$FIND_CMD" | while read -r md; do
    /render-md-mermaid.sh "$md" in-container
done