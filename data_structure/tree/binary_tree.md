# Binary Tree

## Definition
- A tree is a non-linear data structure that consists of nodes, where each node can have zero or more child nodes.
- A binary tree: each node can have 0-2 children

```
      7
    /   \
   4     9
  / \   / \
 2   6 8   11
```

- A ternary tree: Each node can have 0-3 children

```
       10
    /   |   \
   5    8    15
 / |   / \    \
1  4   7  9    20
```

### Terminology:
- Root: The topmost node in the tree structure
- Leaf: A node that has no children
- Branch/Edge: A connection between two nodes that establishes their parent-child relationship

### Operations:
  - Insert: Add a new node to the tree
  - Delete: Remove a node from the tree
  - Search: Find a node in the tree
  - Traverse: Visit all nodes in the tree

### Common use cases:
- Dictionaries
- Priority queues
- Expression trees
- File systems

## Binary Tree Types

Complete Binary Tree vs. Full Binary Tree vs. Perfect Binary Tree

### Complete Binary Tree
- All levels are filled except possibly the last level
- If the last level is not fully filled, the nodes are filled from left to right

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

### Full Binary Tree
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

### Perfect Binary Tree
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

## Binary Search Tree (BST)

Binary tree with ordering property (left < parent < right):
- All left subtree values < parent
- All right subtree values > parent
- Makes searching efficient: O(log n) average case

```
       8
    /     \
   3      12
  / \    /  \
 1   6  10  14
    /    \
   4     11
```

## Balanced Binary Search Tree

A tree is considered balanced when the heights of left and right subtrees of every node differ by at most one.


```
       8              Height = 3
    /     \
   4      12          Max height difference = 1
  / \    /  \
 2   6  10   14       All subtrees balanced
```

Performance Implications:
- Search: O(log n)
- Insert: O(log n)
- Delete: O(log n)

## Self-Balancing Trees:
- AVL Trees
- Red-Black Trees
- B-Trees

These self-balancing trees automatically maintain balance during insertions and deletions to ensure O(log n) operations.

### AVL Trees
- an AVL tree is a self-balancing binary search tree.
- Strictest balance (height difference ≤ 1): the difference between heights of left and right subtrees cannot be more than one for all nodes.
- Best for frequent lookups
- The AVL tree gets its name from its inventors, Adelson-Velsky and Landis.

#### Common operations:
  - Insert: Add a new element to the tree
  - Delete: Remove an element from the tree
  - Search: Find an element in the tree
  - Balance: Ensure the tree remains balanced after insertions and deletions

#### Common use cases:
  - Dictionary lookup
  - Database indexing
  - File systems

### Red-Black Trees
- A red-black tree is a type of self-balancing binary search tree.
- More relaxed balance
- Better for frequent insertions/deletions

#### Properties:
- Each node in the tree is colored either red or black.
- The tree satisfies the following properties:
  - Every node is either red or black.
  - The root is black.
  - All leaves (NIL nodes) are black.
  - If a node is red, then both its children are black.
  - Every path from a node to its descendant NIL nodes has the same number of black nodes.

#### Common operations:
  - Insert: Add a new element to the tree
  - Delete: Remove an element from the tree
  - Search: Find an element in the tree
  - Balance: Ensure the tree remains balanced after insertions and deletions

#### Common use cases:
  - Dictionary lookup
  - Database indexing
  - File systems

### Unbalanced Binary Search Tree

```
       8              Height = 4
    /     \
   4      12          Height difference = 2 at node 4
  /      /  \
 2      10   14
/
1                     Degrades to almost linear structure
```

Performance Implications (worst case):
  - Search: O(n)
  - Insert: O(n)
  - Delete: O(n)

### Extremely Unbalanced (Degenerate/Linear):

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

## Binary Tree Traversal

### Preorder Traversal: Root -> Left -> Right

1. Visit the root first,
2. then traverse the left subtree,
3. then traverse the right subtree.

```
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

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

### Inorder Traversal: Left -> Root -> Right
1. Traverse the left subtree first,
2. then visit the root,
3. then traverse the right subtree.

```
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

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

### Postorder Traversal: Left -> Right -> Root
1. Traverse the left subtree first,
2. then traverse the right subtree,
3. then visit the root.

Examples:
```
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

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

### Level Order Traversal (BFS)
Visit all nodes at each level from left to right.

Examples:
```
       1
     /   \
    2     3
   / \   / \
  4   5 6   7

Visit order: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7

By levels:
Level 0: 1
Level 1: 2, 3
Level 2: 4, 5, 6, 7
```

## B-Trees
- A B-tree is a self-balancing tree data structure that keeps data sorted and allows searches, sequential access, insertions, and deletions in logarithmic time.
- The B-tree generalizes the binary search tree, allowing for multiple keys per node.
- Common operations:
  - Search: Find a key in the tree
  - Insert: Add a new key to the tree
  - Delete: Remove a key from the tree
- Common use cases:
  - Database indexing
  - File systems
- References:
  - [Understanding B-Trees](https://www.youtube.com/watch?v=K1a2Bk8NrYQ)
  - [B-Tree](https://en.wikipedia.org/wiki/B-tree)
  - [B+ Tree](https://en.wikipedia.org/wiki/B%2B_tree)

#### B+ Trees
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
- References:
  - [Bloom Filters Explained](https://systemdesign.one/bloom-filters-explained)

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
