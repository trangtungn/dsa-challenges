
# Easy

## Two Sum

Easy - Companies

Given an array of integers nums and an integer target, return *indices of the two numbers such that they add up to target.*
You may assume that each input would have ***exactly*** one solution, and you may not use the *same* element twice.
You can return the answer in any order.
 
Example 1:

    Input: nums = [2,7,11,15], target = 9
    Output: [0,1]
    Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:

    Input: nums = [3,2,4], target = 6
    Output: [1,2]

Example 3:

    Input: nums = [3,3], target = 6
    Output: [0,1]
   
Constraints:

  * 2 <= nums.length <= 104
  * -109 <= nums[i] <= 109
  * -109 <= target <= 109
  * Only one valid answer exists.
 
Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?

## Verifying an Alien Dictionary

In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.
 
Example 1:

    Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
    Output: true
    Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.

Example 2:

    Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
    Output: false
    Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.

Example 3:

    Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
    Output: false
    Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
 
Constraints:

  * 1 <= words.length <= 100
  * 1 <= words[i].length <= 20
  * order.length == 26
  * All characters in words[i] and order are English lowercase letters.