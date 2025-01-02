# Cracking the Coding Interview, 6th Edition

## Interview Questions

### Hash Tables
- A hash table is a data structure that maps keys to values for highly efficient lookup.
- Hash tables are used to implement associative arrays, dynamic sets,hash maps and hash sets.
- Common operations:
  - Insert: Add a key-value pair to the hash table
  - Delete: Remove a key-value pair from the hash table
  - Search: Find the value associated with a key
- Common use cases:
  - Caching
  - Database indexing
  - Symbol tables in compilers
  - Router tables in networking

#### Operations:
- To insert a key-value pair: use an array of linked lists and a hash code function
    1. compute the key's hash code, e.g. "aa" -> 123
    2. map the hash code to an index in the array: use modulo operator, e.g. 123 % 64 = 23, where 64 is the size of the array
    3. store the key-value pair at the index. At this index, we have a linked list of key-value pairs.

    To retrieve the value, repeat this process: compute the hash code of the key, map it to an index, and retrieve the linked list at that index. The lookup is O(1) because we only need to traverse the linked list at the index. However, if the number of collisions is high, the lookup can be O(n).

    Example:
    ```
    Array size: 8
    Strings to hash: ["cat", "dog", "rat", "art"]

    Simplified hash function: sum of ASCII values % array_size

    "cat" -> (99 + 97 + 116) % 8 = 312 % 8 = 0
    "dog" -> (100 + 111 + 103) % 8 = 314 % 8 = 2
    "rat" -> (114 + 97 + 116) % 8 = 327 % 8 = 7
    "art" -> (97 + 114 + 116) % 8 = 327 % 8 = 7  // Notice collision with "rat"

    Final array structure:
    [0] -> ["cat"]
    [1] -> []
    [2] -> ["dog"]
    [3] -> []
    [4] -> []
    [5] -> []
    [6] -> []
    [7] -> ["rat"] -> ["art"]  // Collision handled by linked list
    ```

### Arrays and Resizable Arrays

- An array is a sequence of elements stored in contiguous memory locations.
- Arrays can be fixed-size or dynamic (resizable).
- Arrays provide O(1) access time to elements by index.
- Common operations:
  - Access: O(1) - Get element at index i
  - Search: O(n) - Find element in unsorted array
  - Insert: O(n) - Need to shift elements
  - Delete: O(n) - Need to shift elements
  - Add to end: O(1) amortized for dynamic arrays
- Common use cases:
  - Storing collections of items
  - Implementing dynamic lists
  - Implementing queues and stacks
  - Implementing matrices and multidimensional arrays

