# Maximum slice problem

## MaxProfit

*Easy*

**Given a log of stock prices compute the maximum possible earning.**

An array A consisting of N integers is given. It contains daily prices of a stock share for a period of N consecutive days. If a single share was bought on day P and sold on day Q, where 0 ≤ P ≤ Q < N, then the profit of such transaction is equal to A[Q] − A[P], provided that A[Q] ≥ A[P]. Otherwise, the transaction brings loss of A[P] − A[Q].

For example, consider the following array A consisting of six elements such that:

    A[0] = 23171
    A[1] = 21011
    A[2] = 21123
    A[3] = 21366
    A[4] = 21013
    A[5] = 21367

If a share was bought on day 0 and sold on day 2, a loss of 2048 would occur because A[2] − A[0] = 21123 − 23171 = −2048. If a share was bought on day 4 and sold on day 5, a profit of 354 would occur because A[5] − A[4] = 21367 − 21013 = 354. Maximum possible profit was 356. It would occur if a share was bought on day 1 and sold on day 5.

Write a function,

    def solution(a)

that, given an array A consisting of N integers containing daily prices of a stock share for a period of N consecutive days, returns the maximum possible profit from one transaction during this period. The function should return 0 if it was impossible to gain any profit.

For example, given array A consisting of six elements such that:

    A[0] = 23171
    A[1] = 21011
    A[2] = 21123
    A[3] = 21366
    A[4] = 21013
    A[5] = 21367

the function should return 356, as explained above.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [0..400,000];
  - each element of array A is an integer within the range [0..200,000].

## MaxSliceSum

*Easy*

**Find a maximum sum of a compact subsequence of array elements.**

A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The sum of a slice (P, Q) is the total of A[P] + A[P+1] + ... + A[Q].

Write a function:

    def solution(a)

that, given an array A consisting of N integers, returns the maximum sum of any slice of A.

For example, given array A such that:

  A[0] = 3  A[1] = 2  A[2] = -6
  A[3] = 4  A[4] = 0

the function should return 5 because:

  - (3, 4) is a slice of A that has sum 4,
  - (2, 2) is a slice of A that has sum −6,
  - (0, 1) is a slice of A that has sum 5,
  - no other slice of A has sum greater than (0, 1).

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [1..1,000,000];
  - each element of array A is an integer within the range [−1,000,000..1,000,000];
  - the result will be an integer within the range [−2,147,483,648..2,147,483,647].

## MaxDoubleSliceSum

*Medium*

**Find the maximal sum of any double slice.**

A non-empty array A consisting of N integers is given.

A triplet (X, Y, Z), such that 0 ≤ X < Y < Z < N, is called a double slice.

The sum of double slice (X, Y, Z) is the total of A[X + 1] + A[X + 2] + ... + A[Y − 1] + A[Y + 1] + A[Y + 2] + ... + A[Z − 1].

For example, array A such that:

    A[0] = 3
    A[1] = 2
    A[2] = 6
    A[3] = -1
    A[4] = 4
    A[5] = 5
    A[6] = -1
    A[7] = 2
contains the following example double slices:

  - double slice (0, 3, 6), sum is 2 + 6 + 4 + 5 = 17,
  - double slice (0, 3, 7), sum is 2 + 6 + 4 + 5 − 1 = 16,
  - double slice (3, 4, 5), sum is 0.

The goal is to find the maximal sum of any double slice.

Write a function:

    def solution(a)

that, given a non-empty array A consisting of N integers, returns the maximal sum of any double slice.

For example, given:

    A[0] = 3
    A[1] = 2
    A[2] = 6
    A[3] = -1
    A[4] = 4
    A[5] = 5
    A[6] = -1
    A[7] = 2
the function should return 17, because no double slice of array A has a sum of greater than 17.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [3..100,000];
  - each element of array A is an integer within the range [−10,000..10,000].

## MinDoubleSliceSum

*Medium*

**Find the minimal sum.**
An array A consisting of N integers is given. The elements of array A together represent a chain and each element represents the strength of each link in the chain. We want to divide this chain.
All we can do is to break the chain in exactly two non-adjacent positions. More precisely, we should break links P, Q (0 < P < Q < N - 1, Q - P > 1), resulting in three chains. The total cost of this operation is equal to A[P] + A[Q].

For example, given array A such that:

    A[0] = 5
    A[1] = 2
    A[2] = 4
    A[3] = 6
    A[4] = 3
    A[5] = 7

We can choose to break the following links:

  - (1, 3), cost is 2 + 6 = 8,
  - (1, 4), cost is 2 + 3 = 5,
  - (2, 3), cost is 4 + 6 = 10.

The minimal cost is 5.

Write a function:

    def solution(a)

that, given an array A consisting of N integers, returns the minimal cost of dividing chain into three pieces.
For example, given array A such that:

    A[0] = 5
    A[1] = 2
    A[2] = 4
    A[3] = 6
    A[4] = 3
    A[5] = 7
the function should return 5, as explained above.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [5..100,000];
  - each element of array A is an integer within the range [1..1,000,000,000].

**Hint:** https://www.geeksforgeeks.org/smallest-sum-contiguous-subarray/

## References

- [Maximum Subarray Sum – Kadane’s Algorithm](https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/)
- [Smallest sum contiguous subarray] (https://www.geeksforgeeks.org/smallest-sum-contiguous-subarray/)
