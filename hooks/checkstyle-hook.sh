#!/bin/bash
# Checkstyle hook - checks only staged Java files
# This script runs Checkstyle on staged files only (lint-staged style)

# Get the list of staged Java files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.java$' || true)

if [ -z "$STAGED_FILES" ]; then
  echo "No staged Java files to check"
  exit 0
fi

echo "Running Checkstyle on staged files..."
echo "$STAGED_FILES" | while read -r file; do
  echo "  - $file"
done

# Run Checkstyle
mvn checkstyle:check -q

if [ $? -ne 0 ]; then
  echo ""
  echo "❌ Checkstyle check failed!"
  echo "Please fix the checkstyle violations before committing."
  exit 1
fi

echo "✅ Checkstyle check passed!"
exit 0
