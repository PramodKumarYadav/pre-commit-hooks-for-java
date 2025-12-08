#!/bin/bash
# Spotless hook - formats only staged Java files
# This script runs Spotless format check on staged files only (lint-staged style)

# Get the list of staged Java files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.java$' || true)

if [ -z "$STAGED_FILES" ]; then
  echo "No staged Java files to format"
  exit 0
fi

echo "Running Spotless format check on staged files..."
echo "$STAGED_FILES" | while read -r file; do
  echo "  - $file"
done

# Run Spotless check
mvn spotless:check -q

if [ $? -ne 0 ]; then
  echo ""
  echo "❌ Spotless format check failed!"
  echo "Run 'mvn spotless:apply' to fix formatting issues."
  exit 1
fi

echo "✅ Spotless format check passed!"
exit 0
