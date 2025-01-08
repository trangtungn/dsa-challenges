# Tries (Prefix Trees/Digital Trees)
- re-TRIE-val: retrieving a value by its prefix
- A trie is a tree-like data structure that stores a dynamic set of strings, usually over an alphabet.
- Each node in the trie represents a single character of a string (keyed by strings).
- The root node represents an empty string.
- The edges between nodes represent the transitions between characters.
- The leaves of the trie represent complete strings.

### Operations
- Insert: Add a new string to the trie
- Search: Check if a string is in the trie
- Delete: Remove a string from the trie
- Prefix Search: Find all strings that start with a given prefix

### Common use cases
- Autocomplete
- Spell check
- IP routing
- Dictionary lookup

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
