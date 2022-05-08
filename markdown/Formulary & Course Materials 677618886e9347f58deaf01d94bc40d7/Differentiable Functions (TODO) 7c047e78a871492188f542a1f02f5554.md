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
💡 $\frac{f(x) - f(x_0)}{x - x_0}$ is the the slope of the line through $(x_0, f(x_0)), (x, f(x))$. If $f'(x_0)$ exists intuitively it corresponds to the fact that the family of lines through

</aside>