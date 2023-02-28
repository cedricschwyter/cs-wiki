# Sequences and Series

# Sequences

<aside>
💡 A **sequence** (of real numbers) is a transformation

$$
a : \mathbb{N } \longrightarrow \mathbb{R}
$$

We write $a_n$ instead of $a(n)$ and denote a series with $(a_n)_{n\geq1}$.

</aside>

<aside>
📌 *Let $(a_n)_{n_\geq 1}$ a sequence. Then there exists at most one real number $l \in \mathbb{R}$ with the property:*

$$
\forall \epsilon \gt 0 \space \text{the set} \space \{n \in \mathbb{N} \space \vert \space a_n \notin (l - \epsilon, l + \epsilon)\} \space \text{is finite}.
$$

</aside>

## Convergence and Limit

<aside>
💡 A sequence $(a_n)_{n\geq 1}$ is called **convergent** if there exists $l \in \mathbb{R}$ such that $\forall \epsilon \gt 0$ the set

$$
\{n \in \mathbb{N}^* \space \vert \space a_n \notin (l - \epsilon , l + \epsilon)\}
$$

is finite. By lemma, if such a number $l$ exists it is uniquely determined, and is denoted

$$
\lim_{n \to \infty} a_n
$$

and is called the **limit** of the sequence $(a_n)_{n \geq 1}$.

</aside>

<aside>
💡 In other words, a sequence $(a_n)$ has a limit $L$ if and only if there exist only a finite number of elements of the sequence outside an arbitrarily large surrounding area of $L$ ($(L - \epsilon, L + \epsilon)$).

</aside>

<aside>
📌 *Let $(a_n)_{n \geq 1}$a sequence. The following statements are equivalent:*

- $*(a_n)_{n\geq 1}$ converges to $l = \lim _{n \to \infty} a_n$*
- $*\forall \epsilon \gt 0 \quad \exists N \geq 1$, such that*
    
    $$
    \lvert a_n - l \rvert \lt \epsilon \quad \forall n \geq N.
    $$
    
</aside>

<aside>
📖 *Let $(a_n)_{n \geq 1}$ and $(b_n)_{n\geq 1}$ convergent sequences with $a = \lim_{n\to \infty}a_n$, $b = \lim_{n_\to \infty}b_n$.*

- *Then $(a_n + b_n)_{n\geq 1}$ is convergent and $\lim_{n \to \infty}(a_n+b_n) = a + b$.*
- *Then $(a_n \cdot b_n)_{n \geq 1}$ is convergent and $\lim_{n \to \infty}(a_n \cdot b_n) = a \cdot b.$*
- *Assume, that $b_n \neq 0 \quad \forall n \geq 1$ and $b \neq 0$. Then $\big( \frac{a_n}{b_n} \big)_{n\geq 1}$ is convergent and $\lim_{n \to \infty} \big( \frac{a_n}{b_n} \big) = \frac{a}{b}.$*
- *If there exists $K \geq 1$ with $a_n \leq b_n \quad \forall n \geq K$ then it follows that $a \leq b$.*
</aside>

<aside>
📖 “Sandwich Theorem”, Squeeze Theorem:

*Let $(a_n)$, $(b_n)$ be two convergent sequences with the same limit $L \in \mathbb{R}$. Let $k \in \mathbb{N}$ and $(c_n)$ be a sequence with the property that*

$$
a_n \leq c_n \leq b_n \quad \forall n > k.
$$

*Then $c_n$ converges to $L$.*

</aside>

## Monotony

<aside>
💡 Monotonically increasing/decreasing:

- $(a_n)_{n\geq 1}$ is **monotonically increasing** if:
    
    $$
    a_n \leq a_{n+1} \quad \forall n \geq 1.
    $$
    
- $(a_n)_{n \geq 1}$ is **monotonically decreasing** if:
    
    $$
    a_{n+1} \leq a_n \quad \forall n \geq1.
    $$
    
</aside>

<aside>
📖 Weierstrass’ Theorem (Monotony Convergence Theorem):

