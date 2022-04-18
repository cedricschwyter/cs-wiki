# Graphs

# Directed Graphs

A directed graph $G = (V, E)$ consists of a finite set of vertices $V = \{v_1, ..., v_n \}$ and a finite set of directed edges $E \sube V \times V$.

The degree $\text{deg}(u)$ of a vertex $u \in V$ is defined as the number of edges that touch $u$. For the degree of $u$ it holds that $\text{deg}(u) = \text{deg}_{\text{in}}(u) + \text{deg}_{\text{out}}(u)$, where $\text{deg}_{\text{in}}(u)$ is defined as the number of incoming vertices and $\text{deg}_{\text{out}}(u)$ is analogously defined as the number of outgoing vertices of $u$. 

# Source

A vertex $u$ is called a *source* if $\text{deg}_{\text{in}}(u) = 0$.

# Sink

A vertex $v$ is called a *sink* if $\text{deg}_{\text{out}}(v) = 0$.

# Undirected Graphs

An undirected graph $G = (V, E)$ consists of a finite set of vertices $V = \{v_1, ..., v_n\}$ and a finite set of undirected edges $E \sube V \times V$.

The degree $\text{deg}(u)$ of a vertex $u \in V$ is defined as the number of edges that touch $u$.

# Walk

A walk of length $l$ is tuple $W = (v_0, v_1, ...,v_{l - 1}, v_l)$ of vertices in a graph for which there exist edges $(v_i, v_{i + 1}) \in E$ for all $i \in \{0,..., l - 1\}$, i.e., consecutive vertices in a walk are adjacent. A walk is *closed* if it starts and ends with the same vertex $v_0 = v_l$. A walk $W = (v_0, v_1, ...,v_{l - 1}, v_l)$ is closed if and only if $\text{deg}(v_l)$ is even. We say that vertex $u$ *reaches* vertex $v$ if there exists a walk starting in $u$ and ending in $v$. This relation satisfies all properties of an equivalence relation: symmetry, reflexivity and transitivity.

The *connected component* of a vertex $u$ is the set of all vertices that it can reach, i.e., the connected component of $u$ is the equivalence class of the reachability relation that contains $u$. A graph is *connected* if every vertex $u$ reaches every other vertex $v$, i.e., if it has only one connected component.

A *Eulerian tour* is a closed walk that visits every edge exactly once. 

<aside>
📖 *A connected graph has a Eulerian tour if and only if all vertex degrees are even.*

</aside>

# Path

A path is a walk $(v_0, v_1, ...,v_{l - 1}, v_l)$ where all vertices are distinct.

# Circuit

A circuit is a walk $(v_0, v_1, ...,v_{l - 1}, v_l)$ where $v_0 = v_l$.

# Cycle

A cycle is a path $(v_0, v_1, ...,v_{l - 1}, v_l)$ where $v_0 = v_l$.

# Handshake Lemma

For every graph $G = (V, E)$,

$$
\sum_{v\in V} \text{deg}(v) = 2 \cdot \lvert E \rvert.
$$

# Eulerian Tours

## Eulerian Walk/Trail

A Eulerian walk is a walk that goes through every edge in a graph exactly once. A Eulerian walk in an undirected graph exists if and only if the graph is connected and at most two vertices have an odd degree. A Eulerian walk in a directed graph exists if and only if the graph is connected and at most one vertex has $(\text{out-degree}) - (\text{in-degree}) = 1$, at most one vertex has $(\text{in-degree}) - (\text{out-degree}) = 1$, every other vertex has equal $\text{in-degree}$ and $\text{out-degree}$.

## Eulerian Circuit/Tour

A Eulerian circuit/tour is a Eulerian walk where there is an edge between the starting and the ending vertex. A Eulerian circuit in an undirected graph exists if and only if the graph is connected and all vertices have an even degree. A Eulerian circuit in a directed graph exists if and only if the graph is connected and every vertex has $\text{in-degree}$ equal to the $\text{out-degree}$.

# Hamiltonian Tours

## Hamiltonian Path

A Hamiltonian path is a path that visits every vertex in a graph exactly once. 

## Hamiltonian Cycle

A Hamiltonian cycle is a Hamiltonian path where there is an edge between the starting and the ending vertex. Brute-force search appears to be unavoidable when computing whether there exists a Hamiltonian cycle for a given graph. The famous $P \neq NP$ conjecture turns out to be equivalent to conjecturing that there is no polynomial-time algorithm for computing Hamiltonian cycle.

# Bipartite Graph

A graph $G = (V, E)$ is *bipartite* if it is possible to partition the vertices in two sets $V_1$ and $V_2$ (i.e. $V_1 \cap V_2 = \varnothing$ and $V_1 \cup V_2 = V$) such that every edge $(u, v) \in E$ has one endpoint in $V_1$ and the other in $V_2$.

<aside>
📖 *A graph is bipartite if and only if it does not contain any cycle of odd length.*

</aside>

# Adjacency Matrix

The *adjacency matrix* $A = (A_{ij})$, $i,j \in V$ of $G$ is defined as

$$
A_{ij} = \begin{cases}
1 &\text{if $(i,j) \in E$}, \\
0 & \text{otherwise}.
 \end{cases}
$$

# Adjacency List

The *adjacency list* representation of a graph $G$ is an $n$-dimensional array $A$ such that $A[i]$ is a list of all neighbors of vertex $i$ in $G$ (in arbitrary order).

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

# Topological Sort using Depth-First Search (DFS)

A directed graph $G = (V,E)$ has a topological sort if and only if it contains no directed cycles.

<aside>
💡 There exists a directed cycle if and only if there exists a back-edge in the DFS tree of $G$.

</aside>

<aside>
💡 For all edges $(u, v) \in E$ in the DFS tree that are not a back-edge it holds that $\text{post}(u) \geq \text{post}(v)$.

</aside>

<aside>
💡 From the above observations it follows that if there does not exist a directed cycle then there does not exist a back edge in the DFS tree. Since for all non-back-edges $(u,v) \in E$ of the DFS tree it holds that $\text{post}(u) \geq \text{post}(v)$ it follows that the reverse post-ordering corresponds to a topological sort of $G$.

</aside>

## Runtime

Adjacency-Matrix: $O(n^2)$

Adjacency-List: $O(\lvert V \rvert + \lvert E \rvert)$

## Pseudocode

```python
pre = []
post = []
t = 0

def visit(u):
    pre[u] = t
    t = t + 1
    mark(u)
    for v in u.children:
        if !marked(v):
            visit(v)
    post[u] = t
    t = t + 1

def dfs(graph):
    pre = [None] * len(graph.nodes)
    post = [None] * len(graph.nodes)
    t = 1
    unmarkAll(graph.nodes)
    for u in graph.nodes:
        if !marked(u):
            visit(u)

# reverse(post) gives a topological sort
```

## Further Resources

[Topological sorting - Wikipedia](https://en.wikipedia.org/wiki/Topological_sorting)

# Glossary of Graph Terms

[Glossary of graph theory - Wikipedia](https://en.wikipedia.org/wiki/Glossary_of_graph_theory)