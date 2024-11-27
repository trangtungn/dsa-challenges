## Problem: Find the First Non-Repeating Character

Write a function, firstNonRepeatingChar, that takes a string as input and returns the first character in the string that does not repeat. If all characters are repeated, return null.

Example Inputs and Outputs:
```javascript
firstNonRepeatingChar("swiss"); // Output: "w"
firstNonRepeatingChar("success"); // Output: "u"
firstNonRepeatingChar("aabbcc"); // Output: null
```

Constraints:
- The input string will contain only lowercase English letters (a-z).
- The string will have at least one character.

Solution Template:

```javascript
function firstNonRepeatingChar(str) {
    // Your code here
}

// Example test cases
console.log(firstNonRepeatingChar("swiss"));    // Expected: "w"
console.log(firstNonRepeatingChar("success"));  // Expected: "u"
console.log(firstNonRepeatingChar("aabbcc"));   // Expected: null
```

Tips for Solving:
- Use a hash map (object) to count occurrences of each character.
- Iterate through the string again to find the first character with a count of 1.
- Focus on both correctness and efficiency.

This problem tests your understanding of string manipulation, hash maps, and algorithmic thinking—skills relevant in many JavaScript-focused roles.