- *Let $(a_n)_{n\geq 1}$ be monotonically increasing and bounded from above. Then $(a_n)_{n \geq 1}$ converges towards*
    
    $$
    \lim_{n \to \infty} a_n = \sup\{a_n \space \vert \space n \geq 1 \}.
    $$
    
- *Let $(a_n)_{n\geq 1}$ be monotonically decreasing and bounded from below. Then $(a_n)_{n \geq 1}$ converges towards*
    
    $$
    \lim_{n \to \infty} a_n = \inf\{a_n \space \vert \space n \geq 1 \}.
    $$
    
</aside>

<aside>
💡 In other words, the above theorem say that if a sequence is monotonically in-/decreasing and it is bounded from above/below respectively, then it is a convergent sequence.

</aside>

<aside>
💡 The sequence $\big( 1 + \frac{1}{n} \big)^{n}$, $n \geq 1$ converges. The limit is

$$
e = \lim_{n \to \infty} (1 + \frac{1}{n})^n,
$$

Euler’s number $e=2.71828...$.

The sequence can be applied in compounding interest rates, for example: Assume you take out a loan for 1 CHF, with 100% yearly interest rate. When compounding once a year ($n=1$), well, you owe 2 CHF as given by $(1+1)^1 = 2$. When compounding twice a year ($n=2$) you owe 2.25 CHF as given by $(1+\frac{1}{2})^2 = 2.25$.

Every month ($n=12$): $(1+\frac{1}{12})^{12} = 2.613...$. 

Every day ($n=365$): $(1+\frac{1}{365})^{365} = 2.714...$

At max, you will owe $e$ CHF.

</aside>

## Boundedness

<aside>
💡 A sequence is called **bounded** if the set of elements of the sequence $\{a_n \space \vert \space n \in \mathbb{N}\}$ is bounded.

</aside>

<aside>
💡 A sequence $(a_n)_{n \geq 1}$ is called a zero-sequence if $\lim a_n = 0.$

</aside>

<aside>
💡 Every convergent sequence is bounded, but not necessarily the other way around.

</aside>

<aside>
💡 The sequence $x_n = q^n$ is called a **geometric sequence**. It holds for all $n$ that $\frac{x_{n+1}}{x_n} = q$.

</aside>

<aside>
📌 (Bernoulli’s Inequality).

$$
(1+x)^n \geq 1 + n \cdot x \quad \forall n \in \mathbb{N}, x \gt -1
$$

</aside>

<aside>
💡 Fixed-point Interation:

Used for recursive sequences.

Example: $\sqrt{c}$ is the solution of the equation 

$$
\begin{align*}
&  x^2=c \\
\iff & x^2  = \frac{c}{2}+\frac{c}{2} = \frac{x^2}{2} + \frac{c}{2} \\ \iff & x =\frac{x}{2} + \frac{c}{2x} = \frac{1}{2}(x+\frac{c}{x})
\end{align*}
$$

Let $f(x) = \frac{1}{2}(x+\frac{c}{x})$. That means that $x = f(x)$. This equation is called a **fixed-point equation** for the function $f(x)=\frac{1}{2}(x+\frac{c}{x})$.

The corresponding **fixed-point iteration** is given by $x_{n+1} = f(x_n) = \frac{1}{2}(x_n+\frac{c}{x_n})$.

</aside>

<aside>
💡 Limes superior and limes inferior ($\limsup, \liminf$):

Let $(a_n)$ be a bounded sequence. As a consequence of Weierstrass’ theorem we can define two monotonous and convergent sequences $(b_n)_{n \geq 1}$ and $(c_n)_{n \geq 1}$ from $(a_n)_{n \geq 1}$.

Let $n \geq 1$. For every $n$ we define

$$
\begin{align*}
b_n & = \inf \{a_k \space \vert \space k \geq n\} \\
& = \inf \{a_n, a_{n+1},...\}
\end{align*}
$$

$$
\begin{align*}
c_n & = \sup \{a_k \space \vert \space k \geq n\} \\
& = \sup \{a_n, a_{n+1},...\}
\end{align*}
$$