- Dynamic Array Resizing Example:
    When a dynamic array (like ArrayList in Java or Vector in C++) needs to grow:
    1. Create new array with double the size
    2. Copy elements from old array to new array
    3. Delete old array
    4. Point to new array

    The complexity of dynamic array resizing (doubling):
    - Time Complexity:
        - Single Resize Operation: O(n) - because we need to copy all n elements to the new array
        - Amortized Cost per Insertion: O(1) - this is the interesting part!
    - Why O(1) Amortized?
        Let's break it down:
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

        O(n) where n is the current number of elements
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
  ```

  - Time Complexity:
    - Amortized O(1) for insertions
    - Worst case O(n) when resize needed
  - Space Complexity:
    - O(n) where n is current size

Problems:

1. Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you
cannot use additional data structures?
    Hints: #44, #117, #132

2. Check Permutation: Given two strings, write a method to decide if one is a permutation of the
other.
    Hints: f t , #84, #122, #131

3. URLify: Write a method to replace all spaces in a string with '%20'. You may assume that the string
has sufficient space at the end to hold the additional characters, and that you are given the "true"
length of the string. (Note: If implementing in Java, please use a character array so that you can
perform this operation in place.)
    EXAMPLE
    Input: "Mr 3ohn S m i t h 13
    Output: "Mr%203ohn%20Smith"
    Hints: #53,0118

4. Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palin-
drome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation
is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
    EXAMPLE
    Input: T a c t Coa
    Output: True (permutations: "taco cat", "atco eta", etc.)
    Hints: #106, h 0134, § 136

5. One Away: There are three types of edits that can be performed on strings: insert a character,
remove a character, or replace a character. Given two strings, write a function to check if they are
one edit (or zero edits) away.
    EXAMPLE
    pale, pie -> true
    pales, pale -> true
    pale, bale -> true
    pale, bake -> false
    Hints: #23, #97, it 130

6. String Compression: Implement a method to perform basic string compression using the counts
of repeated characters. For example, the string aabcccccaaa would become a2blc5a3, If the
"compressed" string would not become smaller than the original string, your method should return
the original string. You can assume the string has only uppercase and lowercase letters (a - z).
    Hints: #92, if 110

7. Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4
bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
    Hints: «51,0100

8. Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and
column are set to 0.
    Hints: #17, #74, #102

9. String Rotation; Assume you have a method i s S u b s t r i n g which checks if one word is a substring
of another. Given two strings, si and s2, write code to check if s2 is a rotation of si using only one
call to i s S u b s t r i n g [e.g., " w a t e r b o t t l e " is a rotation o P ' e r b o t t l e w a t " ) ,
Hints: #34, #88,#W4

Additional Questions: Object-Oriented Design (#7.12), Recursion (#8.3), Sorting and Searching (#10.9), C++
(#12.11), Moderate Problems (#16.8, #16.17, #16,22), Hard Problems (#17.4, #17.7, #17.13, #17.22, #17,26).

### Linked Lists

- A linked list is a linear data structure where each element is a separate object, called a node.
- Each node contains a reference to the next node in the list.
- The list is terminated by a null reference.
- Common operations:
  - Access: O(n) - Accessing an element by index requires traversing the list
  - Search: O(n) - Searching for an element requires traversing the list
  - Insert: O(1) - Inserting an element at the beginning or end of the list is straightforward
  - Delete: O(1) - Deleting an element from the beginning or end of the list is straightforward
- The runner technique (also known as the two-pointer technique):
  - Uses two pointers that iterate through the list at different speeds
  - Common applications:
    - Finding the middle of a linked list (fast pointer moves twice as fast)
    - Detecting cycles in a linked list (if fast catches up to slow, there's a cycle)
    - Finding kth to last element (offset pointers by k nodes)
  - Time complexity remains O(n) but allows solving problems that would be harder with a single traversal

  ```
    slow
     ↓
    [1]->[2]->[3]->[4]->[5]->null
     ↓
    fast

    slow
     ↓
    [1]->[2]->[3]->[4]->[5]->null
          ↓
        fast

              slow
               ↓
    [1]->[2]->[3]->[4]->[5]->null
                    ↓
                   fast

                    slow
                    ↓
    [1]->[2]->[3]->[4]->[5]->null
                         ↓
                        fast

                        slow
                         ↓
    [1]->[2]->[3]->[4]->[5]->null
                              ↓
                             fast
  ```

### Stacks and Queues

#### Stacks
- A stack is a linear data structure that follows the Last-In-First-Out (LIFO) principle.
- Common operations:
  - Push: Add an element to the top of the stack
  - Pop: Remove and return the top element of the stack
  - Peek: Return the top element of the stack without removing it
  - IsEmpty: Check if the stack is empty
- Common use cases:
  - Undo/Redo operations
  - Expression evaluation
  - Backtracking algorithms
  - Call stack in programming languages

#### Queues
- A queue is a linear data structure that follows the First-In-First-Out (FIFO) principle.
- Common operations:
  - Enqueue: Add an element to the back of the queue
  - Dequeue: Remove and return the front element of the queue
  - Peek: Return the front element of the queue without removing it
  - IsEmpty: Check if the queue is empty
- Common use cases:
  - Breadth-first search (BFS)
  - Scheduling tasks
  - Printer spooler
  - Job scheduling

### Trees

- A tree is a non-linear data structure that consists of nodes, where each node can have zero or more child nodes.
- The topmost node is called the root.
- The nodes without any children are called leaves.
- The edges that connect nodes are called branches.
- Common operations:
  - Insert: Add a new node to the tree
  - Delete: Remove a node from the tree
  - Search: Find a node in the tree
  - Traverse: Visit all nodes in the tree
- Common use cases:
  - Implementing dictionaries
  - Implementing priority queues
  - Implementing expression trees
  - Implementing file systems

#### Ternary Tree

Each node can have 0-3 children

```
       10
    /   |   \
   5    8    15
 / |   / \    \
