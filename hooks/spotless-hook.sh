#!/bin/bash
# Spotless hook - formats Java files
# Pre-commit framework ensures this only runs when Java files are staged

echo "Running Spotless format apply..."

# Run Spotless apply
mvn spotless:apply -q

if [ $? -ne 0 ]; then
  echo ""
  echo "❌ Spotless format apply failed!"
  echo "Run 'mvn spotless:apply' to fix formatting issues."
  exit 1
fi

echo "✅ Spotless format apply passed!"
exit 0