For every $n$, the set 

$$
\begin{align*}
A_n & = \{a_k \space \vert \space k \geq n\} \\
& = \{a_n, a_{n + 1},...\} \sub \{a_1,...\}
\end{align*}
$$

is also bounded and it holds that 

$$
A_{n+1} \sub A_n
$$

- $b_n = \inf A_n \leq \sup A_n = c_n$
- $\inf A_n \leq \inf A_{n+1}$, i.e., $b_n \leq b_{n+1}$ from which follows that $b_n$ grows as $n$ grows
- $\sup A_{n+1} \leq \sup A_n$, i.e., $c_{n+1} \leq c_n$ from which follows that $c_n$ shrinks as $n$ grows

The two sequences $b_n$ and $c_n$ converge by Weierstrass’ theorem.

We define

$$
\lim_{n \to \infty} b_n = \liminf a_n
$$

as the limes inferior of $a_n$.

We define

$$
\lim_{n \to \infty} c_n = \limsup a_n
$$

as the limes superior of $a_n$.

</aside>

<aside>
💡 For the above definition of limes superior and inferior it holds that $\liminf a_n \leq \limsup a_n$ as $b_n \leq c_n$.

</aside>

<aside>
📌 $(a_n)_{n \leq 1}$ *converges if and only if $(a_n)_{n \geq 1}$ is bounded and $\liminf a_n = \limsup a_n$.*

</aside>

<aside>
📖 The Cauchy Criterion

*The sequence $(a_n)_{n \geq 1}$ converges if and only if*

$$
\forall \epsilon \gt 0 \quad \exists N \geq 1 \space \text{such that} \space \lvert a_n - a_m \rvert \lt \epsilon \quad \forall n,m \geq N.
$$

</aside>

<aside>
💡 A sequence $(a_n)$ is called a **Cauchy sequence** if there exists a $N$ for all $\epsilon \gt 0$ such that for all $m,n \geq N$ it holds that $\lvert a_n - a_m \rvert \lt \epsilon$.

</aside>

<aside>
💡 Every Cauchy sequence is bounded.

</aside>

<aside>
💡 Every convergent sequence is a Cauchy sequence.

</aside>

<aside>
💡 Every Cauchy sequence is convergent.

</aside>

<aside>
💡 Every sequence that is not a Cauchy sequence is divergent.

</aside>

## Intervals

<aside>
💡 A **closed interval** is a subset $I \sube \mathbb{R}$ of the form

1. $[a,b], \quad a\leq b, \space a,b \in \mathbb{R}$
2. $[a, +\infty), \quad a \in \mathbb{R}$
3. $(-\infty, a], \quad a \in \mathbb{R}$
4. $(-\infty, +\infty) = \mathbb{R}$

We define the length $\mathcal{L}(I)$ of the interval as

$$
\begin{align*}
\mathcal{L}(I) & = b-a \quad & \text{in the first case} \\
\mathcal{L}(I) & = +\infty \quad & \text{in the other cases}.
\end{align*}
$$

Clearly $\mathcal{L}(I) \geq 0$. The closed interval is a bounded subset of $\mathbb{R}$ if and only if $\mathcal{L}(I) \lt + \infty$.

</aside>

<aside>
📖 (Cauchy-Cantor.)

*Let $... \sube I_{n+1} \sube I_n \sube...\sube I_2 \sube I_1$ be a sequence of closed intervals with $\mathcal{L}(I_1) \lt +\infty$.*

*Then it holds that*

$$
\bigcap_{n \geq 1} I_n \neq \varnothing.
$$

*If also $\lim_{n \to \infty} \mathcal{L}(I_n) = 0$ then $\bigcap_{n \geq 1} I_n$ contains exactly one point.*

</aside>

## Subsequences

<aside>
💡 A **subsequence** of a sequence $(a_n)_{n \geq 1}$ is a sequence  $(b_n)_{n \geq 1}$ where

$$
b_n = a_{l(n)}
$$

and $l : \mathbb{N} \longrightarrow \mathbb{N}$ is a transformation with the property