1  4   7  9    20
```

### Binary Tree vs. Binary Search Tree

1. Binary Tree (up to 2 children per node):
```
      7
    /   \
   4     9
  / \   / \
 2   6 8   11
```

2. Binary Search Tree (left < parent < right):
```
       8
    /     \
   3      12
  / \    /  \
 1   6  10  14
    /    \
   4     11
```

Key differences:
- Ternary Tree: Each node can have 0-3 children
- Binary Tree: Each node can have 0-2 children
- Binary Search Tree: Binary tree with ordering property:
  - All left subtree values < parent
  - All right subtree values > parent
  - Makes searching efficient: O(log n) average case

#### Balanced vs. Unbalanced

A tree is considered balanced when the heights of left and right subtrees of every node differ by at most one.

1. Balanced Binary Search Tree:
```
       8              Height = 3
    /     \
   4      12          Max height difference = 1
  / \    /  \
 2   6  10   14       All subtrees balanced
```

2. Unbalanced Binary Search Tree:
```
       8              Height = 4
    /     \
   4      12          Height difference = 2 at node 4
  /      /  \
 2      10   14
/
1                     Degrades to almost linear structure
```

3. Extremely Unbalanced (Degenerate/Linear):
```
1                     Height = 5
 \
  2                   Worst case scenario
   \                  Behaves like a linked list
    3
     \
      4
       \
        5
```

Performance Implications:
- Balanced BST:
  - Search: O(log n)
  - Insert: O(log n)
  - Delete: O(log n)

- Unbalanced BST (worst case):
  - Search: O(n)
  - Insert: O(n)
  - Delete: O(n)

Common Self-Balancing Trees:
- AVL Trees
- Red-Black Trees
- B-Trees

These self-balancing trees automatically maintain balance during insertions and deletions to ensure O(log n) operations.

### Complete Binary Tree vs. Full Binary Tree vs. Perfect Binary Tree

1. Complete Binary Tree:
- All levels are filled except possibly the last level
- Last level has nodes filled from left to right

```
Example 1 (Complete):
       1
     /   \
    2     3
   / \   /
  4   5 6

Example 2 (Also Complete):
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

Example 3 (Not Complete):
       1
     /   \
    2     3
   / \     \
  4   5     7   // left child of 3 is missing
```

2. Full Binary Tree:
- Every node has either 0 or 2 children
- No nodes have only one child

```
Example 1 (Full):
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

Example 2 (Also Full):
       1
     /   \
    2     3
         / \
        6   7

Example 3 (Not Full):
       1
     /   \
    2     3     // node 3 has only one child
         /
        6
```

3. Perfect Binary Tree:
- All internal nodes have exactly 2 children
- All leaves are at the same level
- Number of nodes = 2^h+1 - 1 (where h is height)

```
Example 1 (Perfect):
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

Example 2 (Perfect, smaller):
       1
     /   \
    2     3
