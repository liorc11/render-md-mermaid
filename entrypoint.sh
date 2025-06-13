#!/usr/bin/env bash

# Parse command line arguments
IGNORE_PATTERNS=()
while [[ $# -gt 0 ]]; do
    case $1 in
        --ignore)
            IGNORE_PATTERNS+=("$2")
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

# Build find command with ignore patterns
FIND_CMD="find . -name \"*.md\""

# Add ignore patterns to find command
for pattern in "${IGNORE_PATTERNS[@]}"; do
    FIND_CMD="$FIND_CMD -not -path \"$pattern\""
done

# Execute find command and process each markdown file
eval "$FIND_CMD" | while read -r md; do
    /render-md-mermaid.sh "$md" in-container
done