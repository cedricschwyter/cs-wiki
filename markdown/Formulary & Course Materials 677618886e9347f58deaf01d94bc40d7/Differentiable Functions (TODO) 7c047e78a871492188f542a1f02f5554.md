# Differentiable Functions (TODO)

# The Derivative: Definition and Elementary Consequences

<aside>
💡 Let $D \sube \mathbb{R}$, $f : D \longrightarrow \mathbb{R}$ and let $x_0 \in D$ be an accumulation point of $D$.

$f$ is **differentiable in** $x_0$ if the limit

$$
\lim_{x\to x_0} \frac{f(x) - f(x_0)}{x - x_0}
$$

exists. If this is the case, then this limit is denoted by by $f'(x_0)$.

Oftentimes it is useful to replace $x$ by $x = x_0 + h$ in this definition, such that 

$$
\lim_{h \to 0} \frac{f(x_0+h) - f(x_0)}{h}.
$$

</aside>

<aside>
💡 $\frac{f(x) - f(x_0)}{x - x_0}$ is the the slope of the line through $(x_0, f(x_0)), (x, f(x))$. If $f'(x_0)$ exists intuitively it corresponds to the fact that the family of lines through $(x_0, f(x_0)),(x, f(x))$ for $x \neq x_0$, $x \to x_0$ as a “limit” approaches the tangent line to the graph of $f$ in $(x_0, f(x_0))$.

</aside>

<aside>
📖 (Weierstrass, 1861).

*Let $f:D \longrightarrow \mathbb{R}$ and let $x_0 \in D$ be an accumulation point of $D$. The following statements are equivalent:*

1. $*f$ is differentiable in $x_0$,*
2. *There exist $c \in \mathbb{R}$ and $r: D \longrightarrow \mathbb{R}$ with:*
    1. $f(x) = f(x_0)+c(x-x_0)+r(x)(x-x_0)$
    2. $r(x_0)=0$ *and r is continuous in $x_0$.*

If this applies, then $c = f'(x_0)$ is uniquely determined.

</aside>

<aside>
💡 Formulating the differentiability of $f$ using

$$
f(x) = f(x_0)+f'(x_0)(x-x_0)+r(x)(x-x_0)
$$

and the continuity of $r$ in $x_0$ has the advantage that it does not contain a limit. In particular 

$$
y=f(x_0)+f'(x_0)(x-x_0)
$$

is the equation of the tangent line of $f$ in the point $(x_0, f(x_0))$. Furthermore, this can be simplified to 

$$
\phi(x) = f'(x_0) + r(x).
$$

</aside>

<aside>
📖 *A function $f:D\longrightarrow\mathbb{R}$ is differentiable in $x_0$ if and only if there exists a function $\phi : D\longrightarrow\mathbb{R}$ that is continuous in $x_0$ and such that*

$$
f(x) = f(x_0)+\phi(x)(x-x_0) \quad \forall x \in D.
$$

*In this case it holds that $\phi(x_0) = f'(x_o).$*

</aside>

<aside>
📎 *Let $f:D\longrightarrow \mathbb{R}$ and let $x_0\in D$ be an accumulation point of $D$. If $f$ is differentiable in $x_0$ then $f$ is continuous in $x_0$.*

</aside>

<aside>
💡 $f:D \longrightarrow \mathbb{R}$ is **differentiable in $D$**, if for every accumulation point $x_0 \in D$, $f$ is differentiable in $x_0$,

</aside>

<aside>
💡 Examples:

1. $\exp : \mathbb{R} \longrightarrow \mathbb{R}$ is differentiable in $\mathbb{R}$ and $\exp' = \exp$.
2. $\sin' = \cos$ and $\cos' = - \sin$.
</aside>

<aside>
📖 *Let $D \sube \mathbb{R}$, $x_0 \in D$ be an accumulation point of $D$ and let $f,g : D \longrightarrow \mathbb{R}$ be differentiable in $x_0$. Then the following hold:*