```

Comparison:
1. Complete Binary Tree:
   - All levels filled except last
   - Last level filled from left
   - Used in heaps

2. Full Binary Tree:
   - Each node: 0 or 2 children
   - Good for expression trees

3. Perfect Binary Tree:
   - Most restrictive type
   - All levels completely filled
   - Rare in practice

Properties:
```
Tree Type    | Nodes at level h | Total nodes
-------------|------------------|-------------
Perfect      | 2^h              | 2^(h+1) - 1
Complete     | 1 to 2^h         | n
Full         | Varies           | 2n + 1
```

Note: A Perfect Binary Tree is both Complete and Full, but not all Complete or Full trees are Perfect.

#### Binary Tree Traversal
- Preorder Traversal:
    1. Visit the root first,
    2. then traverse the left subtree,
    3. then traverse the right subtree.
- Inorder Traversal:
    1. Traverse the left subtree first,
    2. then visit the root,
    3. then traverse the right subtree.
- Postorder Traversal:
    1. Traverse the left subtree first,
    2. then traverse the right subtree,
    3. then visit the root.
- Level Order Traversal: Visit all nodes at each level from left to right.


Examples:
```
       1
     /   \
    2     3
   / \   / \
  4   5 6   7
```

1. Preorder Traversal (Root -> Left -> Right):
```
Visit order: 1 -> 2 -> 4 -> 5 -> 3 -> 6 -> 7

Step by step:
1. Visit root (1)
2. Traverse left subtree:
   - Visit 2
   - Visit 4
   - Visit 5
3. Traverse right subtree:
   - Visit 3
   - Visit 6
   - Visit 7
```

2. Inorder Traversal (Left -> Root -> Right):
```
Visit order: 4 -> 2 -> 5 -> 1 -> 6 -> 3 -> 7

Step by step:
1. Traverse left subtree:
   - Visit 4
   - Visit 2
   - Visit 5
2. Visit root (1)
3. Traverse right subtree:
   - Visit 6
   - Visit 3
   - Visit 7
```

3. Postorder Traversal (Left -> Right -> Root):
```
Visit order: 4 -> 5 -> 2 -> 6 -> 7 -> 3 -> 1

Step by step:
1. Traverse left subtree:
   - Visit 4
   - Visit 5
   - Visit 2
2. Traverse right subtree:
   - Visit 6
   - Visit 7
   - Visit 3
3. Visit root (1)
```

4. Level Order Traversal (BFS):
```
Visit order: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7

By levels:
Level 0: 1
Level 1: 2, 3
Level 2: 4, 5, 6, 7
```

Common Use Cases:
- Preorder: Creating a copy of the tree or serializing tree structure
- Inorder: Getting elements in sorted order (for BST)
- Postorder: Deleting nodes or calculating directory sizes
- Level Order: Finding minimum tree height or level-based operations

#### Graph Traversal
- Depth-First Search (DFS): Explore as far as possible along each branch before backtracking.
- Breadth-First Search (BFS): Explore all nodes at the current depth prior to moving on to nodes at the next depth level.

#### Binary Heaps (Min-Heaps and Max-Heaps)
- A binary heap is a complete binary tree that satisfies the heap property.
- The heap property is either:
  - Max-Heap: The value of each node is greater than or equal to the values of its children.
  - Min-Heap: The value of each node is less than or equal to the values of its children.
- Common operations:
  - Insert: Add a new element to the heap
  - Delete: Remove the root element from the heap
  - Peek: Return the root element of the heap without removing it
  - IsEmpty: Check if the heap is empty
- Common use cases:
  - Priority Queues
  - Heap Sort
  - Finding kth smallest/largest elements
  - Median maintenance

Examples:

1. Max-Heap Example:
```
       100              Every parent is greater than its children
      /   \
    19     36
   /  \   /  \
  17   3 25   1
 /  \
2    7

Properties:
- Root (100) is the maximum element
- Parent at index i: (i-1)/2
- Left child at index i: 2i + 1
- Right child at index i: 2i + 2
```

2. Min-Heap Example:
```
        1               Every parent is smaller than its children
      /   \
    4      2
   /  \   /  \
  7    5 3    6
 /  \
9    8

Properties:
- Root (1) is the minimum element
- Same parent/child index relationships
```

Operation Examples:

1. Insert(15) into min-heap:
```
Initial:                After Insert:           After Bubble-Down:
       3                     3                        3
     /   \                /   \                    /   \
    4     8              4     8                  4     8
   / \                  / \   /                  / \   /
  11  5               11  5  15                11  5  15

