# Searching

# Binary Search

## Runtime

$O(\log n)$

## Pseudocode

```python
import math

def binary_search(a, b):
    left = 1
    right = len(a)
    while left <= right:
        middle = math.floor((left + right) / 2)
        if a[middle] == b:
            return middle
        else if a[middle] > b:
            right = middle - 1
        else:
            left = middle + 1
    return "not present"
```

## Further Resources

[Binary search algorithm - Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm)

# Interpolation Search

## Runtime

Best-Case: $O(\log \log n)$

Worst-Case: $O(n)$

## Pseudocode

```python
def interpolation_search(a, b):
    left = 1
    right = len(a)
    while left <= right:
        middle = (b - a[left]) / (a[right] - a[left])
        if a[middle] == b:
            return middle
        else if a[middle] > b:
            right = middle - 1
        else:
            left = middle + 1
    return "not present"
```

## Further Resources

[Interpolation search - Wikipedia](https://en.wikipedia.org/wiki/Interpolation_search)

# Linear Search

## Runtime

$O(n)$

## Pseudocode

```python
def linear_search(a, b):
    for el in a:
        if el == b:
            return b
    return "not present"
```

## Further Resources

[Linear search - Wikipedia](https://en.wikipedia.org/wiki/Linear_search)

# Lower Bound for Comparison-Based Searching

Is it possible to sort in under $\Theta(\log n)$ comparisons?

Every comparison-based searching algorithm corresponds to some binary decision tree. Then the elements of the searched array correspond to the nodes of that tree. Therefore there are $n$ nodes in the tree. The worst-case runtime corresponds to the height of the tree, denoted by $h$.

A tree that has height $h$ must have no more than $2^h$ nodes, thus

$$
\begin{align*}
& 2^h \gt 1 + 2 + 2^2 + ... + 2^{h - 1} = 2^h-1 \geq n \\
\iff & h \geq \log n \geq \Omega(\log n)
\end{align*}
$$

# Breadth-First Search (BFS)

## Runtime

$O(\lvert V \rvert + \lvert E \rvert)$

## Pseudocode

```python
def bfs(s, graph):
    q = Queue(s)
    dist = [None] * len(graph.nodes)
    enter = [None] * len(graph.nodes)
    leave = [None] * len(graph.nodes)
    dist[s] = 0
    enter[s] = 0
    t = 1
    while !q.isEmpty():
        u = q.dequeue()
        leave[u] = t
        t = t + 1
        for v in u.children:
            if !enter[v]:
                q.enqueue(v)
                dist[v] = dist[u] + 1
                enter[v] = t
                t = t + 1
    return dist
```

## Further Resources

[Breadth-first search - Wikipedia](https://en.wikipedia.org/wiki/Breadth-first_search)

# Depth-First Search (DFS)

## Runtime

$O(\lvert V \rvert + \lvert E \rvert)$

## Pseudocode

```python
def dfs(s, graph):
    q = Stack(s)
    dist = [None] * len(graph.nodes)
    enter = [None] * len(graph.nodes)
    leave = [None] * len(graph.nodes)
    dist[s] = 0
    enter[s] = 0
    t = 1
    while !q.isEmpty():
        u = q.pop()
        leave[u] = t
        t = t + 1
        for v in u.children:
            if !enter[v]:
                q.push(v)
                dist[v] = dist[u] + 1
                enter[v] = t
                t = t + 1
    return dist
```

## Further Resources

[Depth-first search - Wikipedia](https://en.wikipedia.org/wiki/Depth-first_search)