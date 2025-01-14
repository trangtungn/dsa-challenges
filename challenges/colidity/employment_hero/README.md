# Year of the Rabit Challenge

## Dinner

**Find the shortest rotation required of a round table with dishes, so that each person at the table receives a dish they like.**

There are N people sitting at a round table, having dinner. They are numbered from 0 to N-1 in clockwise order. Initially, each person has a dish on the table in front of them. Person number K does not like the taste of A[K], but has a dish of taste B[K]. We want every person to have a dish of a taste that they do not dislike, i.e. A[K] ≠ B[K] for each K from 0 to N-1.

In order to achieve this, you can rotate the whole table clockwise by one position any number of times. Rotating the table corresponds to moving the last element of B to the beginning. For example, given A = [3, 6, 4, 5] and B = [2, 6, 3, 5], if we rotate the table once, we would obtain B = [5, 2, 6, 3].

Find the minimum number of table rotations that need to be performed in order to satisfy every person.

Write a function:

    def solution(a, b)

that, given arrays A and B, both consisting of N integers, representing tastes that people do not like and the taste of their dishes, respectively, returns the minimum number of table rotations required so that every person has a dish whose taste they do not dislike. In particular, if no rotations are needed, the function should return 0. If fulfilling the above condition is impossible, the function should return -1.

Examples:

  1. Given A = [1, 3, 5, 2, 8, 7] and B = [7, 1, 9, 8, 5, 7], your function should return 2. After rotating the table twice, we obtain B = [5, 7, 7, 1, 9, 8], so A[K] ≠ B[K] for every K from 0 to 5. If we rotated the table once, we would obtain B = [7, 7, 1, 9, 8, 5], which does not fulfil the condition, since A[4] = B[4] = 8. If we did not rotate the table at all, there would be A[5] = B[5] = 7. Note that rotating the table three times gives us B = [8, 5, 7, 7, 1, 9], which fulfils the condition too, but is not minimal.

  2. Given A = [1, 1, 1, 1] and B = [1, 2, 3, 4], your function should return -1. It is impossible to rotate the table so that every person is satisfied. Someone will always have a dish of taste 1.

  3. Given A = [3, 5, 0, 2, 4] and B = [1, 3, 10, 6, 7], your function should return 0. No rotation is needed to ensure that A[K] ≠ B[K].

Assume that:

  - N is an integer within the range [1..300];
  - each element of arrays A and B is an integer within the range [0..1,000];
  - arrays A and B have equal sizes.

In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.

# Entrance Test to Employment Hero

## This is a demo task.

Write a function:

    def solution(a)

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an efficient algorithm for the following assumptions:

  N is an integer within the range [1..100,000];
  each element of array A is an integer within the range [−1,000,000..1,000,000].

## Task 1

Write a function solution(x, y) that, given a string x and a string y, returns a boolean that checks whether all of the characters in the string y exist at some point in the string x. Furthermore, the characters from y need to occur in the same order in x. There may be additional characters in string x, so long as each character from y appears and the order is maintained.

If all of the characters from y appear in x in the correct order return the boolean true, otherwise return false

Both of the input strings will consist of alpha-numeric characters only. The length of the strings may be quite large so performance should be a consideration for your solution.

Example 1

    x= "ABCD" y = "AC"

Result=true

The expected result is true because "A" and "C" both appear in "ABCD" and in that order.

Example 2

    x = "ABCD" y = "CA"

Result false

The expected result is false because even though "C" and "A" both appear in "ABCD" the order is in x is different to y.

Example 3

    x="ABCAD y = "BA"

Result true

The expected result is true because "B" and "A" both appear in "ABCAD". Note, the first "A" appears before the "B" but then there is a subsequent "A" so the result should be true.

## Task 3*

Write a function that receives an array of strings that represent friend connections along with the names of two people and retuns a number representing the degrees of separation between the two people.

The connections will be represented by an array of strings with each string taking the format name1:name2 for examples alice:bob. You can assume that the strings representing the connections will always be lower case a-z only.

The names of the people to find the degrees of separation between will always be non-empty strings e.g. "alice" or "bob".

Your function will return the number of degrees of separation between the two people. If no connection can be made through friends or friends of friends etc then return -1.

Example 1

  connections = ["fred:joe", "joe:mary", "mary:fred", "mary:bill"]

  name1 = "fred"
  name2 = "bill"

Result = 2

The expected result is 2 because fred is friends with mary, and mary is friends with bill. That is, bill is of distance 2 from fred.

