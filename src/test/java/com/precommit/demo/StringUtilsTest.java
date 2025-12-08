package com.precommit.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

/** Test class for StringUtils. */
@DisplayName("StringUtils Tests")
class StringUtilsTest {

  private StringUtils stringUtils;

  @BeforeEach
  void setUp() {
    stringUtils = new StringUtils();
  }

  @Test
  @DisplayName("Should reverse a string")
  void testReverse() {
    String result = stringUtils.reverse("hello");
    assertEquals("olleh", result, "Reversing 'hello' should give 'olleh'");
  }

  @Test
  @DisplayName("Should return null when reversing null")
  void testReverseNull() {
    String result = stringUtils.reverse(null);
    assertNull(result, "Reversing null should return null");
  }

  @ParameterizedTest
  @ValueSource(strings = {"racecar", "noon", "level", "A man a plan a canal Panama"})
  @DisplayName("Should identify palindromes")
  void testIsPalindrome(String input) {
    assertTrue(stringUtils.isPalindrome(input), input + " should be a palindrome");
  }

  @ParameterizedTest
  @ValueSource(strings = {"hello", "world", "test"})
  @DisplayName("Should identify non-palindromes")
  void testIsNotPalindrome(String input) {
    assertFalse(stringUtils.isPalindrome(input), input + " should not be a palindrome");
  }

  @Test
  @DisplayName("Should return false for null palindrome check")
  void testIsPalindromeNull() {
    assertFalse(stringUtils.isPalindrome(null), "null should not be a palindrome");
  }

  @Test
  @DisplayName("Should count words in a sentence")
  void testCountWords() {
    int count = stringUtils.countWords("The quick brown fox");
    assertEquals(4, count, "Should count 4 words");
  }

  @Test
  @DisplayName("Should count words with multiple spaces")
  void testCountWordsMultipleSpaces() {
    int count = stringUtils.countWords("Hello    world");
    assertEquals(2, count, "Should count 2 words despite multiple spaces");
  }

  @Test
  @DisplayName("Should return 0 for null word count")
  void testCountWordsNull() {
    int count = stringUtils.countWords(null);
    assertEquals(0, count, "Word count of null should be 0");
  }

  @Test
  @DisplayName("Should return 0 for empty string word count")
  void testCountWordsEmpty() {
    int count = stringUtils.countWords("");
    assertEquals(0, count, "Word count of empty string should be 0");
  }

  @Test
  @DisplayName("Should convert to title case")
  void testToTitleCase() {
    String result = stringUtils.toTitleCase("hello world");
    assertEquals("Hello World", result, "Should convert to title case");
  }

  @Test
  @DisplayName("Should handle mixed case input")
  void testToTitleCaseMixedCase() {
    String result = stringUtils.toTitleCase("hELLo WoRLd");
    assertEquals("Hello World", result, "Should convert mixed case to title case");
  }

  @Test
  @DisplayName("Should return null for null title case input")
  void testToTitleCaseNull() {
    String result = stringUtils.toTitleCase(null);
    assertNull(result, "Title case of null should be null");
  }
}
