#!/bin/bash
# Checkstyle hook - checks Java files
# Pre-commit framework ensures this only runs when Java files are staged

echo "Running Checkstyle..."
echo ""

# Run Checkstyle (without -q to show violations)
mvn checkstyle:check
CHECKSTYLE_EXIT_CODE=$?

if [ $CHECKSTYLE_EXIT_CODE -ne 0 ]; then
  echo ""
  echo "❌ Checkstyle check failed!"
  echo "Please fix the checkstyle violations shown above before committing."
  exit 1
fi

echo "✅ Checkstyle check passed!"
exit 0