Step-by-step:
1. Initial state: [3, 4, 8, 11, 5]
2. Insert 15 at next available position (as leftmost child of 8)
3. No bubble-up needed since 15 > 8 (parent)
4. Final state: [3, 4, 8, 11, 5, 15]

Array representation:
Index:    0  1  2  3  4  5
Initial: [3, 4, 8, 11, 5]
Final:   [3, 4, 8, 11, 5, 15]
```

2. Insert(15) into max-heap:
```
Initial:                After Insert:           After Bubble-Up:
      11                    11                       15     // Bubble-up 15 > 8 then 15 > 11 (root)
     /  \                 /  \                     /  \
    5    8              5    8                    5    11
   / \                 / \  /                   / \   /
  3   4              3   4 15                  3   4 8

Step-by-step:
1. Initial state: [11, 5, 8, 3, 4]
2. Insert 15 at next available position (as leftmost child of 8)
3. Bubble-up needed since 15 > 8 (parent) and 15 > 11 (root)
4. Final state: [15, 11, 8, 3, 4, 5]

Array representation:
Index:    0   1  2  3  4  5
Initial: [11, 5, 8, 3, 4]
Final:   [15, 5, 11, 3, 4, 8]
```

3. Extract Root (Delete Max) from max-heap:
```
Initial:                 Move Last to Root:      After Bubble-Down:
       15                      5                      11
     /    \                  /   \                  /   \
   11      8               11    8                 5     8
  /  \    /               /  \                    / \
 3    4  5               3    4                  3   4

Step-by-step:
1. Initial state: [15, 11, 8, 3, 4, 5]
2. Save root value (15) to return later
3. Move last element (5) to root position
4. Bubble-down needed since 5 < 11 (left child) and 5 < 8 (right child)
   - Swap with larger child (11)
5. Final state: [11, 5, 8, 3, 4]

Array representation:
Index:    0   1  2  3  4  5
Initial: [15, 11, 8, 3, 4, 5]
Final:   [11, 5, 8, 3, 4]

Return value: 15
```

Array Representation (Max-Heap):
```
Index:  0   1   2   3   4   5   6   7   8
Array: [100, 19, 36, 17, 3, 25, 1, 2, 7]

                100
               /   \
             19     36
            /  \   /  \
           17   3 25   1
          /  \
         2    7
```

Common Applications:
- Priority Queues
- Heap Sort
- Finding kth smallest/largest elements
- Median maintenance

#### Tries (Prefix Trees/Digital Trees)
- re-TRIE-val: retrieving a value by its prefix
- A trie is a tree-like data structure that stores a dynamic set of strings, usually over an alphabet.
- Each node in the trie represents a single character of a string (keyed by strings).
- The root node represents an empty string.
- The edges between nodes represent the transitions between characters.
- The leaves of the trie represent complete strings.
- Common operations:
  - Insert: Add a new string to the trie
  - Search: Check if a string is in the trie
  - Delete: Remove a string from the trie
  - Prefix Search: Find all strings that start with a given prefix
- Common use cases:
  - Autocomplete
  - Spell check
  - IP routing
  - Dictionary lookup

#### Tries (Prefix Trees/Digital Trees)

Example Trie storing the words: ["cat", "cats", "car", "card", "try"]:

```
                 root
              /   |
             c    t
            /     |
           a      r
          / \     |
         t   r    y
        /    |
       s     d
```

More detailed visualization with end-of-word markers (*):
```
                  □ (root)
              /   |
             c    t
            /     |
           a      r
          / \     |
         t*  r*   y*
        /    |
       s*    d*

Words stored:
- cat*
- cats*
- car*
- card*
- try*
```

Example of Prefix Search for "ca":
```
                  □ (root)
              /   |
             c    t
            /     |
           a      r      ← Found "ca" prefix
          / \     |
         t*  r*   y*      ← Continue search from here
        /    |
       s*    d*

