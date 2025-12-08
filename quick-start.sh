#!/bin/bash
# Quick start script for setting up pre-commit hooks for Java
# This script automates the entire setup process

echo "======================================"
echo "Pre-commit Hooks for Java - Quick Start"
echo "======================================"
echo ""

# Check if pre-commit is installed
echo "Step 1: Checking pre-commit installation..."
if ! command -v pre-commit &> /dev/null; then
    echo "   pre-commit not found. Installing..."
    pip install --user pre-commit
    if [ $? -eq 0 ]; then
        echo "   ✅ pre-commit installed successfully"
    else
        echo "   ❌ Failed to install pre-commit"
        exit 1
    fi
else
    echo "   ✅ pre-commit is already installed"
fi

echo ""

# Install git hooks
echo "Step 2: Installing git hooks..."
pre-commit install
if [ $? -eq 0 ]; then
    echo "   ✅ Git hooks installed successfully"
else
    echo "   ❌ Failed to install git hooks"
    exit 1
fi

echo ""

# Build the project
echo "Step 3: Building the project..."
mvn clean install -q
if [ $? -eq 0 ]; then
    echo "   ✅ Project built successfully"
else
    echo "   ❌ Build failed"
    exit 1
fi

echo ""

# Run pre-commit on all files
echo "Step 4: Running pre-commit hooks on all files..."
pre-commit run --all-files
if [ $? -eq 0 ]; then
    echo "   ✅ All hooks passed"
else
    echo "   ⚠️  Some hooks made changes or failed"
    echo "   Running hooks again to verify..."
    pre-commit run --all-files
    if [ $? -eq 0 ]; then
        echo "   ✅ All hooks passed after applying fixes"
    fi
fi

echo ""
echo "======================================"
echo "✅ Setup complete!"
echo "======================================"
echo ""
echo "What's next?"
echo "1. Make changes to Java files in src/"
echo "2. Stage your changes: git add ."
echo "3. Commit: git commit -m 'Your message'"
echo "4. Pre-commit hooks will run automatically!"
echo ""
echo "Useful commands:"
echo "  mvn test                    # Run tests"
echo "  mvn spotless:apply          # Format code"
echo "  mvn checkstyle:check        # Check code style"
echo "  pre-commit run --all-files  # Run all hooks manually"
echo "  ./verify-setup.sh           # Verify setup"
echo ""
