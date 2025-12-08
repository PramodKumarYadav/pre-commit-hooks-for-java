package com.precommit.demo;

/** A simple calculator class for demonstration purposes. */
public class Calculator {

  /**
   * Adds two integers.
   *
   * @param a the first integer
   * @param b the second integer
   * @return the sum of a and b
   */
  public int add(int a, int b) {
    return a + b;
  }

  /**
   * Subtracts two integers.
   *
   * @param a the first integer
   * @param b the second integer
   * @return the difference of a and b
   */
  public int subtract(int a, int b) {
    return a - b;
  }

  /**
   * Multiplies two integers.
   *
   * @param a the first integer
   * @param b the second integer
   * @return the product of a and b
   */
  public int multiply(int a, int b) {
    return a * b;
  }

  /**
   * Divides two integers.
   *
   * @param a the dividend
   * @param b the divisor
   * @return the quotient of a divided by b
   * @throws ArithmeticException if b is zero
   */
  public int divide(int a, int b) {
    if (b == 0) {
      throw new ArithmeticException("Division by zero is not allowed");
    }
    return a / b;
  }
}