$$
l(n) \lt l(n+1) \quad \forall n \geq 1.
$$

</aside>

<aside>
📖 (Bolzano-Weierstrass.)

*Every bounded sequence contains a convergent subsequence.*

</aside>

<aside>
💡 Let $(a_n)_{n \geq 1}$ be a bounded sequence. Then the following holds for every convergent subsequence $(b_n)_{n \geq 1}$:

$$
\liminf_{n \to \infty} a_n \leq \lim_{n \to \infty} b_n \leq \limsup_{n \to \infty} a_n.
$$

Also, there exist two subsequences of $(a_n)_{n \geq 1}$ that approach $\liminf_{n \to \infty} a_n$ respectively $\limsup_{n \to \infty} a_n$ in their limit.

</aside>

## Sequences in $\mathbb{R}^d$ and $\mathbb{C}$

<aside>
💡 A sequence in $\mathbb{R}^d$ is a transformation

$$
a: \mathbb{N} \longrightarrow \mathbb{R}^d.
$$

We write $a_n$ instead of $a(n)$ and denote a series with $(a_n)_{n\geq1}$.

</aside>

<aside>
💡 A sequence $(a_n)_{n \geq 1}$ in $\mathbb{R}^d$ is called **convergent**, if there exists $a \in \mathbb{R}^d$ such that:

$$
\forall \epsilon \gt 0 \quad \exists N \geq 1 \quad \text{with} \quad \lvert \lvert a_n - a \rvert \rvert \lt \epsilon \quad \forall n \geq N.
$$

If such a number $a$ exists it is uniquely determined, and is denoted

$$
\lim_{n \to \infty} a_n =a.
$$

and is called the **limit** of the sequence $(a_n)_{n \geq 1}$.

Let $(a_{n,1}, a_{n,2},...,a_{n,d})$ be the coordinates of $a_n$.

</aside>

<aside>
📖 *Let $b = (b_1,...,b_d)$. The following statements are equivalent:*

1. $\lim_{n \to \infty} a_n = b$
2. $\lim_{n \to \infty} a_{n,j} = b_j \quad \forall 1 \leq j \leq d$.
</aside>

<aside>
💡 Let $x = (x_1, ..., x_d)$. Then it holds $\forall 1 \leq j \leq d$ that:

$$
x_j^2 \leq \sum_{i=1}^dx_i^2 \leq d \cdot \max_{1 \leq i \leq d} x_i^2.
$$

From which it follows that:

$$
\lvert x_j \rvert \leq \lvert \lvert x \rvert \rvert \leq \sqrt{d} \cdot \max_{1 \leq i \leq d} \lvert x_i \rvert.
$$

</aside>

<aside>
💡 A convergent sequence $(a_n)_{n \geq 1}$ in $\mathbb{R}^d$ is bounded. That means:

$$
\exists R \geq 0 \quad \text {with} \quad \lvert \lvert a_n \rvert \rvert \leq R \quad \forall n \geq .1
$$

</aside>

<aside>
📖 Cauchy-Sequence

1. *A sequence $(a_n)_{n \geq 1}$ converges if and only if it is a Cauchy-sequence:*

$$
\forall \epsilon \gt 0 \quad \exists N \geq 1 \quad \text{with} \quad \lvert \lvert a_n - a_m \rvert \rvert \lt \epsilon \quad \forall n,m \geq N.
$$

1. *Every bounded sequence has a convergent subsequence.*
</aside>

# Series

## Convergence

<aside>
💡 Let $(a_n)_{n\geq1}$ be a sequence in $\mathbb{R}$ or $\mathbb{C}$. The notion of converge of the series

$$
"\sum_{k=1}^\infty a_k"
$$

is based on the sequence $(S_n)_{n\geq1}$ of partial sums:

$$
S_N=\sum_{k=1}^na_k.
$$

</aside>

<aside>
💡 The series

$$
"\sum_{k = 1}^\infty a_k"
$$

is **convergent**, if the sequence $(S_n)_{n\geq 1}$ of partial sums converges. In this case we define:

