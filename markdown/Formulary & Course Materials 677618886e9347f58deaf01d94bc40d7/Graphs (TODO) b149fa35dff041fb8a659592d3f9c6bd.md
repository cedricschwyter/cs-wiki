# Graphs (TODO)

[Graphs](Graphs%20f8a1f5321e374c5cae7e05e6cecaacd6.md) 

# Connectivity

<aside>
💡 Let $G = (V, E)$ be a graph. $G$ is called connected if it holds for all $u, v \in V, u \neq v$ that: there exists a $u$-$v$-path in $G$.

</aside>

<aside>
💡 A graph $G=(V, E)$ is called $k$-connected when:

- $\lvert V \rvert \geq k + 1$ and
- $G[V \setminus X]$ is a connected graph $\forall X \sube V$ with $\lvert X \rvert \lt k$

i.e., one has to remove at least $k$ vertices (and adjacent edges) in order to turn the graph into a disconnected graph.

</aside>

<aside>
💡 If $G$ contains a vertex $u$ with degree $\text{deg}(u) \lt k$, then $G$ is not $k$-connected.

</aside>

<aside>
📖 Menger’s Theorem (Vertices):

*Let $G = (V, E)$ be a graph. Then it holds that $G$ is $k$-connected if and only if $\forall u, v \in V, u \neq v$ there exist $k$ disjoint $u$-$v$-paths.*

</aside>

<aside>
💡 Let $G = (V, E)$ be a graph. $G$ is called $k$-edge-connected when:

- $(V, E \setminus X)$ is connected $\forall X \sube E$ with $\lvert X \rvert \lt k$
</aside>

<aside>
📖 Menger’s Theorem (Edges):

*Let $G=(V, E)$ be a graph. Then it holds that $G$ is $k$-edge-connected if and only if $\forall u, v \in V, u \neq v$ there exist $k$ edge-disjoint $u$-$v$-paths.*

</aside>

<aside>
💡 It always holds that:

$$
\text{Vertex Connectivity} \leq \text{Edge Connectivity} \leq \text{Minimum Vertex-Degree}
$$

</aside>

## Cut Vertices/Cut Edges

<aside>
💡 Let $G=(V,E)$ be a connected graph. A vertex $v \in V$ is called a *cut vertex* if and only if $G[V \setminus \{v\}]$ is disconnected.

</aside>

<aside>
💡 Let $G = (V,E)$ be a connected graph. An edge $e \in E$ is called a *cut edge* if and only if $G - e$ is not connected.

</aside>

<aside>
📌  *Let $G = (V, E)$ be a connected graph. If $(x, y) \in E$ is a cut edge then it holds that: $\text{deg}(x) = 1$ or $x$ is a cut vertex, and analogously for $y$. Note that this does not hold in the other direction for the general case.*

</aside>

<aside>
💡 Let $G=(V,E)$ be a graph. We define an equivalence relation on $E$ by

$$
e \sim f \iff \begin{cases}
e = f, \space \text{or} \\
\exists \space \text{cycle through $e$ and $f$}
\end{cases}
$$

The equivalence classes will be called *blocks*.

</aside>

<aside>
📌 *Two blocks intersect, if at all, always in a cut vertex.*

</aside>

### Algorithm for Finding Cut Vertices and Cut Edges

Using a slightly modified version of DFS we can find cut vertices and cut edges in linear time ($O(\lvert V\rvert + \lvert E \rvert)$). We use the following recurrence:

$$
\text{low}[v] = \min \Bigg ( \text{dfs[v]}, \min_{(v, w) \in E}\begin{cases} \text{dfs}[w], & \text{if $(v, w)$ left-over edge} \\ \text{low}[w], & \text{if $(v,w)$ tree edge} \end{cases} \Bigg)
$$

where $\text{low}[v]$ is defined as the smallest $\text{dfs}$ number that is reachable from $v$ by a directed path consisting of an arbitrary number of tree edges and at max one left-over edge. The $\text{dfs}$ number of a vertex $v$ is defined as the pre-ordering number of $v$.

# Tours/Cycles

<aside>
💡 Let $G = (V,E)$ be a graph. A Hamiltonian cycle is a cycle in $G$ that contains every vertex $v \in V$ exactly once. A Eulerian tour is a closed walk in $G$ that contains every edge $(u, v) \in E$ exactly once. If a graph contains a Hamiltonian cycle the graph is called **hamiltonian**.

</aside>

<aside>
📖 *A connected graph $G = (V, E)$ contains a Eulerian tour if and only if the degree $\deg v$ of every vertex $v \in V$ is even. Such a Eulerian tour can be found in $O(\lvert E \rvert)$ if it exists. If a graph contains a Eulerian tour the graph is called **Eulerian**.*

</aside>

Note: If in a connected graph all except two vertices have even degree then the graph contains an Eulerian Walk.

## Hamiltonian Cycle

<aside>
📖 *Let $m, n \geq 2$. A $n \times m$ grid contains a Hamiltonian cycle if and only if $n \cdot m$ is even.*

</aside>

<aside>
📖 *A bipartite graph $G=(A \cup B,E)$ with $\lvert A \rvert \neq \lvert B \rvert$ cannot contain a Hamiltonian cycle.*

</aside>

<aside>
📖 Dirac’s Theorem:

*Every graph $G=(V,E)$ with $\vert V \rvert \geq 3$ and minimum degree $\delta (G) \geq \frac{\lvert V \rvert}{2}$ contains a Hamiltonian cycle.*

</aside>

### Application: Hamiltonian Cycle in a Hypercube: Gray-Code

[Hamiltonian Cycle in a Hypercube: Gray-Code](Graphs%20(TODO)%20b149fa35dff041fb8a659592d3f9c6bd/Hamiltonian%20Cycle%20in%20a%20Hypercube%20Gray-Code%201e5ecb970a794ec7baa9a405b7023363.md)

## Eulerian Tour

A Eulerian tour can be found in $O(\lvert E \rvert)$ using the fast and slow runner algorithm described in section 1.5.1 of the script.

### Pseudocode

![2022-03-05_17-41.png](Graphs%20(TODO)%20b149fa35dff041fb8a659592d3f9c6bd/2022-03-05_17-41.png)