# Data Structures and Abstract Data Types (TODO)

# Abstract Data Types

## Stack

Operations:

- push(x): pushes x on top of the stack
- pop(): returns the top of the stack and removes it from the stack
- top(): returns the top of the stack
- isEmpty(): returns true if the stack is empty, false otherwise

All these operations run in $O(1)$.

## Queue

Operations:

- enqueue(x): appends x to the back of the queue
- dequeue(): returns the element from the front of the queue and removes it from the queue
- front(): returns the front element of the queue
- isEmpty(): returns true if the queue is empty, false otherwise

All these operations run in $O(1)$.

## Priority Queue

Operations:

- insert(x, p): appends x in the priority queue with priority p
- extractMax()/extractMin(): returns the element with the highest/lowest priority and removes it
- front(): returns the front element of the queue
- isEmpty(): returns true if the priority queue is empty, false otherwise

All these operations run in $O(\log n)$.

## Dictionary

Operations:

- insert(k): inserts k into the dictionary, errors-out when k is already present
- delete(k): removes k from the directory, errors-out when k is not present
- search(k): returns true if the dictionary contains k, false otherwise

# Data Structures

## Heap

A max-heap for an array $A$ of size $n$ is a binary tree such that the following holds: for all nodes, the key of the node is greater or equal to the keys of its children. Similarly, for a min-heap the key of the node is smaller or equal to the keys of its children. With this condition, the maximal/minimal element of an array can be queried in $O(1)$.

If a node has array index $k$, then its children are located at indices $2 k$ and $2k+1$ (for a 1-indexed array).

The maximal height of a heap is given by $\lfloor \log_2n\rfloor$, the number of leaves of a heap is given by $\lceil \frac{n}{2}\rceil$. After every modification, deletion or insertion of an element the heap condition has to be rebuilt.

### Building/Rebuilding Heap Condition

When the first element of the heap gets removed it gets replaced by the last element of the underlying array. Then, the heap condition does not necessarily hold any more. To restore the heap condition, the new first element is compared with its maximum/minimum child (for a max-heap/min-heap respectively) and if necessary, swapped with it. Then this process is repeated again for the new child until the heap condition is restored. To initially build a heap all nodes go through this process. We can thus build a heap in $O(\log n)$.

## Search Tree

A search tree is a binary tree such that for all nodes the following holds: the left subtree contains elements that are smaller than the node and the right subtree contains elements that are bigger than the node.

## AVL Tree

An AVL tree, named after Adelson-Velski and Landis, is a binary search tree where the left and right subtree heights ($h_l, h_r$ respectively) differ by 1 at max for all nodes in the tree, i.e., $\lvert h_l - h_r \rvert \leq 1$. Elements are inserted just like in a normal search tree. After every insert the AVL condition is checked and the tree is rebalanced if required.

Searching, removing and inserting an element are all possible in $O(\log n)$. When inserting an element, the tree needs to be rebalanced.

## Union-Find