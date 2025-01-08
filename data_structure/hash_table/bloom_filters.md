# Bloom Filters
- A Bloom filter is a space-efficient probabilistic data structure that is used to test whether an element is a member of a set.
- It is a type of hash table that allows for fast search, insert, and delete operations.

## Common operations:
  - Insert: Add an element to the set
  - Search: Check if an element is in the set
  - Delete: Remove an element from the set

## Common use cases:
  - Duplicate detection
  - Caching
  - Filtering spam emails

## Examples:

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

## References:
  - [Bloom Filters Explained](https://systemdesign.one/bloom-filters-explained)