Test Output

    fred > mary > bill (fred -> mary = 1, mary -> bill = 2)

Example 2

    connections= ["fred:joe", "joe:mary", "kate:sean", "sean:sally"]
    name1 = "fred"
    name2 = "sally"

Result -1

The expected result is -1 because there are no connections that link fred to sally through either his friends or friends of friends etc.

## Task 4

There are two-letter strings, "AA", "AB", and "BB", which appear AA, AB, and BB times respectively. The task is to join some of these strings to create the longest possible string which does not contain "AAA" or "BBB".

For example, having AA = 5, AB = 0, and BB = 2, it is possible to join five strings by taking both of the "BB" strings and three of the "AA" strings. Then they can be joined into "AA-BB-AA-BB-AA" → "AABBAABBAA".

Note that it is not possible to add another "AA" string as the result would then contain "AAA".

Write a function:

```ruby
def solution(aa, ab, bb)
```

That, given three integers AA, AB, and BB, returns the longest string that can be created according to the rules described above. If there is more than one possible answer, the function may return any of them.

Examples:
1. Given AA = 5, AB = 0, and BB = 2, the function should return "AABBAABBAA", as explained above.

2. Given AA = 1, AB = 2, and BB = 1, possible results are "BBABABAA", "ABAABBAB", "ABABAABB", or "AABBABAB".

3. Given AA = 0, AB = 2, and BB = 0, the function should return "ABAB".

4. Given AA = 0, AB = 0, and BB = 10, the function should return "BB".

Assumptions:

- AA, AB, and BB are integers within the range [0, 10].
- The resulting string will not be empty.

In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.

## Task 6

You are given N fractions, numbered from 0 to N-1. Your task is to count the number of occurrences of the fraction that appears most often.

Notice that two fractions may be equal even if they have different representations; for example, 3/5 and 6/10 are equal.  

You should not assume that floating point operations are precise.

Write a function:

```ruby
def solution(x, y)
```

that, given two arrays X and Y consisting of N integers each (which represent the K-th fraction as X[K]/Y[K]), returns the number of occurrences of the fraction that appears most often.  

Examples:

Given arrays X=[1,2,3,4,0], Y=[2,3,6,8,4] the function should return 3, as fractions 1/2, 3/6, 4/8 are all equal to each other.

Given arrays X=[3,3,4], Y=[5,4,3], the function should return 1, as no two fractions are equal.

Given arrays X=[4,4,7,1,2] Y=[4,4,8,1,2], the function should return 4, as fractions 4/4, 4/4, 1/1, 2/2 are all equal to each other.

Given arrays X=[1,2,3,1,2], Y=[2,4,6,5,10] the function should return 3, as fractions 1/2, 2/4, 3/6 are all equal to each other.

Write an efficient algorithm for the following assumptions:  

N is an integer within the range [1..100,000);
each element of array X is an integer within the range [0..2,000,000,000)
each element of array Y is an integer within the range [1..2,000,000,000)
arrays X and Y are of equal length.

## Task 7 - possible task

Problem Description:

1. Input:
  - A string of digits (0-9) representing a sequence entered on a numeric keypad.
  - A predefined dictionary of valid words.
2. Output:
  - A list of all valid words from the dictionary that can be formed using the given numeric input.
3. Constraints:
  - The mapping between digits and letters is based on the classic T9 keypad:

    ```
    2 → "abc"
    3 → "def"
    4 → "ghi"
    5 → "jkl"
    6 → "mno"
    7 → "pqrs"
    8 → "tuv"
    9 → "wxyz"
    ```

  - Only the digits 2-9 are valid for input (since 1 and 0 don’t map to any letters).
  - The dictionary can contain thousands of words.

    Example 1:

    Input:

    Digits: "228"
    Dictionary: ["cat", "bat", "rat", "cab", "tree", "used"]

    Output:

    ["cat", "cab"]

  Explanation:
  - The digit 2 maps to ['a', 'b', 'c'], digit 8 maps to ['t', 'u', 'v'].
  - Possible word combinations: ["cat", "cab", "bat"].
  - Only ["cat", "cab"] are valid words in the dictionary.

## Task 8 - possible task
Given an array with n integers, return  all numbers with x number of unique digits, where 1 <= x =< 2.

Example 1:

Input: [11221, 1223, 11, 22, 1122, 44, 1234, 123]
Output: 91
Explanation: The answer should be 4 because these number satisfy the constraint mentioned above [11221, 11, 22, 1122]

Consider the efficiency, time and space complexity and the correctness.