$$
\sum_{k = 1}^\infty a_k = \lim_{n \to \infty} S_n.
$$

</aside>

## Important Series

<aside>
💡 (Geometric series.)

Let $q \in \mathbb{C}$ with $\lvert q \rvert \lt 1$. Then $\sum_{k=0}^\infty q^k$ converges towards:

$$
\sum_{k=0}^\infty q^k = \frac{1}{1-q}.
$$

</aside>

<aside>
💡 (Harmonic series.)

The series 

$$
\sum_{n=1}^\infty \frac{1}{n}
$$

diverges.

</aside>

<aside>
📖 *Let $\sum_{k = 1}^\infty a_k$ and $\sum_{j=1}^\infty b_j$ be convergent series, and let $\alpha \in \mathbb{C}$.*

1. *Then $\sum_{k = 1}^\infty (a_k + b_k)$ is convergent and $\sum_{k = 1}^\infty (a_k + b_k) = \bigg( \sum_{k = 1}^\infty a_k \bigg) + \bigg( \sum_{k = 1}^\infty b_k \bigg)$.*
2. *Then $\sum_{k = 1}^\infty \alpha \cdot a_k$ is convergent and $\sum_{k = 1}^\infty \alpha \cdot a_k = \alpha \cdot \sum_{k = 1}^\infty a_k$.*
</aside>

<aside>
📖 (Cauchy Criterion.)

*The series $\sum_{k = 1}^\infty a_k$ converges if and only if:*

$$
\forall \epsilon \gt 0 \quad \exists N \geq 1 \quad \text{with} \quad \bigg \lvert \sum_{k=n}^m a_k \bigg\rvert \lt \epsilon \quad \forall m \geq n \geq N.
$$

</aside>

<aside>
📖 *Let $\sum_{k = 1}^\infty a_k$ be a series with $a_k \geq 0 \quad \forall k \in \mathbb{N}$. The series $\sum_{k = 1}^\infty a_k$ converges if and only if the sequence $(S_n)_{n\geq 1}$, $S_n=\sum_{k = 1}^n a_k$ of partial sums is bounded from above.*

</aside>

<aside>
📎 *(Comparison theorem.)*

*Let $\sum_{k = 1}^\infty a_k$ and $\sum_{k = 1}^\infty b_k$ be series with:*

$$
0 \leq a_k \leq b_k \quad \forall k \geq 1.
$$

*Then all of the following hold:*

$$
\begin{align*}
\sum_{k = 1}^\infty b_k \quad \text{is convergent} & \implies \sum_{k = 1}^\infty a_k \quad \text{is convergent}, \\
\sum_{k = 1}^\infty a_k \quad \text{is divergent} & \implies \sum_{k = 1}^\infty b_k \quad \text{is divergent}.
\end{align*}
$$

*These implications also hold when there exists $K \geq 1$ such that:*

$$
0 \leq a_k \leq b_k \quad \forall k \geq K.
$$

</aside>

## Absolute Convergence

<aside>
💡 The series $\sum_{k = 1}^\infty a_k$ is called **absolutely convergent**, if

$$
\sum_{k = 1}^\infty \lvert a_k \rvert
$$

is convergent.

</aside>

<aside>
📖 *An absolutely convergent series $\sum_{k = 1}^\infty a_k$ is also convergent and it holds that:*

$$
\bigg \lvert \sum_{k = 1}^\infty a_k \bigg \rvert \leq \sum_{k = 1}^\infty \lvert a_k \rvert.
$$

</aside>

<aside>
📖 (Leibniz 1682).

*Let $(a_n)_{n \geq 1}$ be monotonically decreasing with $a_n \geq 0 \quad \forall n \geq 1$ and $\lim_{n \to \infty} a_n = 0.$ Then* 

$$
S = \sum_{k = 1}^\infty (-1)^{k+1} a_k
$$

*converges and it holds that:*

$$
a_1 - a_2 \leq S \leq a_1.
$$

</aside>

## Rearrangements