1. $f+g$ *is differentiable in $x_0$ and* 
    
    $$
    (f+g)'(x_0) = f'(x_0)+g'(x_0)
    $$
    
2. $f \cdot g$ *is differentiable in $x_0$ and* 
    
    $$
    (f\cdot g)'(x_0)=f'(x_0)g(x_0)+f(x_0)g'(x_0).
    $$
    
3. *If $f(x_0) \neq 0$ then $\frac{f}{g}$ is differentiable in $x_0$ and* 
    
    $$
    \bigg(\frac{f}{g}\bigg)'(x_0) = \frac{f'(x_0)g(x_0) - f(x_0)g'(x_0)}{g(x_0)^2}.
    $$
    
</aside>

<aside>
💡 Examples:

1. $(x^n)'=nx^{n-1} \quad \forall x \in \mathbb{R}, n\geq1$
2. The tangent function 
    
    $$
    \tan x = \frac{\sin x}{\cos x}, x \notin \frac{\pi}{2}+\pi\mathbb{Z}
    $$
    
    is differentiable on its domain and 
    
    $$
    \tan'(x) = \frac{1}{\cos^2 x}.
    $$
    
3. The cotangent function 
    
    $$
    \cot x = \frac{\cos x}{\sin x}, x \notin \pi\mathbb{Z}
    $$
    
    is differentiable on its domain and 
    
    $$
    \cot'(x) = - \frac{1}{\sin^2(x)}.
    $$
    
</aside>

<aside>
📖 *Let $D,E \sube \mathbb{R}$ and let $x_0 \in D$ be an accumulation point. Let $f : D \longrightarrow E$ be a function that is differentiable in $x_0$ such that $y_0=f(x_0)$ is an accumulation point of $E$, and let $g: E \longrightarrow \mathbb{R}$ be a function that is differentiable in $y_0$. Then $g \circ f : D \longrightarrow \mathbb{R}$ is differentiable in $x_0$ and*

$$
(g \circ f)'(x_0) = g'(f(x_0))f'(x_0).
$$

</aside>

<aside>
📎 *Let $f:D \longrightarrow E$ be a bijective function and let $x_0 \in D$ be an accumulation point. Let us assume that $f$ is differentiable in $x_0$ and $f'(x_0)\neq 0$. Assume also that $f^{-1}$ is continuous in $y_0=f(x_0)$. Then $y_0$ is an accumulation point of $E$, $f^{-1}$ is differentiable in $y_0$ and*

$$
(f^{-1})'(y_0)=\frac{1}{f'(x_0)}.
$$

</aside>

<aside>
💡 Examples:

1. The derivative of $\ln:(0, +\infty) \longrightarrow \mathbb{R}$ is 
    
    $$
    \ln'(x) = \frac{1}{x}.
    $$
    
    For all $x \in \mathbb{R}$ it holds that: 
    
    $$
    \ln (\exp(x)) = x.
    $$
    
    Applying the chain rule to $f(x) = \exp x$ and $g(y) = \ln y$ we get by taking the derivative: 
    
    $$
    \ln'(\exp x)\exp'(x) = 1 \quad \forall x \in \mathbb{R}.
    $$
    
    Since $\exp'(x) = \exp(x) \quad \forall x \in \mathbb{R}$ it follows that 
    
    $$
    \ln'(\exp x) \exp x = 1 \quad \forall x \in \mathbb{R}
    $$
    
    and since $\exp:\mathbb{R} \longrightarrow (0, \infty)$ is bijective it follows that: 
    
    $$
    \ln'(y)\cdot y = 1 \quad \forall y \in (0, \infty).
    $$
    
2. Let $a \in \mathbb{R}$; the derivative of the function 
    
    $$
    \begin{align*}
    (0, \infty) & \longrightarrow \mathbb{R} \\
    x & \longmapsto x^a
    \end{align*}
    $$
    
    is $a x^{a-1}$.
    
    By definition: $x^a = \exp(a \ln x), x \gt 0$. We apply the chain rule to $f(x) = a \ln x$ and $g(x)=\exp y$ and we get with $g'(y) = \exp y$ and $f'(x) = a \cdot \frac{1}{x}$,
    
    $$
    \begin{align*}(x^a)'&=\exp'(a \ln x) \frac{a}{x} = \exp(a \ln x) \frac{a}{x} \\
    &= x^a\frac{a}{x} = ax^{a-1}.\end{align*}
    $$
    
