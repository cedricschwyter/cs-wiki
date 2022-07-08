# Minimum Spanning Trees (MSTs)

# General

A minimum spanning tree for a graph $G = (V, E)$ has the following defining properties:

- it contains all $v \in V$
- it does not contain any cycles


📖 *Let $G = (V, E)$ be a weighted graph with nonnegative weights ($\forall e \in E \space w(e) \geq 0$) such that all edge weights are different ($\forall e \neq e'$ in $E$, $w(e) \neq w(e')$). Then the minimum spanning tree of $G$ is unique.*



# Boruvka’s Algorithm

## Runtime

$O((\lvert V \rvert + \lvert E \rvert) \cdot \log \lvert V \rvert)$

## Pseudocode

[Python/minimum_spanning_tree_boruvka.py at master · TheAlgorithms/Python](https://github.com/TheAlgorithms/Python/blob/master/graphs/minimum_spanning_tree_boruvka.py)

## Further Resources

[Borůvka's algorithm - Wikipedia](https://en.wikipedia.org/wiki/Bor%C5%AFvka%27s_algorithm)

# Kruskal’s Algorithm

## Runtime

$O((\lvert V \rvert + \lvert E \rvert) \cdot \log \lvert V \rvert)$

## Pseudocode

[Python/minimum_spanning_tree_kruskal.py at master · TheAlgorithms/Python](https://github.com/TheAlgorithms/Python/blob/master/graphs/minimum_spanning_tree_kruskal.py)

## Further Resources

[Kruskal's algorithm - Wikipedia](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm)

# Prim’s Algorithm

## Runtime

$O((\lvert V \rvert + \lvert E \rvert) \cdot \log \lvert V \rvert)$

## Pseudocode

[Python/minimum_spanning_tree_prims.py at master · TheAlgorithms/Python](https://github.com/TheAlgorithms/Python/blob/master/graphs/minimum_spanning_tree_prims.py)

## Further Resources

[Prim's algorithm - Wikipedia](https://en.wikipedia.org/wiki/Prim%27s_algorithm)