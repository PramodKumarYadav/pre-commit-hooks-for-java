#!/bin/bash
# Checkstyle hook - checks Java files
# Pre-commit framework ensures this only runs when Java files are staged

echo "Running Checkstyle..."

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