3. $f : \mathbb{R} \longrightarrow \mathbb{R}, x\longmapsto x^3$ is bijectively differentiable in $\mathbb{R}$. But $f^{-1}$ is not differentiable in $0$.
</aside>

# Central Theorems about the (first) Derivative

<aside>
💡 Let $f: D \longrightarrow \mathbb{R}, D \sube \mathbb{R}$ and $x_0 \in D$.

1. $f$ has a local maximum in $x_0$ if there exists $\delta \gt 0$ with: 
    
    $$
    f(x) \leq f(x_0) \quad \forall x \in (x_0- \delta, x_0 + \delta) \cap D
    $$
    
2. $f$ has a local minimum in $x_0$ if there exists $\delta \gt 0$ with:
    
    $$
    f(x) \geq f(x_0) \quad \forall x \in (x_0 - \delta, x_0 + \delta) \cap D
    $$
    
3. $f$ has a local extremum in $x_0$ if $x_0$ is either a local minimum or maximum of $f$.
</aside>

<aside>
📖 *Let $f: (a,b) \longrightarrow \mathbb{R}$, $x_0 \in (a,b)$. We assume that $f$ is differentiable in $x_0$.*

1. *If $f'(x_0) \gt 0$ then there exists $\delta \gt 0$ with* 
    
    $$
    \begin{align*}
    &f(x) \gt f(x_0) \quad &\forall x \in (x_0, x_0 + \delta)& \\
    &f(x) \lt f(x_0) \quad &\forall x \in (x_0 - \delta, x_0)&.
    \end{align*}
    $$
    
2. *If $f'(x_0) \lt 0$ then there exists $\delta \gt 0$ with* 
    
    $$
    \begin{align*}
    &f(x) \lt f(x_0) \quad &\forall x \in (x_0, x_0 + \delta)& \\
    &f(x) \gt f(x_0) \quad &\forall x \in (x_0 - \delta, x_0)&.
    \end{align*}
    $$
    
3. *If $f$ has a local extremum in $x_0$, then $f'(x_0) = 0$.*
</aside>

<aside>
📖 (Rolle 1690).

*Let $f:[a,b] \longrightarrow \mathbb{R}$ be continuous and differentiable in $(a,b)$. If $f(a) = f(b)$ holds true, then there exists $\xi \in (a,b)$ with* 

$$
f'(\xi) = 0.
$$

</aside>

<aside>
📖 (Lagrange 1797).

*Let $f : [a,b] \longrightarrow \mathbb{R}$ be continuous and differentiable in $(a,b)$. Then there exists $\xi \in (a,b)$ with* 

$$
f(b) - f(a) = f'(\xi)(b-a).
$$

</aside>

<aside>
📎 *Let $f,g:[a,b] \longrightarrow \mathbb{R}$ be continuous and differentiable in $(a,b)$.*

1. *If $f'(\xi)=0 \quad \forall \xi \in(a,b)$ then $f$ is constant.*
2. *If $f'(\xi) = g'(\xi) \quad \forall \xi \in(a,b)$ then there exists $c \in \mathbb{R}$ with $f(x) = g(x) + c \quad \forall x \in [a,b]$.*
3. *If $f'(\xi) \geq 0 \quad \forall\xi \in (a,b)$ then $f$ is monotonically increasing on $[a,b]$.*
4. *If $f'(\xi) \gt 0 \quad \forall \xi \in (a,b)$ then $f$ is strictly monotonically increasing on $[a,b]$.*
5. *If $f'(\xi) \leq 0 \quad \forall \xi \in (a,b)$ then $f$ is monotonically decreasing on $[a,b]$.*
6. *If $f'(\xi) \lt 0 \quad \forall \xi \in (a,b)$  then $f$ is strictly monotonically decreasing on $[a,b]$.*
7. *If there exists $M \geq 0$ with* 
    
    $$
    \lvert f'(\xi) \rvert \leq M \quad \forall \xi \in (a,b)
    $$
    
    *then it follows that $\forall x_1, x_2 \in [a,b]$:* 
    
    $$
    \lvert f(x_1) - f(x_2) \rvert \leq M \lvert x_1 - x_2 \rvert.
    $$
    
