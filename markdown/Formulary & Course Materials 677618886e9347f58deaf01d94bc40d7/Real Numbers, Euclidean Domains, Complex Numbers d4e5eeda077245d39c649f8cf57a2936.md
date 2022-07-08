# Real Numbers, Euclidean Domains, Complex Numbers

# Real Numbers

<aside>
📖 (Lindenmann.)
*There does not exist an equation of the form*

$$
x^n + a_{n-1}x^{n-1} + ... + a_0 = 0
$$

*for $a_i \in \mathbb{Q}$, such that $x = \pi$ is a solution.*

</aside>

<aside>
📖 *For addition $+$, multiplication $\cdot$ and an order relation $\leq$:*

- Addition: $\mathbb{R} \times \mathbb{R} \stackrel{\mathrm{+}}{\rightarrow} \mathbb{R}$
- Multiplication: $\mathbb{R} \times \mathbb{R} \stackrel{\mathrm{\cdot}}{\rightarrow} \mathbb{R}$
- Order relation: $\leq$

$*\mathbb{R}$ is a commutative, ordered field that is order-complete.*

</aside>

<aside>
💡 Since $\mathbb{R}$ is a commutative field the field axioms hold:

**Addition**:

1. Associativity: $x + (y + z) = (x+y)+z, \forall x,y,z \in \mathbb{R}$
2. Neutral Element: $x + 0 = x, \forall x \in \mathbb{R}$
3. Inverse Element: $\forall x \space \exists y \space (x+y=0) \space, x, y \in \mathbb{R}$
    
    where $y$ is uniquely determined and is denoted $-x$.
    
4. Commutativity: $x + z = z + x, \forall x, z \in \mathbb{R}$

**Multiplication**:

1. Associativity: $x \cdot (y \cdot z) = (x \cdot y) \cdot z, \forall x,y,z \in \mathbb{R}$
2. Neutral Element: $x \cdot 1 = x, \forall x \in \mathbb{R}$
3. Inverse Element: $\forall x \space \exists y \space (x \cdot y = 1) \space ,x, y \in \mathbb{R}, x \neq 0$
    
    where $y$ is uniquely determined and denoted $x^{-1}$.
    
4. Commutativity: $x \cdot z = z \cdot x, \forall x,z \in \mathbb{R}$

From the axioms on addition and multiplication the distributive law can be defined:

1. Distributivity: $x \cdot (y + z) = x \cdot y + x \cdot z, \forall x, y, z \in \mathbb{R}$

**Order**:

1. Reflexivity: $x \leq x, \forall x \in \mathbb{R}$
2. Transitivity: $x \leq y \land y \leq z \implies x \leq z$
3. Antisymmetry: $x \leq y \land y \leq x \implies x = y$
4. Totally-Ordered: $\forall x ,y \in \mathbb{R}$ either $x \leq y$ or $y \leq x$ holds, i.e., all pairs of elements are comparable.

The order is compatible with the field axioms. 

**Compatibility**:

1. $x \leq y \implies x+z \leq y + z, \forall x \space \forall y \space \forall z \in \mathbb{R}$
2. $x \cdot y \geq 0, \forall x \geq 0,y \geq 0$

Recall the definitions for fields, partial orders and totally-ordered-ness from [Algebra](Algebra%202e542e6a0045446282bf640875624025.md) and [Sets, Relations, and Functions](Sets,%20Relations,%20and%20Functions%2010ee6209ddc64b6d8356a7f3e4fef13b.md):

<aside>
💡 A *field* is a nontrivial commutative ring $F$ in which every nonzero element is a unit, i.e., $F^* = F \setminus \{0\}$ (in other words, $\langle F \setminus \{0\}; \cdot, ^{-1}, 1 \rangle$ is an abelian group).

</aside>

<aside>
💡 A *partial order* (or simply an *order relation*) on a set $A$ is a relation that is reflexive, antisymmetric, and transitive. A set $A$ together with a partial order $\preceq$ on $A$ is called a *partially ordered set* (or simply *poset*) and is denoted as $(A; \preceq)$.

</aside>

<aside>
💡 If any two elements of a poset $(A; \preceq)$ are comparable, then $A$ is called *totally ordered* (or *linearly ordered*) by $\preceq$.

</aside>

Also note that $\mathbb{Q}$, the rational numbers, also form a commutative field that is totally-ordered under the same operations and orders. The only property separating $\mathbb{R}$ from $\mathbb{Q}$ is *order-completeness*.

