# Shortest Paths

# General

The *distance* of two nodes $u ,v$, denoted $\text{dist}(u, v)$, in an unweighted directed graph $G = (V, E)$ is defined as the shortest length of a walk from $u$ to $v$.

The *cost* of an edge $e = (u, v) \in E$, denoted $c(e) \in \mathbb{R}$, in a weighted graph $G = (V, E)$ is the weight of said edge. The cost of a walk $W = (v_0, v_1,...,v_l)$ from vertex $v_0$ to $v_l$ is defined as the sum of the cost of each incident edge in the walk, i.e., $c(W) = c((v_0,v_1)) + ... + c((v_{l - 1}, v_l))$.

Notation: 

1.  $u \stackrel{e}{\rightarrow} v$ if $e = (u, v) \in E$
2. $u \stackrel{W}{\leadsto} v$ if $W$ is a walk from $u$ to $v$

The *distance* of two nodes $u, v$, denoted $\text{dist}(u,v)$, is in such a graph defined as $\text{dist}(u,v) = \min \{c(W) \space | \space u \stackrel{W}{\leadsto} v \}$.

# DP for DAGs

The shortest path problem is a DP problem in directed acyclic graphs, with the following recurrence: $\text{dist}(s, v) = \min_{u,v\in E} \text{dist}(s, u) + c(u, v)$. It can be computed in $O(\lvert V \rvert + \lvert E \rvert)$.

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

# Dijkstra’s Algorithm

Single-source shortest path algorithm for arbitrary graphs with non-negative weights.

## Runtime

$O((\lvert V \rvert + \lvert E \rvert) \cdot \log (\lvert V \rvert))$

## Pseudocode

```python
import math

def dijkstra(s, graph):
    dist = [math.inf] * len(graph.nodes)
    dist[s] = 0
    prev = [None] * len(graph.nodes)
    pq = MinPriorityQueue()
    for v in graph.vertices:
        pq.addWithPriority(v, dist[v])
    while !pq.isEmpty():
        u = pq.extractMin()
        for v in u.children:
            alt = dist[u] + cost(u, v)
            if alt < dist[v]:
                dist[v] = alt
                prev[v] = u
                pq.decreasePriority(v, alt)
    return dist, prev
        
```

## Further Resources

[Dijkstra's algorithm - Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)

# Bellman-Ford Algorithm

Single-source shortest path algorithm for arbitrary directed graphs without the restriction on non-negative weights. It can detect negative-weight cycles and report them.

## Runtime

$O(\lvert V \rvert \cdot \lvert E \rvert)$

## Pseudocode

```python
import math

def bellman_ford(s, graph):
    dist = [math.inf] * len(graph.vertices)
    prev = [None] * len(graph.vertices)
    dist[s] = 0
    for i in range(len(graph.vertices) - 1):
        for (u, v, w) in graph.edges:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w
                prev[v] = u
    for (u, v, w) in graph.edges:
        if dist[u] + w < dist[v]:
            raise NegativeWeightCycleException()
    return dist, prev
```

## Further Resources

[Bellman-Ford algorithm - Wikipedia](https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm)

# Comparing Single-Source Shortest Path Algorithms

[Single-Source Shortest Path Algorithms](Shortest%20Paths%2057d9ca620d3e46ca94e34f2bd590c043/Single-Source%20Shortest%20Path%20Algorithms%203f8c6ee3a9524ef4b0cb7c286f3834f6.md)

# Floyd-Warshall Algorithm

All-pairs shortest path algorithm for graphs without negative cycles.

## Runtime

$O(\lvert V \rvert ^3)$

## Pseudocode

```python
import math

def floyd_warshall(graph):
    dist = [None] * len(graph.vertices)
    for i in range(len(graph.vertices)):
        dist[i] = [None] * len(graph.vertices)
        for j in range(len(graph.vertices)):
            dist[i][j] = [math.inf] * len(graph.vertices)
    for u in graph.vertices:
        dist[0][u][u] = 0
    for (u, v, c) in graph.edges:
        dist[0][u][v] = c
    for i in range(1, len(graph.vertices)):
        for u in range(1, len(graph.vertices)):
            for v in range(1, len(graph.vertices)):
                dist[i][u][v] = min(dist[i - 1][u][v], dist[i - 1][u][i] + dist[i - 1][i][v])
    return dist
```

## Further Resources

[Floyd-Warshall algorithm - Wikipedia](https://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm)

# Johnson’s Algorithm

All-pairs shortest path algorithm.

Idea: Make all edge weights positive and execute Dijkstra $\lvert V \rvert$-times. This is done by adding a new vertex $q$ with an edge with weight 0 to every other vertex. In order to not change the shortest paths in this new graph all edges must be re-weighted according to the following function: $\hat{w}(u, v) = w(u, v) + h(u) - h(v)$ where $h(u)$ is the length of the shortest path in the new graph from $q$ to $u$. Then $q$ is removed and Dijkstra is executed for every node.

## Runtime

$O(\lvert E\rvert \cdot \lvert V \rvert + \lvert V \rvert^2 \cdot \log n)$

## Pseudocode

```python
def johnson(graph):
    dist = [None] * len(graph.vertices)
    for i in range(len(graph.vertices)):
        dist[i] = [None] * len(graph.vertices)
    graph.vertices.append(-1)
    for i in range(len(vertices))
        graph.edges.append(-1, i, 0)
    h = bellman_ford(-1, graph)
    for u in graph.vertices:
        for (u, v, w) in graph.edges:
            w = w + h[u] - h[v]
    for u in graph.vertices:
        dist[i] = dijkstra(i, graph)
    return dist
```

## Further Resources

[Johnson's algorithm - Wikipedia](https://en.wikipedia.org/wiki/Johnson%27s_algorithm)

# Further Resources

[Shortest path problem - Wikipedia](https://en.wikipedia.org/wiki/Shortest_path_problem)