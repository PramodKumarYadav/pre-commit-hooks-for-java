package com.precommit.demo;

import java.util.ArrayList;
import java.util.List;

/** A simple string utility class for demonstration purposes. */
public class StringUtils {

  /**
   * Reverses a string.
   *
   * @param input the string to reverse
   * @return the reversed string
   */
  public String reverse(String input) {
    if (input == null) {
      return null;
    }
    return new StringBuilder(input).reverse().toString();
  }

  /**
   * Checks if a string is a palindrome.
   *
   * @param input the string to check
   * @return true if the string is a palindrome, false otherwise
   */
  public boolean isPalindrome(String input) {
    if (input == null) {
      return false;
    }
    String cleaned = input.toLowerCase().replaceAll("[^a-z0-9]", "");
    return cleaned.equals(new StringBuilder(cleaned).reverse().toString());
  }

  /**
   * Counts the number of words in a string.
   *
   * @param input the string to count words in
   * @return the number of words
   */
  public int countWords(String input) {
    if (input == null || input.trim().isEmpty()) {
      return 0;
    }
    String[] words = input.trim().split("\\s+");
    return words.length;
  }

  /**
   * Converts a string to title case.
   *
   * @param input the string to convert
   * @return the string in title case
   */
  public String toTitleCase(String input) {
    if (input == null || input.isEmpty()) {
      return input;
    }

    String[] words = input.toLowerCase().split("\\s+");
    List<String> titleCasedWords = new ArrayList<>();

    for (String word : words) {
      if (!word.isEmpty()) {
        String titleCased = word.substring(0, 1).toUpperCase() + word.substring(1);
        titleCasedWords.add(titleCased);
      }
    }

    return String.join(" ", titleCasedWords);
  }
}
