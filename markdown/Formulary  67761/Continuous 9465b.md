# Continuous Functions

# Real-Valued Functions

## Boundedness

<aside>
💡 Let $f \in \mathbb{R}^D$.

1. $f$ is **bounded from above** if $f(D) \sube \mathbb{R}$ is bounded from above.
2. $f$ is **bounded from below** if $f(D) \sube \mathbb{R}$ is bounded from below.
3. $f$ is **bounded** if $f(D) \sube \mathbb{R}$ is bounded.
</aside>

## Monotony

<aside>
💡 A function $f : D \rightarrow \mathbb{R}$, where $D \sube \mathbb{R}$ is called

1. **monotonically increasing** if $\forall x,y \in D$

$$
x \leq y \implies f(x) \leq f(y)
$$

1. **strictly monotonically increasing** if $\forall x,y \in D$

$$
x \lt y \implies f(x) \lt f(y)
$$

1. **monotonically decreasing** if $\forall x,y \in D$

$$
x \leq y \implies f(x) \geq f(y)
$$

1. **strictly monotonically decreasing** if $\forall x,y \in D$

$$
x \lt y \implies f(x) \gt f(y)
$$

1. **monotonous** if $f$ is monotonically increasing or monotonically decreasing
2. **strictly monotonous** if $f$ is strictly monotonically increasing or strictly monotonically decreasing.
</aside>

## Continuity

<aside>
💡 Let $D \sube \mathbb{R}$, $x_0 \in D$. The function $f: D \rightarrow \mathbb{R}$ is **continuous in $x_0$** if for every $\epsilon \gt 0$ there exists a $\delta \gt 0$ such that for every $x \in D$ the implication

$$
\lvert x - x_0 \rvert \lt \delta \implies\lvert f(x) - f(x_0) \rvert \lt \epsilon
$$

holds.

</aside>

<aside>
💡 The function $f : D \rightarrow \mathbb{R}$ is **continuous** if it is continuous in every point of $D$.

</aside>

<aside>
📖 *Let $x_0 \in D \sube \mathbb{R}$ and $f : D \rightarrow \mathbb{R}$. The function $f$ is continuous in $x_0$ if and only if the following holds for every sequence $(a_n)_{n \geq 1}$ in $D$:*

$$
\lim_{n \to \infty} a_n = x_0 \implies \lim_{n \to \infty} f(a_n) = f(x_0).
$$

</aside>

<aside>
📎 *Let $x_0 \in D \sube \mathbb{R}, \lambda \in \mathbb{R}$ and $f : D \rightarrow \mathbb{R}, g:D\rightarrow \mathbb{R}$ both continuous in $x_0$.*

1. *Then $f+g, \lambda \cdot f, f \cdot g$ are continuous in $x_0$.*
2. *If $g(x_0) \neq 0$ then* 
    
    $$
    \begin{align*}
    \frac{f}{g}: D \cap \{x \in D \space \vert \space g(x) \neq 0\} & \longrightarrow \mathbb{R} \\
    x & \longmapsto \frac{f(x)}{g(x)}
    \end{align*}
    $$
    
    *is continuous in $x_0$.*
    
</aside>

<aside>
💡 A **polynomial function** $P:\mathbb{R} \rightarrow \mathbb{R}$ is a function of the form

$$
P(x) = a_nx^n+...+a_0
$$

where $a_n,...,a_0 \in \mathbb{R}$. If $a_n \neq 0$ then $n$ is the **degree** of $P$,

</aside>

<aside>
📎 *Polynomial functions are continuous on all of $\mathbb{R}$.*

</aside>

<aside>
📎 *Let $P, Q$ be polynomial functions on $\mathbb{R}$  with $Q \neq 0$. Let $x_1,...,x_m$ be the roots of $Q$. Then*

$$
\begin{align*}
\frac{P}{Q} : \mathbb{R} \setminus \{x_1,...,x_m\} & \longrightarrow \mathbb{R} \\
x & \longmapsto \frac{P(x)}{Q(x)}
\end{align*}
$$

*is continuous.*

</aside>

## Intermediate Value Theorem

<aside>
💡 Let $x_1, x_2 \in \mathbb{R}$. Then $c$ lies between $x_1$ and $x_2$ if:

1. $x_1 \leq x_2 \quad c\in[x_1, x_2]$ 
2. $x_2 \leq x_1 \quad c \in [x_2, x_1]$.
</aside>

<aside>
📎 (Bolzano 1817).

*Let $I \sube \mathbb{R}$ be an interval, $f:I \longrightarrow \mathbb{R}$ a continuous function and $a,b \in I.$ For every $c$ between $f(a)$ and $f(b)$ there exists a $z$ between $a$ and $b$ with $f(z) = c$.*

</aside>

<aside>
📎 *Let $P(x) = a_nx^n + a_{n-1}x^{n-1}+...+a_0$ be a polynomial with $a_n \neq 0$ and $n$ odd. Then $P$ has at least one root in $\mathbb{R}$.*

</aside>

## Min-Max Theorem

<aside>
💡 An interval $I \sube R$ is called **compact** if it is of the form

$$
I = [a,b] \quad a \leq b.
$$

</aside>

<aside>
💡 Let $D$ be a set and $f,g: D \longrightarrow \mathbb{R}$ be functions. We define

- $\lvert f \rvert(x) = \lvert f(x)\rvert, \quad \forall x \in D$
- $\max(f,g)(x) = \max(f(x),g(x)), \quad \forall x \in D$
- 
</aside>