</aside>

<aside>
💡 Order-Completeness: Let $A, B \sube \mathbb{R}$ such that

1. $A \neq \varnothing$, $B \neq \varnothing$
2. $\forall a \in A$ and $\forall b \in B$ it holds that: $a \leq b$

Then there exists $c \in \mathbb{R}$ such that $\forall a \in A \space a \leq c$ and $\forall b \in B \space c \leq b$.

</aside>

<aside>
💡 Notation:

$$
a \gt b \iff a \geq b \land a \neq b
$$

</aside>

<aside>
📎 *Corollary:*

1. *Uniqueness of additive and multiplicative Inverses.*
2. $0 \cdot x = 0, \forall x \in \mathbb{R}$
3. $*(-1) \cdot x = -x, \forall x \in \mathbb{R}$, especially $(-1)^2 = 1$*
4. $y \geq 0 \iff (-y) \leq 0$
5. $*y^2 \geq 0, \forall y \in \mathbb{R}$, especially $1 = 1 \cdot 1 \geq 0$*
6. $x \leq y \land u \leq v \implies x + u \leq y + v$
7. $0 \leq x \leq y \land 0 \leq u \leq v \implies x \cdot u \leq y \cdot v$
</aside>

<aside>
📎 Archimedean Principle:

*Let $x \in \mathbb{R}$ with $x \gt 0$ and $y \in \mathbb{R}$. Then there exists $n \in \mathbb{N}$ such that $y \leq n \cdot x$.*

</aside>

<aside>
📖 *For every $t \geq 0, t \in \mathbb{R}$ the equation $x^2 = t$ has a solution in $\mathbb{R}$.*

</aside>

<aside>
💡 For $t \geq 0$ there exists exactly one solution of $x^2 = t$ such that $x \geq 0$. It is denoted by $\sqrt{t}$.

</aside>

<aside>
💡 Let $x,y \in \mathbb{R}$:

1. $\max(x,y)= \begin{cases} x  & \text{if} & y \leq x \\
y & \text{if} & x \leq y \end{cases}$
2. $\min(x,y)= \begin{cases} y  & \text{if} & y \leq x \\
x & \text{if} & x \leq y \end{cases}$
3. The absolute value of a number $x \in \mathbb{R}$: $\lvert x \rvert = \max(x, -x)$
</aside>

<aside>
📖 *Properties of the absolute value of a number:*

1. $\lvert x \rvert \geq 0 , \forall x \in \mathbb{R}$
2. $\lvert xy \rvert = \lvert x \rvert \lvert y \rvert, \forall x,y \in \mathbb{R}$
3. $\lvert x + y \rvert \leq \lvert x \rvert + \lvert y \rvert, \forall x, y \in \mathbb{R}$
4. $\lvert x + y \rvert \geq \lvert \lvert x \rvert - \lvert y \rvert \rvert, \forall x,y \in \mathbb{R}$
</aside>

<aside>
📖 Young’s Inequality:

$\forall \epsilon \gt 0, \forall x, y \in \mathbb{R}$ *it holds that:*

$$
2 \cdot \lvert xy \rvert \leq \epsilon x^2 + \frac{1}{\epsilon} y^2.
$$

</aside>

<aside>
💡 We introduce two new symbols:

$$
- \infty \space \text{and} \space +\infty
$$

with the convention that

$$
- \infty \lt x \lt + \infty
$$

Then, an interval is a subset of $\mathbb{R}$ of the form:

1. for $a \leq b$ in $\mathbb{R}$:
    
    $$
    \begin{align*}
    [a,b] = \{x \in \mathbb{R} \space \vert \space a \leq x \leq b \} \\
    [a,b) = \{x \in \mathbb{R} \space \vert \space a \leq x \lt b \} \\ 
    (a,b] = \{x \in \mathbb{R} \space \vert \space a \lt x \leq b \} \\ 
    (a,b) = \{x \in \mathbb{R} \space \vert \space a \lt x \lt b \} \\ \end{align*}
    $$
    
2. for $a \in \mathbb{R}$:
    
    $$
    \begin{align*}
    [a, + \infty) = \{x \in \mathbb{R} \space \vert \space a \leq x\} \\
    (a, + \infty) = \{x \in \mathbb{R} \space \vert \space a \lt x\} \\
    (-\infty, a] = \{x \in \mathbb{R} \space \vert \space a \geq x\} \\
    (-\infty, a) = \{x \in \mathbb{R} \space \vert \space a \gt x\} \\\end{align*}
    $$
    
