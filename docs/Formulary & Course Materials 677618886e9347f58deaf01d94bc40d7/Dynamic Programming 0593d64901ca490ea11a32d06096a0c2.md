# Dynamic Programming

# Motivation

DP can be used to easily reduce recursive problems from exponential runtime to down polynomial and oftentimes even linear runtime by using tabulation (bottom-up) and memoization (top-down). It makes use of the overlapping subproblems structure and optimal substructure properties of certain problems.

# General Roadmap for DP Problems

1. Definition of the DP table:
    1. What dimensions does the table have?
    2. What is the meaning of each entry?
2. Computation of an entry:
    1. How can an entry be computed from the values of other entries?
    2. Specify the base cases, i.e., the entries that do not depend on others.
3. Calculation order:
    1. In which order can entries be computed so that values needed for each entry have been determined in previous steps?
4. Extracting the solution: How can the final solution be extracted once the table has been filled?
5. Running time:
    1. What is the running time of your solution?

# Subset Sum Problem

We have a set $A$ of $n$ elements that need to be split into two sets such that the sum of those sets is equal. Let $b \in \mathbb{N}$ be that sum.

Idea: $b$ is subset sum of $A_1,...,A_{n-1}$ or $b - A_n$ is subset sum of $A_1,...,A_{n - 1}$. Let $TS(i, s)$ be a predicate defined by $TS(i, s) = 1 \iff s \text{ is subset sum of }A_1,...,A_i$.

Recurrence: $TS(i, s) = TS(i - 1, s) \lor TS(i - 1, s-A_i)$

$DP[i][s] = DP[i - 1][s] \lor DP[i - 1][s - A_i]$ computes a new entry.

$DP[n][b]$ gives the solution.

# Knapsack Problem

We have a set $A$ of $n$ elements. Every element $i$ has a value $v_i$ and a weight $w_i$. We have a maximum weight limit $W$. We are looking to maximize the summed value of the elements such that the sum of their weights is smaller than $W$.  Let $MV(i, w)$ be a function such that $MV(i, w)$ gives the maximum achievable value from values $A_1, ...,A_i$ such that their weights summed up remain smaller than $w$.

Recurrence: 

$$
\begin{align*}
MV(i, w) = \begin{cases}
\max (MV(i - 1, w), MV(i - 1, w - w_i) + v_i ) \space & \text{if} \space w \geq w_i\\
MV(i - 1, w) \space & \text{else}
\end{cases}
\end{align*}
$$

$DP[i][w] = MV(i,w)$ computes an entry.

$DP[n][W]$ gives the solution.