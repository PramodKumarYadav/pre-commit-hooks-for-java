# Testing Guide

This document provides examples of testing the pre-commit hooks functionality.

## Prerequisites

Ensure you have completed the setup:
```bash
./quick-start.sh
```

Or manually:
```bash
pip3 install pre-commit
pre-commit install
```

## Testing Pre-commit Hooks

### Test 1: Format Checking

Try committing a file with bad formatting:

```bash
# Create a badly formatted file
cat > src/main/java/com/precommit/demo/Test.java << 'JAVA'
package com.precommit.demo;
public class Test{
    public void   method(  )  {
        System.out.println(  "test"  );
    }
}
JAVA

# Try to commit it
git add src/main/java/com/precommit/demo/Test.java
git commit -m "Test bad formatting"

# Expected: Spotless hook will fail and show what needs to be fixed
```

### Test 2: Fixing Format Issues

```bash
# Apply formatting
mvn spotless:apply

# Stage the fixed file
git add src/main/java/com/precommit/demo/Test.java

# Commit should now succeed
git commit -m "Add properly formatted file"
```

### Test 3: Running Hooks Manually

```bash
# Run all hooks on all files
pre-commit run --all-files

# Run a specific hook
pre-commit run spotless-format-check --all-files
pre-commit run checkstyle --all-files

# Run hooks on specific files
pre-commit run --files src/main/java/com/precommit/demo/Calculator.java
```

### Test 4: Testing with Maven

```bash
# Run tests
mvn test

# Check formatting
mvn spotless:check

# Apply formatting
mvn spotless:apply

# Check code style
mvn checkstyle:check

# Full build with all checks
mvn clean verify
```

## Understanding Hook Behavior

### Lint-staged Style (Only Staged Files)

The hooks are configured to run only on staged files:

```bash
# Modify a file but don't stage it
echo "// comment" >> src/main/java/com/precommit/demo/Calculator.java

# Modify another file and stage it
echo "// test" >> src/main/java/com/precommit/demo/StringUtils.java
git add src/main/java/com/precommit/demo/StringUtils.java

# Try to commit
git commit -m "Test"

# Expected: Hooks only check StringUtils.java (the staged file)
# Calculator.java is not checked because it's not staged
```

## Common Scenarios

### Scenario 1: All Checks Pass

```bash
# Make a simple, properly formatted change
# Edit a file, ensure it's formatted
mvn spotless:apply
git add .
git commit -m "Your message"
# All hooks pass, commit succeeds
```

### Scenario 2: Formatting Violation

```bash
# Add a badly formatted file
git add src/main/java/com/precommit/demo/BadFile.java
git commit -m "Add file"
# Hook fails with formatting errors
# Fix: mvn spotless:apply
# Then: git add . && git commit -m "Add file"
```

### Scenario 3: Checkstyle Violation

```bash
# Add a file missing Javadoc
git add src/main/java/com/precommit/demo/NoJavadoc.java
git commit -m "Add file"
# Hook fails with checkstyle errors
# Fix: Add proper Javadoc comments
# Then: git add . && git commit -m "Add file"
```

## Verification Commands

```bash
# Verify entire setup
./verify-setup.sh

# Check Maven build
mvn clean verify

# Check tests
mvn test

# Check pre-commit installation
pre-commit --version

# Check installed hooks
ls -la .git/hooks/pre-commit
```

## Troubleshooting

### Hook Not Running

```bash
# Reinstall hooks
pre-commit uninstall
pre-commit install
```

### Hook Always Failing

```bash
# Clean Maven cache
mvn clean

# Reformat all files
mvn spotless:apply

# Re-run hooks
pre-commit run --all-files
```

### Bypass Hooks (Not Recommended)

```bash
# Only use in emergencies
git commit --no-verify -m "Emergency commit"
```

## Cleanup

To remove test files:
```bash
# Remove test files
rm src/main/java/com/precommit/demo/Test.java

# Restore repository state
git restore .
git clean -fd
```