Results: ["cat", "cats", "car", "card"]
```

Example of inserting "cup":
```
Before:                     After:
     □ (root)                   □ (root)
    /        \                /        \
   c          t              c          t
  /           |            /   \        |
 a            r           a     u       r
/ \           |          / \     \      |
t* r*         y*        t*  r*    p*    y*
/   |                  /     |
s*  d*               s*     d*
```

Step-by-step:
1. Start at root
2. Follow 'c' path (exists)
3. Create new 'u' branch from 'c'
4. Create new 'p' node and mark as word end (*)

Example 1 - Remove "cat":
```
Before:                     After:
     □ (root)                   □ (root)
    /        \                /        \
   c          t              c          t
  /           |            /           |
 a            r           a            r
/ \           |          / \           |
t*  r*        y*        t   r*         y*
/    |                 /    |
s*    d*             s*    d*
```
Note: When removing "cat":
1. Remove the `*` from `t` node (as "cat" is no longer a valid word)
2. Keep the `t` node itself (as it's still needed for path to "cats")
3. Keep `s*` (as "cats" is still a valid word)

Example 2 - Remove "card":
```
Before:                     After:
     □ (root)                   □ (root)
    /        \                /        \
   c          t              c          t
  /           |            /           |
 a            r           a            r
/ \           |          / \           |
t*  r*        y*        t*  r*         y*
/    |                 /
s*    d*             s*
/
*
```
Note: When removing "card":
1. Remove node 'd*' completely since it's not part of any other word
2. Keep r* since it's still the end of word "car"
3. Keep other nodes and their markers as they represent other valid words

### Graphs
- A graph is a non-linear data structure consisting of vertices (nodes) and edges that connect these vertices
- Types of graphs:
  - Directed vs Undirected graphs:
    1. Directed graphs have edges with a direction,
    2. while undirected graphs have edges without direction.
  - Weighted vs Unweighted graphs:
    1. Weighted graphs have edges with a numerical value representing the cost or weight of the edge,
    2. while unweighted graphs have edges with no numerical value.
  - Connected vs Disconnected graphs:
    1. Connected graphs have a path between every pair of vertices,
    2. while disconnected graphs have at least one pair of vertices that are not connected by a path.
  - Cyclic vs Acyclic graphs:
    1. Cyclic graphs have at least one cycle,
    2. while acyclic graphs have no cycles.
- Common operations:
  - Add vertex/edge
  - Remove vertex/edge
  - Find path between vertices
  - Check if vertices are connected
  - Traverse the graph (DFS, BFS)
- Common representations:
  - Adjacency Matrix
  - Adjacency List
  - Edge List
- Common use cases:
  - Social networks
  - Road networks/Maps
  - Computer networks
  - Recommendation systems
  - State machines

#### Edges in Graphs

An edge is a connection between two vertices (nodes) in a graph. Edges can have different properties:

1. Direction:
```
Undirected Edge:          Directed Edge:
    A --- B                  A ---> B
(A connects to B)        (A connects to B, but not B to A)
```

2. Weight:
```
Unweighted Edge:         Weighted Edge:
    A --- B                A --5-- B
(simple connection)      (connection with value/cost 5)
```

3. Examples in Different Graph Types:

```
Undirected Graph:              Directed Graph:
    A --- B                      A ---> B
    |     |                      |     ↓
    C --- D                      C <-- D

Weighted Directed Graph:        Weighted Undirected Graph:
    A -2-> B                     A --2-- B
    |     ↓                      |       |
    3     5                      3       5
    ↓     ↓                      |       |
    C <4- D                      C --4-- D
