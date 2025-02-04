## FindOppositeNumber

*Easy*

Write a function solution that, given an array A of N integers, returns the largest integer K > 0 such that both values K and -K (the opposite number) exist in array A. If there is no such integer, the function should return 0.

Examples:

1. Given A = [3, 2, -2, 5, -3], the function should return 3 (both 3 and -3 exist in array A).

2. Given A = [1, 1, 2, -1, 2, -1], the function should return 1 (both 1 and -1 exist in array A).

3. Given A = [1, 2, 3, -4], the function should return 0 (there is no such K for which both values K and -K exist in array A).

Write an efficient algorithm for the following assumptions:

• N is an integer within the range [1..100,000];

each element of array A is an integer within the range [-1,000,000,000..1,000,000,000].

## MaxNumberOfSeatsOnFlight

*Medium*

![Cinema Seat Allocation](../../../assets/images/cinema-seat-allocation-1.png)

A cinema has n rows of seats, numbered from 1 to n and there are ten seats in each row, labelled: [A, B, C, D, E, F, G, H, I, J].

Given the string reservedSeats containing the codes of seats already reserved, for example, reservedSeats = "3H" means the seat located in row 3 and labelled with H is already reserved.

Return the maximum number of four-person groups you can assign on the cinema seats. A four-person group occupies four adjacent seats in one single row. Seats across an aisle (such as "3C" and "3D") are not considered to be adjacent, but there is an exceptional case on which an aisle split a four-person group, in that case, the aisle split a four-person group in the middle, which means to have two people on each side.

Example 1:

![Cinema Seat Allocation](../../../assets/images/cinema-seat-allocation-2.png)

Input: n = 3, reservedSeats = "1B 1C 1H 2F 3A 3J"
Output: 4
Explanation: The figure above shows the optimal allocation for four groups, where seats mark with blue are already reserved and contiguous seats mark with orange are for one group.
Example 2:

Input: n = 2, reservedSeats = "2A 1H 2F"
Output: 2
Example 3:

Input: n = 4, reservedSeats = "4C 1D 4F 1G"
Output: 4

Constraints:

1 <= n <= 40
0 <= reservedSeats.length <= 1909


## MinDoubleSliceSum

*Medium*

**Find the minimal sum by double slice.**
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
