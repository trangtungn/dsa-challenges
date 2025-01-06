# Array

- A sequence of elements stored in *contiguous memory* locations and can be accessed by *index*.
- Can be *fixed-size* or dynamic (resizable).
- Arrays provide O(1) access time to elements by index.

## Common operations:
- Access: O(1) - Get element at index i
- Search: O(n) - Find element in unsorted array
- Insert: O(n) - Need to shift elements
- Delete: O(n) - Need to shift elements
- Add to end: O(1) amortized for dynamic arrays

## Common use cases:
- Storing collections of items
- Implementing dynamic lists
- Implementing queues and stacks
- Implementing matrices and multidimensional arrays

## Dynamic Array
- starts with a preset capacity
- automatically resizes as needed

## Associative Array (Dictionary)
- often referred to as Map, Hash, or Dictionary
- key-value pairs, where the key is used to retrieve the value
- offers dynamic resizing and fast retrieval

    Example:
    ```ruby
    # Create a hash with key-value pairs
    hash = { "apple" => 1, "banana" => 2, "cherry" => 3 }

    # Access the value associated with "banana"
    puts hash["banana"]  # Output: 2
    ```

## The Dimensionality of an array
- 1D array: a single row of elements
- 2D array: a grid of elements, where each element is identified by two indices
- 3D array: a cube of elements, where each element is identified by three indices

## Sparse vs Dense arrays
1. Sparse arrays:
  - Most values are default (e.g., zero or null).
  - Drastically conserves memory by only allocating memory for non-default values.
  - Slower access times for most operations.
2. Dense arrays:
  - Most values are non-default (e.g., non-zero or non-null).
  - Allocates memory for every single element, even if the majority are zeros.
  - Faster access times for most operations.

    Example:
    ```ruby
    # Sparse Array:
    [0, 0, 3, 0, 0, 0, 0, 9, 0, 0]

    # Dense Array:
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    ```

## Appendix

### Dynamic Array Resizing Example:
- When a dynamic array (like ArrayList in Java or Vector in C++) needs to grow:
    1. Create new array with double the size
    2. Copy elements from old array to new array
    3. Delete old array
    4. Point to new array

- The complexity of dynamic array resizing (doubling):
  - Time Complexity:
    - Single Resize Operation: O(n) - because we need to copy all n elements to the new array
    - Amortized Cost per Insertion: O(1) - this is the interesting part!

      - Why O(1) Amortized? Let's break it down:

          1. Consider inserting n elements:

            ```
            Initial size: 1
            - Double to 2: copies 1 element
            - Double to 4: copies 2 elements
            - Double to 8: copies 4 elements
            - Double to 16: copies 8 elements
            ...and so on
            ```

          2. Total number of copies after n insertions:
            ```
            1 + 2 + 4 + 8 + ... + n/2 ≈ n
            ```

          3. Therefore:
            ```
            Total work done = n (insertions) + n (copies) = 2n
            ```

          4. Amortized cost per operation = 2n/n = O(1)

    - Space Complexity:
      O(n): where n is the current number of elements

      Note: The array always maintains a size that's at most 2x the number of elements. This is why dynamic arrays (like ArrayList in Java or vector in C++) are so efficient for most use cases, despite occasional O(n) resizing operations

    Example:
    ```ruby
    # Initial array size 4
    arr = [1, 2, 3, 4]  # array is full

    # Need to add 5
    # 1. Create new array size 8
    new_arr = [1, 2, 3, 4, nil, nil, nil, nil]

    # 2. Add new element
    new_arr[4] = 5

    # Result: [1, 2, 3, 4, 5, nil, nil, nil]

    # Time Complexity:
    # - Amortized O(1) for insertions
    # - Worst case O(n) when resize needed
    # Space Complexity:
    # - O(n) where n is current size
    ```