```

Real-world Examples:
1. Social Networks:
   - Undirected: Friendship (if A is friends with B, B is friends with A)
   - Directed: Following (A can follow B without B following A)

2. Road Networks:
   - Undirected: Two-way streets
   - Directed: One-way streets
   - Weighted: Distance or travel time between locations

3. Network Flow:
   - Directed: Data flow direction
   - Weighted: Bandwidth or capacity

#### Graph Traversal
- Depth-First Search (DFS): Explore as far as possible along each branch before backtracking.
- Breadth-First Search (BFS): Explore all nodes at the current depth prior to moving on to nodes at the next depth level.

#### Graph Algorithms
- Shortest Path: Find the shortest path between two vertices
- Minimum Spanning Tree: Find the minimum weight edge that connects all vertices
- Topological Sort: Order vertices in a way that respects dependencies
- Strongly Connected Components: Find all vertices that are part of a cycle

#### Adjacency List
- An adjacency list is a collection of lists that represent the connections between vertices in a graph.
- Each vertex has a list of adjacent vertices.

#### Adjacency Matrix
- An adjacency matrix is a 2D array that represents the connections between vertices in a graph.
- The matrix is square (n x n) where n is the number of vertices.

### Advanced Data Structures

#### AVL Trees
- An AVL tree is a self-balancing binary search tree where the difference between heights of left and right subtrees cannot be more than one for all nodes.
- The AVL tree gets its name from its inventors, Adelson-Velsky and Landis.
- Common operations:
  - Insert: Add a new element to the tree
  - Delete: Remove an element from the tree
  - Search: Find an element in the tree
  - Balance: Ensure the tree remains balanced after insertions and deletions
- Common use cases:
  - Dictionary lookup
  - Database indexing
  - File systems

#### Red-Black Trees
- A red-black tree is a type of self-balancing binary search tree.
- Each node in the tree is colored either red or black.
- The tree satisfies the following properties:
  - Every node is either red or black.
  - The root is black.
  - All leaves (NIL nodes) are black.
  - If a node is red, then both its children are black.
  - Every path from a node to its descendant NIL nodes has the same number of black nodes.
- Common operations:
  - Insert: Add a new element to the tree
  - Delete: Remove an element from the tree
  - Search: Find an element in the tree
  - Balance: Ensure the tree remains balanced after insertions and deletions
- Common use cases:
  - Dictionary lookup
  - Database indexing
  - File systems

#### B-Trees
- A B-tree is a self-balancing tree data structure that keeps data sorted and allows searches, sequential access, insertions, and deletions in logarithmic time.
- The B-tree generalizes the binary search tree, allowing for multiple keys per node.
- Common operations:
  - Search: Find a key in the tree
  - Insert: Add a new key to the tree
  - Delete: Remove a key from the tree
- Common use cases:
  - Database indexing
  - File systems

### B+ Trees
- A B+ tree is a type of self-balancing tree data structure that keeps data sorted and allows searches, sequential access, insertions, and deletions in logarithmic time.
- The B+ tree generalizes the binary search tree, allowing for multiple keys per node.
- Common operations:
  - Search: Find a key in the tree
  - Insert: Add a new key to the tree
  - Delete: Remove a key from the tree
- Common use cases:
  - Database indexing
  - File systems

#### Skip Lists
- A skip list is a data structure that allows for fast search, insert, and delete operations.
- It is a probabilistic data structure that provides O(log n) time complexity for search, insert, and delete operations.
- Common operations:
  - Search: Find an element in the list
  - Insert: Add a new element to the list
  - Delete: Remove an element from the list
- Common use cases:
  - Database indexing
  - File systems

#### Hash Table Collision Resolution
- A hash table is a data structure that stores key-value pairs.
- The keys are hashed into an array of buckets.
- The hash function maps each key to a unique index in the array.
- Common collision resolution techniques:
  - Chaining with linked lists: Each bucket contains a linked list of key-value pairs that hash to the same index
    - Pros: Simple implementation, works well for small number of collisions
    - Cons: Can degrade to O(n) search time if many items hash to same bucket
  - Chaining with binary search trees: Each bucket contains a BST of key-value pairs
    - Pros: Better search time O(log n) compared to linked lists
    - Cons: More complex implementation, additional memory overhead
  - Open Addressing: Each bucket contains a single key-value pair. If a collision occurs, probe subsequent buckets until an empty one is found
    - Linear Probing: Check next bucket sequentially (index + 1, index + 2, etc.)
      - Pros: Simple implementation, good cache performance due to locality
      - Cons: Suffers from primary clustering - collisions tend to cluster together
    - Quadratic Probing: Check buckets at quadratic intervals (index + 1², index + 2², etc.)
    - Double Hashing: Use second hash function to determine probe sequence
- Common use cases:
  - Dictionary lookup
  - Database indexing
  - File systems

#### Bloom Filters
- A Bloom filter is a space-efficient probabilistic data structure that is used to test whether an element is a member of a set.
- It is a type of hash table that allows for fast search, insert, and delete operations.
- Common operations:
  - Insert: Add an element to the set
  - Search: Check if an element is in the set
  - Delete: Remove an element from the set
- Common use cases:
  - Duplicate detection
  - Caching
  - Filtering spam emails

Examples:

1. Basic Bloom Filter Example:
    ```
    1. Initial empty Bloom filter (bit array): [0 0 0 0 0 0 0 0]

        Add "cat":
        Hash1("cat") = 1
        Hash2("cat") = 4
        [0 1 0 0 1 0 0 0]

        Add "dog":
        Hash1("dog") = 2
        Hash2("dog") = 5
        [0 1 1 0 1 1 0 0]

    2. Query "cat": YES (all bits 1,4 are set)

    3. Query "rat": some bits happened to be set
        Hash1("rat") = 1  ✓ (bit is 1)
        Hash2("rat") = 5  ✓ (bit is 1)
        Result: MAYBE!  <- False Positive: "rat" was never added but its hash positions were set by other words

    4. Query "pig":
        Hash1("pig") = 3  ✗ (bit is 0)
        Hash2("pig") = 7  ✗ (bit is 0)
        Result: NO (definitely not in set)

        Current filter state: [0 1 1 0 1 1 0 0]
                                ↑ ↑   ↑ ↑
                                Set by "cat" and "dog"

                "pig" hashes:        ↑   ↑
                                    3   7
                                    Both bits are 0

    Note: Since at least one required bit is 0, we can definitively say "pig" is NOT in the set.
    This is why Bloom Filters never have false negatives:
    - If any required bit is 0: Item is definitely not in set
    - If all required bits are 1: Item might be in set (could be false positive)
   ```

2. Real-world Example - Web Crawler:
   ```
   Bloom Filter used to track visited URLs:

   Size: 1 million bits
   Hash functions: 4

   Already crawled:
   - www.example.com
   - www.test.com

   New URL www.example.com:
   -> Bloom filter shows "probably seen"
   -> Skip crawling (avoid duplicate work)

   New URL www.new.com:
   -> Bloom filter shows "definitely not seen"
   -> Proceed with crawling
   ```

3. Why False Positives Occur:
    1. Limited bit array size
    2. Hash collisions
    3. Bits can be set by different items

    False Positive Rate depends on:
    - m: number of bits in filter
    - n: number of items added
    - k: number of hash functions

    Formula: (1 - e^(-kn/m))^k

    Example:
    ```
    m = 8 bits
    n = 2 items ("cat", "dog")
    k = 2 hash functions
    False Positive Rate ≈ 15%

    [0 1 1 0 1 1 0 0]
    ↑ ↑   ↑ ↑
    Bits set by "cat" and "dog" can accidentally match other words
    ```

    Note: Bloom Filters never have false negatives - if it says "NO", the item is definitely not in the set.

#### Rabin-Karp Substring Search
- The Rabin-Karp substring search algorithm is a string searching algorithm that uses hashing to find a substring within a text.
- It is a type of hash table that allows for fast search, insert, and delete operations.
- Common operations:
  - Search: Find a substring in the text
- Common use cases:
  - String searching
  - Text processing
