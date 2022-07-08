# Big-O-/Asymptotic-Notation, Landau-Symbols

# Big-O-Notation


💡 For $f : \mathbb{N} \longrightarrow \mathbb{R} ^ +$,

$$
O(f) := \{g : \mathbb{N} \longrightarrow \mathbb{R}^+ \space | \space \exists C \gt 0 \space \forall n \in \mathbb{N} \space g(n) \leq C \cdot f(n)\}.
$$

$O(f)$ is called the *order* of $f$.

If a function $g$ is on the order of $f$ we write $g \in O(f)$ or equivalently $g \leq O(f)$.



# Omega-Notation


💡 For $f : \mathbb{N} \longrightarrow \mathbb{R} ^ +$,

$$
\Omega(f) := \{g : \mathbb{N} \longrightarrow \mathbb{R}^+ \space | \space \exists C \gt 0 \space \forall n \in \mathbb{N} \space g(n) \geq C \cdot f(n)\}.
$$

We write $g \in \Omega(f)$ or $g \geq \Omega(f)$.



# Theta-Notation


💡 For $f : \mathbb{N} \longrightarrow \mathbb{R} ^ +$,

$$
\Theta(f) = O(f) \cap \Omega(f).
$$

We write $g \in \Theta(f)$ or $g = \Theta(f)$.



# Useful Theorems when Working with Asymptotic Notation


📖 *L’Hôpital’s Rules:
Let $f$and $g$ be two differentiable functions. Then*

$$
\lim_{n \to \infty} \frac{f(n)}{g(n)} = \lim_{n \to \infty} \frac{f'(n)}{g'(n)}.
$$




📖 *Let $f : \mathbb{N} \longrightarrow \mathbb{R} ^ +$ and $g : \mathbb{N} \longrightarrow \mathbb{R} ^ +$. Then*

- *If $\lim\limits_{n \to \infty} \frac{f(n)}{g(n)} = 0$, then $f \leq O(g)$ and $g \space \cancel \leq \space O(f)$.*
- *If $\lim\limits_{n \to \infty} \frac{f(n)}{g(n)} = C \in \mathbb{R}$, then $f \leq O(g)$, $g \leq O(f)$, $f = \Theta(g)$ and $g = \Theta(f)$.*
- *If $\lim\limits_{n \to \infty} \frac{f(n)}{g(n)} = \infty$, then $f \space \cancel \leq \space O(g)$, $g \leq O(f)$ and $f \geq \Omega(g)$.*



📖 *Let $f, g, h : \mathbb{N} \longrightarrow \mathbb{R}^+$. If $f \leq O(h)$ and $g \leq O(h)$, then*

1. *For every constant $c \geq 0$, $c \cdot f \leq O(h)$.*
2. $f + g \leq O(h)$.


Notice that for all real numbers $a, b \gt 1$, $\log_a n = \log_ab \cdot \log_bn$ (where $\log_ab$ is a positive constant). Hence $\log_an \leq O(\log_bn)$. So bases of logarithms do not have any impact in asymptotic notation and one can just write $O(\log n)$.


💡 In general exponential runtime is regarded as bad, and polynomial runtime as good, i.e., $O(2^n)$ is bad and $O(n^4)$ for example is good.




💡 Counterintuitive facts:

- $\log n \leq O(n^{0.00...1})$
- $n^{10000} \leq O(1.000...1^n)$
- $\log_2 n \leq O(\log_3n)$
- $\log_3 n \leq O(\log_2 n)$
