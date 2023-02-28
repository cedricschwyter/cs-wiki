# Searching

# Binary Search

## Runtime

<span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal" style="margin-right:0.02778em;">O</span><span class="mopen">(</span><span class="mop">lo<span style="margin-right:0.01389em;">g</span></span><span class="mspace" style="margin-right:0.1667em;"></span><span class="mord mathnormal">n</span><span class="mclose">)</span></span></span></span>

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

Best-Case: <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal" style="margin-right:0.02778em;">O</span><span class="mopen">(</span><span class="mop">lo<span style="margin-right:0.01389em;">g</span></span><span class="mspace" style="margin-right:0.1667em;"></span><span class="mop">lo<span style="margin-right:0.01389em;">g</span></span><span class="mspace" style="margin-right:0.1667em;"></span><span class="mord mathnormal">n</span><span class="mclose">)</span></span></span></span>

Worst-Case: <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal" style="margin-right:0.02778em;">O</span><span class="mopen">(</span><span class="mord mathnormal">n</span><span class="mclose">)</span></span></span></span>

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

<span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal" style="margin-right:0.02778em;">O</span><span class="mopen">(</span><span class="mord mathnormal">n</span><span class="mclose">)</span></span></span></span>

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

Is it possible to sort in under <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord">Θ</span><span class="mopen">(</span><span class="mop">lo<span style="margin-right:0.01389em;">g</span></span><span class="mspace" style="margin-right:0.1667em;"></span><span class="mord mathnormal">n</span><span class="mclose">)</span></span></span></span> comparisons?

Every comparison-based searching algorithm corresponds to some binary decision tree. Then the elements of the searched array correspond to the nodes of that tree. Therefore there are <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:0.4306em;"></span><span class="mord mathnormal">n</span></span></span></span> nodes in the tree. The worst-case runtime corresponds to the height of the tree, denoted by <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:0.6944em;"></span><span class="mord mathnormal">h</span></span></span></span>.

A tree that has height <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:0.6944em;"></span><span class="mord mathnormal">h</span></span></span></span> must have no more than <span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:0.8491em;"></span><span class="mord"><span class="mord">2</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height:0.8491em;"><span style="top:-3.063em;margin-right:0.05em;"><span class="pstrut" style="height:2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mathnormal mtight">h</span></span></span></span></span></span></span></span></span></span></span> nodes, thus

<span class="katex-display"><span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:3.0591em;vertical-align:-1.2796em;"></span><span class="mord"><span class="mtable"><span class="col-align-r"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:1.7796em;"><span style="top:-3.8804em;"><span class="pstrut" style="height:3em;"></span><span class="mord"></span></span><span style="top:-2.3804em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">⟺</span><span class="mspace" style="margin-right:0.2778em;"></span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.2796em;"><span></span></span></span></span></span><span class="col-align-l"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height:1.7796em;"><span style="top:-3.8804em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord"></span><span class="mord"><span class="mord">2</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height:0.8991em;"><span style="top:-3.113em;margin-right:0.05em;"><span class="pstrut" style="height:2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mathnormal mtight">h</span></span></span></span></span></span></span></span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">&gt;</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord">1</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mord">2</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mord"><span class="mord">2</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height:0.8641em;"><span style="top:-3.113em;margin-right:0.05em;"><span class="pstrut" style="height:2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight">2</span></span></span></span></span></span></span></span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mord">...</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mord"><span class="mord">2</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height:0.8991em;"><span style="top:-3.113em;margin-right:0.05em;"><span class="pstrut" style="height:2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mathnormal mtight">h</span><span class="mbin mtight">−</span><span class="mord mtight">1</span></span></span></span></span></span></span></span></span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">=</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord"><span class="mord">2</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height:0.8991em;"><span style="top:-3.113em;margin-right:0.05em;"><span class="pstrut" style="height:2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mathnormal mtight">h</span></span></span></span></span></span></span></span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">−</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mord">1</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">≥</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord mathnormal">n</span></span></span><span style="top:-2.3804em;"><span class="pstrut" style="height:3em;"></span><span class="mord"><span class="mord"></span><span class="mord mathnormal">h</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">≥</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mop">lo<span style="margin-right:0.01389em;">g</span></span><span class="mspace" style="margin-right:0.1667em;"></span><span class="mord mathnormal">n</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">≥</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mord">Ω</span><span class="mopen">(</span><span class="mop">lo<span style="margin-right:0.01389em;">g</span></span><span class="mspace" style="margin-right:0.1667em;"></span><span class="mord mathnormal">n</span><span class="mclose">)</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height:1.2796em;"><span></span></span></span></span></span></span></span></span></span></span></span>

# Breadth-First Search (BFS)

## Runtime

<span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal" style="margin-right:0.02778em;">O</span><span class="mopen">(∣</span><span class="mord mathnormal" style="margin-right:0.22222em;">V</span><span class="mclose">∣</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span></span><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mopen">∣</span><span class="mord mathnormal" style="margin-right:0.05764em;">E</span><span class="mclose">∣)</span></span></span></span>

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

<span class="katex"><span class="katex-html" aria-hidden="true"><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mord mathnormal" style="margin-right:0.02778em;">O</span><span class="mopen">(∣</span><span class="mord mathnormal" style="margin-right:0.22222em;">V</span><span class="mclose">∣</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span></span><span class="base"><span class="strut" style="height:1em;vertical-align:-0.25em;"></span><span class="mopen">∣</span><span class="mord mathnormal" style="margin-right:0.05764em;">E</span><span class="mclose">∣)</span></span></span></span>

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