<aside>
💡 A series $\sum_{n = 1}^\infty a_n'$ is called a **rearrangement** of $\sum_{n = 1}^\infty a_n$ if there exists a bijective transformation

$$
\phi : \mathbb{N} \longrightarrow \mathbb{N}
$$

such that

$$
a_n' = a_{\phi(n)}.
$$

</aside>

<aside>
📖 (Riemann’s Rearrangement Theorem).

*Let $\sum_{k = 1}^\infty a_k$ be a conditionally convergent series (a series which is convergent but not absolutely convergent). Then, for every $A \in \mathbb{R} \cup \{\infty\}$ there exists a rearrangement of the series which converges towards $A$.*

</aside>

<aside>
📖 (Dirichlet 1837).

*If $\sum_{k = 1}^\infty a_k$ converges absolutely, then every rearrangement of the series has the same limit.*

</aside>

## Convergence Criterions

<aside>
📖 (Ratio test, Cauchy 1821).

*Let $(a_n)_{n \geq 1}$ with $a_n \neq 0 \quad \forall n \geq 1.$ If*

$$
\limsup_{n \to \infty} \frac{\lvert a_{n + 1}\rvert}{\lvert a_n \rvert} \lt 1
$$

*then the series $\sum_{n = 1}^\infty a_n$ converges absolutely.*

*If* 

$$
\liminf_{n \to \infty} \frac{\lvert a_{n + 1} \rvert}{\lvert a_n \rvert} \gt 1
$$

*then the series diverges.*

</aside>

<aside>
💡 The exponential function

We define the exponential function $\exp(z)$ as:

$$
\exp(z) = 1 + z + \frac{z^2}{2!} + \frac{z^3}{3!}+... = \sum_{i=0}^\infty \frac{z^i}{i!}
$$

(Note: this is a Taylor series expansion of $e^z$)

</aside>

<aside>
📖 (Root test, Cauchy 1821).

1. *If*
    
    $$
    \limsup_{n \to \infty} \sqrt[n]{\lvert a_n \rvert} \lt 1
    $$
    
    *then $\sum_{n = 1}^\infty a_n$ converges absolutely.*
    
2. *If*
    
    $$
    \limsup_{n \to \infty} \sqrt[n]{\lvert a_n \rvert} \gt 1
    $$
    
    *then $\sum_{n = 1}^\infty a_n$ and $\sum_{n = 1}^\infty \lvert a_n \rvert$ diverge.*
    
</aside>

<aside>
📎 *Let $(c_k)_{k \geq 0}$ be a series (in $\mathbb{R}$ or $\mathbb{C}$). If  $\limsup_{k \to \infty} \sqrt[k]{\lvert c_k \rvert}$ exists, we define*

$$
\rho = \begin{cases}
+\infty & \text{if} \quad \limsup_{k \to \infty} \sqrt[k]{\lvert c_k \rvert} = 0, \\
\frac{1}{\limsup_{k \to \infty} \sqrt[k]{\lvert c_k \rvert}} & \text{if} \quad \limsup_{k \to \infty} \sqrt[k]{\lvert c_k \rvert} \gt 0.
\end{cases}
$$

*The **Power series*** 

$$
\sum_{k = 0}^\infty c_kz^k
$$

*converges absolutely for all $\lvert z \rvert \lt \rho$ and diverges for all $\lvert z \rvert \gt \rho$.*

</aside>

<aside>
💡 Let $s \gt 1$ and

$$
\zeta(s) = \sum_{n=1}^\infty \frac{1}{n^s}.
$$

The function $\zeta(s)$ is called the **Riemann zeta function**.

The uniquely determined complex analytic continuation of $\zeta(s)$, which extends the domain of $\zeta(s)$ to all of $\mathbb{C}$, is the function underlying the Riemann hypothesis conjecturing that all roots of the function have a Real part of exactly 0.5, which is currently an unsolved millenium problem.

</aside>

## Double Series

<aside>
💡 Double summation

Consider the following:

![Untitled](Sequences%20and%20Series/Untitled.png)

Given a double sequence $(a_{ij})_{i,j\geq0}$ both of the following may be convergent with different limits:

