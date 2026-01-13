# pre-commit-hooks-for-java

A repository demonstrating pre-commit hooks for Java projects with Maven, JUnit 5, Spotless (google-java-format), and Checkstyle.

## 🚀 Features

- **Maven** project structure with JDK 11 compatibility
- **JUnit 5** (latest version) for testing with parameterized tests
- **Spotless** with google-java-format for automatic code formatting
- **Checkstyle** with Google Java Style checks
- **Pre-commit hooks** with lint-staged style functionality (runs only on staged files)
- **Dummy test classes** to demonstrate the setup

## 📋 Prerequisites

- Java 11 or higher
- Maven 3.6 or higher
- Python 3.6+ (for pre-commit framework)
- pip3 (Python package manager)

## 🛠️ Setup

### Quick Setup (Recommended)

Run the automated setup script:

```bash
./quick-start.sh
```

This will automatically:
1. Install pre-commit (if not already installed)
2. Install git hooks
3. Build the project
4. Run pre-commit hooks on all files

### Manual Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd pre-commit-hooks-for-java
```

### 2. Install pre-commit framework

```bash
pip3 install pre-commit
```

### 3. Install the git hook scripts

```bash
pre-commit install
```

### 4. Verify the setup

```bash
./verify-setup.sh
```

This script will:
- Check if pre-commit is installed
- Check if git hooks are installed
- Verify Maven and Java installations
- Run all tests
- Run pre-commit hooks on all files

### 5. (Optional) Run hooks manually on all files

```bash
pre-commit run --all-files
```

## 🏗️ Project Structure

```
pre-commit-hooks-for-java/
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── precommit/
│   │               └── demo/
│   │                   ├── Calculator.java      # Simple calculator class
│   │                   └── StringUtils.java     # String utility class
│   └── test/
│       └── java/
│           └── com/
│               └── precommit/
│                   └── demo/
│                       ├── CalculatorTest.java  # JUnit 5 tests for Calculator
│                       └── StringUtilsTest.java # JUnit 5 tests for StringUtils
├── hooks/
│   ├── spotless-hook.sh      # Spotless formatting check hook
│   └── checkstyle-hook.sh    # Checkstyle check hook
├── pom.xml                   # Maven configuration
├── .pre-commit-config.yaml   # Pre-commit hooks configuration
├── verify-setup.sh           # Setup verification script
└── README.md
```

## 🧪 Running Tests

```bash
# Run all tests
mvn test

# Run tests with coverage
mvn clean test

# Run a specific test class
mvn test -Dtest=CalculatorTest
```

## 🎨 Code Formatting

### Spotless with google-java-format

```bash
# Check formatting
mvn spotless:check

# Apply formatting
mvn spotless:apply
```

## ✅ Code Style Checking

### Checkstyle with Google Java Style

```bash
# Run checkstyle
mvn checkstyle:check
```

## 🔧 Build Commands

```bash
# Clean and compile
mvn clean compile

# Package the application
mvn clean package

# Run full build with all checks
mvn clean verify
```

## 🪝 Pre-commit Hooks

The project uses pre-commit hooks to ensure code quality before commits. The hooks include:

### Standard Hooks
- **trailing-whitespace**: Removes trailing whitespace
- **end-of-file-fixer**: Ensures files end with a newline
- **check-yaml**: Validates YAML file syntax
- **check-added-large-files**: Prevents committing large files
- **check-merge-conflict**: Checks for merge conflict markers
- **mixed-line-ending**: Ensures consistent line endings

### Java-specific Hooks (Lint-staged Style)
- **Spotless Format Check**: Runs google-java-format on staged Java files only
- **Checkstyle**: Runs Google Java Style checks on staged Java files only

### How Pre-commit Hooks Work

1. When you run `git commit`, pre-commit automatically runs configured hooks
2. Java hooks only check **staged files** (similar to lint-staged in Node.js)
3. If any hook fails, the commit is blocked
4. Fix the issues and try committing again

### Manual Hook Execution

```bash
# Run all hooks on all files
pre-commit run --all-files

# Run a specific hook
pre-commit run spotless-format-check --all-files
pre-commit run checkstyle --all-files

# Run hooks on specific files
pre-commit run --files src/main/java/com/precommit/demo/Calculator.java
```

## 📝 Example Workflow

1. Make changes to Java files
2. Stage your changes:
   ```bash
   git add src/main/java/com/precommit/demo/Calculator.java
   ```
3. Try to commit:
   ```bash
   git commit -m "Add new calculation method"
   ```
4. Pre-commit hooks run automatically on staged files
5. If formatting issues are found:
   ```bash
   mvn spotless:apply
   git add .
   git commit -m "Add new calculation method"
   ```

## 🧩 Test Classes

### Calculator
A simple calculator demonstrating:
- Basic arithmetic operations (add, subtract, multiply, divide)
- Exception handling (division by zero)
- Javadoc documentation

### StringUtils
A string utility class demonstrating:
- String manipulation (reverse, palindrome check)
- Word counting
- Title case conversion

### Test Features
- JUnit 5 annotations (`@Test`, `@BeforeEach`, `@DisplayName`)
- Parameterized tests (`@ParameterizedTest`, `@CsvSource`, `@ValueSource`)
- Assertions (`assertEquals`, `assertThrows`, `assertTrue`, `assertFalse`)
- Test organization with nested test classes

## 🔍 Configuration Details

### Maven Plugins

- **maven-compiler-plugin**: Compiles Java code with JDK 11
- **maven-surefire-plugin**: Runs JUnit tests
- **spotless-maven-plugin**: Formats code with google-java-format
- **maven-checkstyle-plugin**: Validates code style with Google Java Style

### JUnit 5 Dependencies

- `junit-jupiter-api`: JUnit 5 API for writing tests
- `junit-jupiter-engine`: JUnit 5 test engine
- `junit-jupiter-params`: Parameterized tests support

## 🎯 Key Features of This Setup

1. **Lint-staged Style**: Pre-commit hooks only run on staged files, not the entire codebase
2. **Fast Feedback**: Catches formatting and style issues before they enter version control
3. **Consistent Code Style**: Enforces Google Java Style automatically
4. **Comprehensive Testing**: Demonstrates various JUnit 5 features
5. **Easy to Extend**: Simple to add more hooks or modify existing ones

## 🤝 Contributing

When contributing to this repository:

1. Ensure all tests pass: `mvn test`
2. Format your code: `mvn spotless:apply`
3. Check code style: `mvn checkstyle:check`
4. Commit your changes (pre-commit hooks will run automatically)

## 📄 License

See LICENSE file for details.

## 🔗 Useful Links

- [Pre-commit Framework](https://pre-commit.com/)
- [Spotless](https://github.com/diffplug/spotless)
- [Checkstyle](https://checkstyle.org/)
- [JUnit 5](https://junit.org/junit5/)
- [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)

## Appendix
remove this. only for testing.
