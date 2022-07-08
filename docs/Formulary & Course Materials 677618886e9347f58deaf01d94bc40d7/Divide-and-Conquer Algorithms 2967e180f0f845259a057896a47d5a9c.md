# Divide-and-Conquer Algorithms

# Master Theorem for Recurrences


📖 *Master theorem:
Let $a, C \gt 0$ and $b \geq 0$ be constants and $T : \mathbb{N} \longrightarrow \mathbb{R}^+$ a function such that for all even $n \in \mathbb{N}$,*

$$
T(n) \leq aT(n/2) + Cn^b.
$$

*Then for all $n = 2^k, k\in \mathbb{N}$,*

- *If $b \gt \log_2a, T(n) \leq O(n^b)$.*
- *If $b = \log_2a, T(n) \leq O(n^{\log_2a}\cdot \log n)$.*
- *If $b \lt \log_2 a, T(n) \leq O(n^{\log_2a})$.*

*If the function $T$ is increasing, then the condition $n = 2^k$ can be dropped. If the master inequality holds with $=$, then we may replace $O$ with $\Theta$ in the conclusion.*

