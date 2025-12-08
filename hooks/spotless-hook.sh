#!/bin/bash
# Spotless hook - formats Java files
# Pre-commit framework ensures this only runs when Java files are staged

echo "Running Spotless format apply..."
echo ""

# Run Spotless apply
mvn spotless:apply
SPOTLESS_EXIT_CODE=$?

if [ $SPOTLESS_EXIT_CODE -ne 0 ]; then
  echo ""
  echo "❌ Spotless format apply failed!"
  echo "Run 'mvn spotless:apply' to fix formatting issues."
  exit 1
fi

# Get the list of staged Java files to restage (ACM: Added, Copied, Modified files)
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.java$' || true)

if [ -z "$STAGED_FILES" ]; then
  echo "No staged Java files to format"
  exit 0
fi

# Re-stage the formatted files
echo "$STAGED_FILES" | while read -r file; do
  if [ -f "$file" ]; then
    git add "$file"
  fi
done

echo "✅ Spotless format apply passed and files re-staged!"
exit 0