3. $(- \infty, + \infty) = \mathbb{R}$.
</aside>

<aside>
💡 Let $A \sube \mathbb{R}$ a subset of the reals.

1. $c \in \mathbb{R}$ is an **upper bound** of $A$ if $\forall a \in A$ it holds that $a \leq c$. The set $A$ is called **bounded from above** if there exists an upper bound of $A$.
2. $c \in \mathbb{R}$ is a **lower bound** of $A$ if $\forall a \in A$ it holds that $c \leq a$. The set $A$ is called **bounded from below** if there exists a lower bound of $A$,
3. An element $m \in \mathbb{R}$ is called a **maximum** of $A$ if $m \in A$ and $m$ is an upper bound of $A$.
4. An element $m \in \mathbb{R}$ is called a **minimum** of $A$ if $m \in A$ and $m$ is a lower bound of $A$.
</aside>

<aside>
💡 Notation: If $A$ has a maximum (minimum) it is denoted $\max A$ ($\min A$).

</aside>

<aside>
📖 *Let $A \sube \mathbb{R}$, $A \neq \varnothing$.*

1. *Let $A$ be bounded from above. Then there exists a least upper bound of $A$:*
    
    $$
    c = \sup A
    $$
    
    *called the **supremum** of $A$.*
    
2. *Let $A$ be bounded from below. Then there exists a greatest lower bound $A$:*
    
    $$
    c = \inf A
    $$
    
    *called the **infimum** of $A$.*
    
</aside>

<aside>
💡 It follows immediately that:

- Let $A \sube \mathbb{R}$ be bounded from above. Then the set of upper bounds of $A$ equals the interval $[\space \sup A, + \infty )$.
- Let $A \sube \mathbb{R}$ be bounded from below. Then the set of lower bounds of $A$ equals the interval $(- \infty, \inf A]$.
</aside>

<aside>
📎 *Let $A \sube B \sube \mathbb{R}$ be subsets of $\mathbb{R}$.*

1. *If $B$ is bounded from above, then $\sup A \leq \sup B$.*
2. *If $B$ is bounded from below, then $\inf B \leq \inf A$.*
</aside>

<aside>
💡 Convention: If $A$ is not bounded from above (resp. not bounded from below), we define

$$
\sup A = + \infty \space \text{(resp. $\inf A = - \infty$)}.
$$

</aside>

## Cardinality

<aside>
💡 Cardinality:

1. Two sets $X$, $Y$ are called **equinumerous**, if there exists a bijection $f : X \longrightarrow Y$.
2. A set $X$ is **finite**, if and only if $X = \varnothing$ or $\exists n \in \mathbb{N}$ such that $X$ and $\{1, 2, 3,...,n\}$ are equinumerous. In the former case, the **cardinality** of $X$, $\text{card} \space X = 0$ and in the latter it is $\text{card} \space X = n$.
3. A set $X$ is called **countable**, if it is finite or if it is equinumerous to $\mathbb{N}$.
</aside>

<aside>
💡 Countability of Sets:

1. Two sets $A$ amd $B$ are *equinumerous*, denoted $A \sim B$, if there exists a bijection $A \longrightarrow B$.
2. The set $B$ *dominates* the set $A$, denoted $A \preceq B$, if $A \sim C$ for some subset $C \sube B$ or, equivalently, if there exists an injective function $A \longrightarrow B$.
3. A set $A$ is called *countable* if $A \preceq \mathbb{N}$, and *uncountable* otherwise.
</aside>

<aside>
📖 *A set $A$ is countable if and only if it is finite or if $A \sim \mathbb{N}$.*

</aside>

<aside>
📖 (Cantor.)

$\mathbb{R}$ *is not countable.*

</aside>

# Euclidean Space

Let $n \geq 1$ and let

$$
\mathbb{R}^n = \{(x_1,...,x_n) \space \vert \space \forall j \quad x_j \in \mathbb{R}\}
$$

denote the $n$-fold cartesian product of $\mathbb{R}$. Let $x = (x_1, ..., x_n)$, $y = (y_1,...,y_n)$ and $\alpha \in \mathbb{R}$. Then we define:

$$
x + y = (x_1+y_1,...,x_n+y_n), \space \alpha\cdot x = (\alpha x_1, ..., \alpha x_n)
$$

Linear algebra shows that $\mathbb{R}^n$ forms a vector space with the operations:

