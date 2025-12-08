#!/bin/bash
# Script to verify pre-commit hooks setup
# This script checks that the pre-commit hooks are properly installed and working

echo "======================================"
echo "Pre-commit Hooks Verification Script"
echo "======================================"
echo ""

# Check if pre-commit is installed
echo "1. Checking if pre-commit is installed..."
if command -v pre-commit &> /dev/null; then
    echo "   ✅ pre-commit is installed: $(pre-commit --version)"
else
    echo "   ❌ pre-commit is not installed"
    echo "   Install it with: pip install pre-commit"
    exit 1
fi

echo ""

# Check if hooks are installed
echo "2. Checking if git hooks are installed..."
if [ -f ".git/hooks/pre-commit" ]; then
    echo "   ✅ Git hooks are installed"
else
    echo "   ❌ Git hooks are not installed"
    echo "   Install them with: pre-commit install"
    exit 1
fi

echo ""

# Check Maven
echo "3. Checking Maven installation..."
if command -v mvn &> /dev/null; then
    echo "   ✅ Maven is installed: $(mvn --version | head -n 1)"
else
    echo "   ❌ Maven is not installed"
    exit 1
fi

echo ""

# Check Java
echo "4. Checking Java installation..."
if command -v java &> /dev/null; then
    echo "   ✅ Java is installed: $(java -version 2>&1 | head -n 1)"
else
    echo "   ❌ Java is not installed"
    exit 1
fi

echo ""

# Run tests
echo "5. Running Maven tests..."
mvn test -q
if [ $? -eq 0 ]; then
    echo "   ✅ All tests passed"
else
    echo "   ❌ Tests failed"
    exit 1
fi

echo ""

# Run pre-commit on all files
echo "6. Running pre-commit hooks on all files..."
pre-commit run --all-files
if [ $? -eq 0 ]; then
    echo "   ✅ All pre-commit hooks passed"
else
    echo "   ⚠️  Some hooks made changes or failed"
    echo "   This is expected if files needed formatting"
fi

echo ""
echo "======================================"
echo "✅ Setup verification complete!"
echo "======================================"
echo ""
echo "Your pre-commit hooks are ready to use!"
echo "They will automatically run on 'git commit'"
echo ""