</aside>

<aside>
📖 (Cauchy).

*Let $f,g:[a,b] \longrightarrow \mathbb{R}$ be continuous and differentiable in $(a,b)$. Then there exists $\xi \in (a.b)$ with* 

$$
g'(\xi)(f(b)-f(a)) = f'(\xi)(g(b)-g(a)).
$$

*If $g'(x) \neq 0 \quad \forall x \in (a,b)$ then it follows that* 

$$
g(a) \neq g(b)
$$

*and* 

$$
\frac{f(b) - f(a)}{g(b) - g(a)} = \frac{f'(\xi)}{g'(\xi)}
$$

</aside>

<aside>
📖 (l’Hospital 1696, Johann Bernoulli 1691/92).

*Let $f,g:(a,b) \longrightarrow \mathbb{R}$ be differentiable with $g'(x) \neq 0 \quad \forall x \in (a,b)$.*

*If* 

$$
\lim_{x \to b^-}f(x) = 0, \quad \lim_{x \to b^-}g(x) = 0
$$

*and* 

$$
\lim_{x \to b^-} \frac{f'(x)}{g'(x)} = \lambda
$$

*exist, then* 

$$
\lim_{x \to b^-} \frac{f(x)}{g(x)} = \lim_{x \to b^-}\frac{f'(x)}{g'(x)}.
$$

<aside>
💡 The theorem also holds

- if $b = +\infty$
- if $\lambda = + \infty$
- if $x \to a^+.$
</aside>

</aside>

<aside>
💡 Let $I \sube \mathbb{R}$ be an interval and let $f : I \longrightarrow \mathbb{R}$ be a function

1. $f$ is **convex** (on $I$) if for all $x \leq y, \quad x,y \in I$ and $\lambda \in [0,1]$ it holds that
    
    $$
    f(\lambda x + (1-\lambda)y) \leq \lambda f(x) + (1-\lambda)f(y)
    $$
    
2. $f$ is **strictly convex** if for all $x \lt y, \quad x,y \in I$ and $\lambda \in (0,1)$ it holds that 
    
    $$
    f(\lambda x + (1-\lambda)y) \lt \lambda f(x) + (1-\lambda)f(y)
    $$
    
</aside>

<aside>
💡 Let $f : I \longrightarrow \mathbb{R}$ be convex. Then the following holds for all $n \geq 1, \quad \{x_1,...,x_n\} \sube I$ and $\lambda_1,...,\lambda_n$ in $[0,1]$ with $\sum_{i=1}^n \lambda_i = 1$:

$$
f(\sum_{i=1}^n \lambda_i x_i) \leq \sum_{i=1}^n \lambda_i f(x_i).
$$

</aside>

<aside>
📌 *Let $f: I \longrightarrow \mathbb{R}$ be an arbitrary function. The function $f$ is convex if and only if for all $x_0 \lt x \lt x_1$ in $I$ it holds that*

$$
\frac{f(x) - f(x_0)}{x-x_0} \leq \frac{f(x_1) - f(x)}{x_1 - x}.
$$

$*f$ is strictly convex if*

$$
\frac{f(x) - f(x_0)}{x-x_0} \lt \frac{f(x_1) - f(x)}{x_1 - x}.
$$

</aside>

<aside>
📖 *Let $f : (a,b) \longrightarrow \mathbb{R}$ be differentiable in $(a,b)$. The function $f$ is (strictly) convex if and only if $f'$ is (strictly) monotonically increasing.*

</aside>

<aside>
💡

</aside>