$$
\begin{align*}
\mathbb{R} \times \mathbb{R}^n & \longrightarrow \mathbb{R} \\
(\alpha, x) & \longmapsto \alpha \cdot x
\end{align*}
$$

$$
\begin{align*}
\mathbb{R}^n \times \mathbb{R}^n & \longrightarrow \mathbb{R}^n \\
(x, y) & \longmapsto x + y
\end{align*}
$$

The **scalar product** of two vectors $x ,y \in \mathbb{R}^n$ is defined by

$$
\langle x, y \rangle = \sum_{j=1}^nx_jy_j.
$$

The following properties hold:

1. $\forall x, y \in \mathbb{R}^n \quad \langle x ,y \rangle = \langle y, x \rangle$ (symmetry)
2. $\forall \alpha_1, \alpha_2 \in \mathbb{R}, \forall x_1, x_2, y \in \mathbb{R}^n \quad \langle\alpha_1x_1 + \alpha_2x_2, y \rangle = \alpha_1\langle x_1,y \rangle + \alpha_2 \langle x_2, y \rangle$ (bilinearity)
3. $\langle x, x \rangle = \sum_{j=1}^nx_j^2\geq 0$ with equality if and only if $x = 0$ (positive definiteness)

The **Norm** of the vector $x$ is $\lvert \lvert x \rvert \rvert = \sqrt{\langle x, x \rangle}$.

<aside>
📖 (Cauchy-Schwarz).

$$
\lvert \langle x,y \rangle \rvert \leq\lvert \lvert x \rvert \rvert \cdot \lvert \lvert y \rvert \rvert \quad \forall x ,y \in \mathbb{R}^n
$$

</aside>

<aside>
📖 *Statements for the norm:*

1. $*\lvert \lvert x \rvert \rvert \geq 0$ with equality if and only if $x = 0$.*
2. $\lvert \lvert \alpha \cdot x \rvert \rvert = \lvert \alpha \rvert \cdot \lvert \lvert x \rvert \rvert \quad \forall \alpha \in \mathbb{R}, \forall x \in \mathbb{R}^n$
3. $\lvert \lvert x + y \rvert \rvert \leq \lvert \lvert x \rvert \rvert + \lvert \lvert y \rvert \rvert \space \forall x, y \in \mathbb{R}^n$
</aside>

The **cross product** between two vectors $a,b \in \mathbb{R}^3$ is defined by

$$
\begin{align*}
\times : \mathbb{R}^3 \times \mathbb{R}^3 & \longrightarrow \mathbb{R}^3 \\
(a, b) & \longmapsto a \times b = (a_2b_3 - a_3b_2,a_3b_1-a_1b_3,a_1b_2-a_2b_1).
\end{align*}
$$

$a,b$ and $a \times b$ form a right-handed system. It holds that: $\lvert \lvert a \times b \rvert \rvert =$  area of the parallelogram spanned by $a$ and $b$.

The cross product has the following properties: $\forall a, b, c \in \mathbb{R}^3$:

1. $(a + b) \times c = a \times c + b \times c$ (distributivity)
2. $a \times b = -b \times a$ (antisymmetry)
3. $a \times (b \times c) + c \times (a \times b) + b \times (c \times a) = 0$ (Jacobi-Identity)

# Complex Numbers

We define the following multiplication on $\mathbb{R}^2$:

$$
(x_1,y_1) \cdot (x_2, y_2) = (x_1x_2 - y_1y_2, x_1y_2 + x_2y_1).
$$

Then, it holds that:

$$
(0, 0)(x,y)=(0,0), \quad (1,0)(x,y)=(x,y) \\
\text{If} \space (x,y) \neq (0,0): \quad (x,y)\bigg(\frac{x}{x^2+y^2}, \frac{-y}{x^2+y^2}\bigg) = (1,0)
$$

<aside>
📖 $*\mathbb{R}^2$ with vector addition $+$ and the defined multiplication $\cdot$ is a commutative field with multiplicative neutral element $(1,0)$ and additive neutral element $(0,0)$.*

</aside>

$\langle \mathbb{R}^2, +, \cdot \rangle$ is called the field of the **complex numbers** and is denoted with $\mathbb{C}$.

The transformation $\begin{cases}
\mathbb{R} & \longrightarrow & \mathbb{R} \times \mathbb{R} \\
x & \longmapsto & (x,0)
\end{cases}$ follows the field axioms. Using this transformation, we can identify $\mathbb{R}$ as a sub-field of $\mathbb{C}$.

