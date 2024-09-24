# References

## Set

1. Set Implementation in Ruby:
  - Ruby's Set is typically implemented using a Hash table under the hood. In fact, in Ruby, you can think of a Set as a special kind of Hash where the keys are the set elements and the values are all set to true.

2. Hash Table Basics:
  - Hash tables use a hash function to compute an index into an array of buckets or slots, from which the desired value can be found.
  - Ideally, the hash function assigns each key to a unique bucket, but in practice, it's common to have hash collisions where the hash function generates the same index for more than one key.

3. O(1) Average Time Complexity:
  - In a well-implemented hash table, the average time complexity for lookups is O(1).
  - This is because the hash function directly computes the index where an element should be, allowing immediate access.

4. How it Works:
  - When you call `include?` on a Set, it essentially does this:
    1. Compute the hash of the input value.
    2. Use this hash to find the corresponding bucket in the underlying array.
    3. Check if the value exists in that bucket.

5. Handling Collisions:
  - Even with collisions, where multiple elements hash to the same bucket, the lookup remains very fast on average.
  - Common collision resolution techniques like chaining (where each bucket contains a linked list of elements) still provide fast access.

6. Amortized O(1):
  - The O(1) time complexity is an amortized average-case scenario.
  - In the worst case (many collisions), it could theoretically degrade to O(n), but this is extremely rare with a good hash function and proper resizing of the hash table.

7. Ruby's Optimization:
  - Ruby's implementation is highly optimized, using techniques like open addressing and power-of-two sizing to make hash operations as efficient as possible.

It's important to note that while we say the lookup is O(1), it's more accurately described as O(1) in the average and amortized case. In practice, for the vast majority of use cases, you can rely on Set lookups being constant time operations.
