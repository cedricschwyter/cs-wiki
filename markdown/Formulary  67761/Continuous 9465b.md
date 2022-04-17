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
- $\min(f,g)(x) = \min(f(x),g(x)), \quad \forall x \in D.$
</aside>

<aside>
📌 *Let $D \sube \mathbb{R}, x_0 \in D$ and $f,g : D \longrightarrow \mathbb{R}$ continuous in $x_0$. Then*

$$
\lvert f \rvert, \max(f,g), \min(f,g)
$$

*are continuous in $x_0$.*

</aside>

<aside>
📌 *Let $(x_n)_{n\geq1}$ be a convergent sequence in $\mathbb{R}$ with limit*

$$
\lim_{x\to \infty} x_n \in \mathbb{R}.
$$

*Let $a \leq b$. If $\{x_n \space \vert \space n \geq 1 \} \sube [a,b]$ it follows that*

$$
\lim_{n \to \infty}x_n \in [a,b].
$$

</aside>

<aside>
📖 *Let $f: I = [a,b] \longrightarrow \mathbb{R}$ be continuous on a compact interval $I$. Then there exists $u \in I$ and $v \in I$ with*

$$
f(u) \leq f(x) \leq f(v) \quad \forall x \in I.
$$

*In particular, $f$ is bounded.*

</aside>

## The Theorem about the Inverse Transformation

<aside>
📖 *Let $D_1, D_2 \sube \mathbb{R}$ be two subsets, $f:D_1 \longrightarrow D_2, g: D_2 \longrightarrow \mathbb{R}$ be two functions and $x_0 \in D_1$. If $f$ is continuous in $x_0$ and $g$ is continuous in $f(x_0)$ then*

$$
g \circ f: D_1 \longrightarrow \mathbb{R}
$$

*is continuous in $x_0$.*

</aside>

<aside>
📎 *If $f$ is continuous on $D_1$ and $g$ is continuous on $D_2$ then $g \circ f$ is continuous on $D_1$.*

</aside>

<aside>
📖 *Let $I \sube \mathbb{R}$ be an interval and $f : I \longrightarrow \mathbb{R}$ be continuous and strictly monotonous. Then $J = f(I) \sube \mathbb{R}$ is an interval and $f^{-1}: J \longrightarrow I$ is continuous and strictly monotonous.*

</aside>

## The Real Exponential Function

<aside>
📖 $*\exp:\mathbb{R} \longrightarrow (0, +\infty)$ is strictly monotonically increasing, continuous and surjective.*

</aside>

<aside>
📎 *All of the following follow from the power series expansion of $\exp(x)$:*

$$
\exp(x) \gt 0 \quad \forall x \in \mathbb{R}.
$$

$$
\exp(x) \gt 1 \quad \forall x \gt 0.
$$

*If now $y \lt z$, then it follows that:*

$$
\exp(z) = \exp(y+(z-y))=\exp(y)\exp(z-y)
$$

*and because $\exp(z-y) \gt 1$ it follows that:*

$$
\exp(z) \gt \exp(y) \quad \forall z \gt y.
$$

$$
\exp(x) \geq 1 + x \quad \forall x \in \mathbb{R}.
$$

*Let $x \in \mathbb{R}$ and $N$ such that*

$$
\frac{x}{N} \gt -1
$$

*from which it follows that:*

$$
\frac{x}{n} \gt -1 \quad \forall n \geq N
$$

*For all $n \geq N$ it follows through Bernoulli’s Inequality that:*

$$
(1+\frac{x}{n})^n \geq 1+n(\frac{x}{n}) = 1+x
$$

*from which in turn it follows that:*

$$
\exp(x) = \lim_{n \to \infty}(1+\frac{x}{n}^n) \geq 1+x.
$$

</aside>

<aside>
📎 *The natural logarithm*

$$
\ln:(0, +\infty) \longrightarrow \mathbb{R}
$$

*is a strictly monotonically increasing, continuous, bijective function. Furthermore, it holds that*

$$
\ln(a \cdot b) = \ln a + \ln b \quad \forall a,b,\in(0, +\infty).
$$

</aside>

<aside>
💡 We can now use the logarithm and exponential function to define general powers. For $x \gt 0$ and $a \in \mathbb{R}$ arbitrary we define:

