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
    
3. *If $f(x_0) \neq 0$ then* 
</aside>