$$
\begin{align*}
\sum_{i=0}^\infty\bigg( \sum_{j=0}^\infty a_{ij} \bigg) & = S_0 + S_1 + S_2+... \\
\sum_{j=0}^\infty\bigg( \sum_{i=0}^\infty a_{ij} \bigg) & = b_0+b_1+b_2+...
\end{align*}
$$

$\sum_{i,j \geq 0}a_{ij}$ is called a **double series**.

</aside>

<aside>
💡 $\sum_{k = 0}^\infty b_k$ is a **linear arrangement** of the double series $\sum_{i,j \geq 0}^\infty a_{ij}$, if there exists a bijection

$$
\sigma : \mathbb{N} \longrightarrow \mathbb{N} \times \mathbb{N}
$$

with $b_k = a_{\sigma(k)}$.

</aside>

<aside>
📖 (Cauchy 1821).

*Assume, there exists $B \geq 0$ such that*

$$
\sum_{i=0}^m\sum_{j=0}^m \lvert a_{ij}\rvert \leq B \quad \forall m \geq 0.
$$

*Then the following series converge absolutely:*

$$
S_i = \sum_{j=0}^\infty a_{ij} \quad \forall i \geq 0 \quad \text{und} \quad U_j = \sum_{i=0}^\infty a_{ij} \quad \forall j \geq 0
$$

*as well as*

$$
\sum_{i=0}^\infty S_i \quad \text{und} \quad \sum_{j=0}^\infty U_j
$$

*and it holds that:*

$$
\sum_{i=0}^\infty S_i = \sum_{j=0}^\infty U_j
$$

*Also, every linear arrangement of the double series converges absolutely towards the same limit.*

</aside>

<aside>
💡 The **Cauchy-Product** of the two series

$$
 \sum_{i=0}^\infty a_{i},  \sum_{j=0}^\infty b_{j}
$$

is the series 

$$
\sum_{n=0}^\infty\bigg( \sum_{j=0}^n a_{n-j}b_j \bigg) = a_0b_0 + (a_0b_1+a_1b_0)+(a_0b_2+a_1b_1+a_2b_0)+...
$$

</aside>

<aside>
📖 *If the series*

$$
 \sum_{i=0}^\infty a_{i},  \sum_{j=0}^\infty b_{j}
$$

*converge absolutely, then their Cauchy product converges and the following holds:*

$$
\sum_{n=0}^\infty\bigg( \sum_{j=0}^n a_{n-j}b_j \bigg) =  \bigg( \sum_{i=0}^\infty a_{i} \bigg) \bigg( \sum_{j=0}^\infty b_{j} \bigg)
$$

</aside>

## Application: Cauchy-Product of the Exponential Function

[Cauchy-Product of the Exponential Function](Sequences%20and%20Series/Cauchy-Product%20of%20the%20Exponential%20Function.md)

## Can you swap summation and limit?

In this context we will think of a sequence in $\mathbb{R}$ as a function

$$
f : \mathbb{N} \longrightarrow \mathbb{R}.
$$

<aside>
📖 *Let $f_n:\mathbb{N} \longrightarrow \mathbb{R}$ be a sequence. We assume, that:*

1. $f(j) = \lim_{n \to \infty} f_n(j)$ *exists $\forall j \in \mathbb{N}.$*
2. *There exists a function $g:\mathbb{N} \longrightarrow [0, \infty)$, such that*
    1. $\lvert f_n(j) \rvert \leq g(j) \quad \forall j \geq 0, \forall n \geq 0.$
    2. $\sum_{j=0}^\infty g(j)$ *converges.*

*Then it follows that:*

$$
\sum_{j=0}^\infty f(j) = \lim_{n \to \infty} \sum_{j=0}^\infty f_n(j).
$$

</aside>

<aside>
📎 *For every $z \in \mathbb{C}$ the sequence $((1+\frac{z}{n})^n)_{n \geq 1}$ converges and*

$$
\lim_{n \to \infty} (1 + \frac{z}{n})^n = \exp(z).
$$

</aside>