$$
x^a=\exp(a \ln x).
$$

In particular: $x^0=1 \quad \forall x \gt 0.$

</aside>

<aside>
📎

1. *For $a \gt 0$*
    
    $$
    \begin{align*}
    (0, + \infty) & \longrightarrow (0, + \infty) \\
    x & \longmapsto x^a
    \end{align*}
    $$
    
    *is a continuous, strictly monotonically increasing bijection.*
    
2. *For $a \lt 0$*
    
    $$
    \begin{align*}
    (0, +\infty) & \longrightarrow (0, + \infty) \\
    x & \longmapsto x^a
    \end{align*}
    $$
    
    *is a continuous, strictly monotonically decreasing bijection.*
    
3. $\ln(x^a) = a \ln(x) \quad \forall a \in \mathbb{R}, \forall x \gt 0.$
4. $x^a \cdot x^b = x^{a+b} \quad \forall a,b \in \mathbb{R}, \forall x \gt 0.$
5. $(x^a)^b = x^{a \cdot b} \quad \forall a,b \in \mathbb{R}, \forall x \gt 0.$
</aside>

## Convergence of Sequences of Functions

<aside>
💡 Let $D$ be a set. Analogously to the definition of a sequence of real numbers a (real-valued) sequence of functions is a transformation

$$
\begin{align*}
\mathbb{N} & \longrightarrow \mathbb{R}^D \\
n & \longmapsto f(n).
\end{align*}
$$

Just like we did in the case of sequences we will denote $f(n)$ by $f_n$ and the sequence of functions as $(f_n)_{n \geq 0}$. For every $x \in D$ we get a sequence $(f_n(x))_{n \geq 0}$ in $\mathbb{R}$.

</aside>

<aside>
💡 The sequence of functions $(f_n)_{n \geq 0}$ **converges pointwise** towards a function $f :D \longrightarrow \mathbb{R}$ if for all $x \in D$:

$$
f(x) = \lim_{n \to \infty} f_n(x)
$$

</aside>

<aside>
💡 (Weierstrass 1841)

The sequence 

$$
f_n:D \longrightarrow \mathbb{R}
$$

**converges uniformly** in $D$ towards

$$
f: D \longrightarrow \mathbb{R}
$$

if it holds that: $\forall \epsilon \gt 0 \quad \exists N \geq 1$ such that:

$$
\forall n \geq N, \forall x \in D \quad \lvert f_n(x) - f(x) \rvert \lt \epsilon.
$$

</aside>

<aside>
📖 *Let $D \sube \mathbb{R}$ and $f_n : D \longrightarrow \mathbb{R}$ be a sequence of functions consisting of continuous functions (in $D$) that converge uniformly (in $D$) towards a function $f : D \longrightarrow \mathbb{R}$. Then $f$ is continuous (in $D$).*

</aside>

<aside>
💡 A sequence of functions

$$
f_n : D \longrightarrow \mathbb{R}
$$

is **uniformly convergent** if for every $x \in D$ the limit

$$
f(x) = \lim_{n \to \infty} f_n(x)
$$

exists and the sequence $(f_n)_{n \geq 0}$ converges uniformly towards $f$.

</aside>

<aside>
📎 *The sequence of functions*

$$
f_n : D \longrightarrow \mathbb{R}
$$

converges uniformly in $D$ if and only if: 

$\forall \epsilon \gt 0 \quad \exists N \geq 1$ such that $\forall n,m \geq N$ and $\forall x \in D$:

$$
\lvert f_n(x) - f_m(x) \rvert \lt \epsilon.
$$

</aside>

<aside>
📎 *Let $D \sube \mathbb{R}$. If $f_n : D \longrightarrow \mathbb{R}$ is a uniformly convergent sequence of continuous functions, then the function*

$$
f(x) = \lim_{n \to \infty} f_n(x)
$$

*is continuous.*

</aside>

<aside>
💡 Let $f_n : D \longrightarrow \mathbb{R}$ be a sequence of functions.

The series $\sum_{k=0}^\infty f_k(x)$ converges uniformly (in $D$), if the sequence of functions given by 

$$
S_n(x) = \sum_{k=0}^n f_k(x)
$$

converges uniformly.

</aside>