#!/bin/bash
# Spotless hook - formats only staged Java files
# This script runs Spotless format apply on staged files only (lint-staged style)

# Get the list of staged Java files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.java$' || true)

if [ -z "$STAGED_FILES" ]; then
  echo "No staged Java files to format"
  exit 0
fi

echo "Running Spotless format apply on staged files..."
echo "$STAGED_FILES" | while read -r file; do
  echo "  - $file"
done

# Run Spotless apply
mvn spotless:apply -q
SPOTLESS_EXIT_CODE=$?

echo "spotless apply status code: $SPOTLESS_EXIT_CODE"

if [ $SPOTLESS_EXIT_CODE -ne 0 ]; then
  echo ""
  echo "❌ Spotless format apply failed!"
  echo "Run 'mvn spotless:apply' to fix formatting issues."
  exit 1
fi

echo "✅ Spotless format apply passed!"
exit 0