Let $i = (0, 1)$. Then, every element $z \in \mathbb{C}$ has a unique representation

$$
z = x + y \cdot i \quad \text{with} \quad x, y \in \mathbb{R}
$$

Note:

$$
i^2=(0, 1)(0, 1) = (-1, 0) = -(1,0)
$$

By applying the distributive laws we get:

$$
\begin{align*}
z_1z_2 & = (x_1 + y_1i) \cdot (x_2 + y_2i) \\
& =x_1x_2 + x_1y_2i + y_1ix_2 + y_1iy_2i \\
& = x_1x_2 + (x_1y_2 + y_1x_2) \cdot i + y_1y_2i^2 \\
& = (x_1x_2 - y_1y_2) + (x_1y_2+y_1x_2)\cdot i.
\end{align*}
$$

This representation is also consistent with the definition of the above product.

Terminology: Let $z = x + yi:$

$$
\begin{align*}
& x = \text{Re} \space z \quad \text{is called the \textit{real part} of $z$,} \\ & y=\text{Im} \space z \quad \text{is called the \textit{imaginary part} of $z$}
\end{align*}
$$

Complex conjugate: For $z = x + yi$ we define

$$
\bar{z} = x - yi.
$$

<aside>
📖 *Complex conjugate rules:*

1. $\overline{(z_1 + z_2)} = \bar{z_1} + \bar{z_2} \quad \forall z_1, z_2 \in \mathbb{C}$
2. $\overline{(z_1z_2)} = \bar{z_1}\bar{z_2} \quad \forall z_1, z_2 \in \mathbb{C}$
3. $z\bar{z} = x^2 + y^2 = \lvert \lvert z \rvert \rvert^2$
</aside>

It follows from 3. that for $z \neq 0$ the multiplicative inverse is given by

$$
z^{-1}=\frac{\bar{z}}{\lvert \lvert z\rvert \rvert^2}.
$$

## Polar Form

![2022-02-28_23-29.png](Real%20Numbers,%20Euclidean%20Domains,%20Complex%20Numbers%20d4e5eeda077245d39c649f8cf57a2936/2022-02-28_23-29.png)

Let $r = \lvert \lvert z \rvert \rvert$, then $x = r \cos \phi$ and $y = r \sin \phi$ where $\theta \space \text{mod} \space 2 \pi k$, $k \in \mathbb{Z}$.

In the representation

$$
z = r (\cos \phi + i \sin \phi)
$$

$r = \lvert \lvert z \rvert \rvert$ denotes the **absolute value** and $\phi$ the **argument** of the complex number $z$.

Now let $z_1 = r_1(\cos \phi_1 + i\sin\phi_1)$ and $z_2 = r_2(\cos \phi_2 + i \sin \phi_2)$. Then it follows:

$$
z_1z_2 = r_1r_2((\cos \phi_1 \cos \phi_2 - \sin \phi_1 \sin \phi_2)+(\cos \phi_1 \sin \phi_2 + \sin \phi_1 \cos \phi_2)\cdot i)
$$

From the addition theorems for sine and cosine it follows:

$$
z_1z_2 = r_1r_2(\cos(\phi_1 + \phi_2) + \sin (\phi_1 + \phi_2) \cdot i)
$$

For $z = r (\cos \phi + i \sin \phi)$ it follows by induction that:

$$
z^n = r^n(\cos(n \cdot \phi) + i \sin(n \cdot \phi))
$$

<aside>
📎 *Let $n \in \mathbb{N}, n \geq 1$. Then the equation $z^n = 1$ has exactly $n$ solutions in $\mathbb{C}: z_1,z_2,...,z_n$, where:*

$$
z_j = \cos\frac{2 \pi j}{n} + i \cdot \sin\frac{2 \pi j}{n}, \quad 1 \leq j \leq n
$$

![2022-02-28_23-52.png](Real%20Numbers,%20Euclidean%20Domains,%20Complex%20Numbers%20d4e5eeda077245d39c649f8cf57a2936/2022-02-28_23-52.png)

</aside>

<aside>
📖 (Fundamental Theorem of Algebra.)

*Let $n \geq 1, n \in \mathbb{N}$ and*

$$
P(z) = z^n+a_{n-1}z^{n-1} + ... + a_0, \quad a_j \in \mathbb{C}.
$$

*Then there exist $z_1,...,z_n$ in $\mathbb{C}$ such that*

$$
P(z) = (z - z_1)(z-z_2)...(z-z_n).
$$

</aside>