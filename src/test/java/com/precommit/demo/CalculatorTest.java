package com.precommit.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

/** Test class for Calculator. */
@DisplayName("Calculator Tests")
class CalculatorTest {

  private Calculator calculator;

  @BeforeEach
  void setUp() {
    calculator = new Calculator();
  }

  @Test
  @DisplayName("Should add two positive numbers")
  void testAddPositiveNumbers() {
    int result = calculator.add(5, 3);
    assertEquals(8, result, "5 + 3 should equal 8");
  }

  @Test
  @DisplayName("Should add negative numbers")
  void testAddNegativeNumbers() {
    int result = calculator.add(-5, -3);
    assertEquals(-8, result, "-5 + -3 should equal -8");
  }

  @ParameterizedTest(name = "{0} + {1} = {2}")
  @CsvSource({"0, 0, 0", "1, 1, 2", "10, 5, 15", "-5, 5, 0"})
  @DisplayName("Should add various number combinations")
  void testAddParameterized(int a, int b, int expected) {
    assertEquals(expected, calculator.add(a, b));
  }

  @Test
  @DisplayName("Should subtract two numbers")
  void testSubtract() {
    int result = calculator.subtract(10, 4);
    assertEquals(6, result, "10 - 4 should equal 6");
  }

  @Test
  @DisplayName("Should multiply two numbers")
  void testMultiply() {
    int result = calculator.multiply(6, 7);
    assertEquals(42, result, "6 * 7 should equal 42");
  }

  @Test
  @DisplayName("Should divide two numbers")
  void testDivide() {
    int result = calculator.divide(20, 4);
    assertEquals(5, result, "20 / 4 should equal 5");
  }

  @Test
  @DisplayName("Should throw exception when dividing by zero")
  void testDivideByZero() {
    Exception exception =
        assertThrows(
            ArithmeticException.class,
            () -> calculator.divide(10, 0),
            "Division by zero should throw ArithmeticException");

    assertEquals("Division by zero is not allowed", exception.getMessage());
  }
}
