# Linked Lists

- A linked list is a linear data structure where each element is a separate object, called a node.
- Each node contains a reference to the next node in the list.
- The list is terminated by a null reference.

## Common operations:
  - Access: O(n) - Accessing an element by index requires traversing the list
  - Search: O(n) - Searching for an element requires traversing the list
  - Insert: O(1) - Inserting an element at the beginning or end of the list is straightforward
  - Delete: O(1) - Deleting an element from the beginning or end of the list is straightforward

## The runner technique (also known as the two-pointer technique):
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
