# Lagrange Interpolation of Polynomials

(Copied/paraphrased/annotated from the script on Discrete Mathematics HS21 by Prof. Ueli Maurer)

# Description

Recall the following lemma of polynomial algebra over fields:

<aside>
📌 *A polynomial $a(x) \in F[x]$ of degree at most $d$ is uniquely determined by any $d+1$ values of $a(x)$, i.e., by $a(\alpha_1),...,a(\alpha_{d+1})$ for any distinct $\alpha_1,...,\alpha_{d+1} \in F$.*

</aside>

The proof for this lemma is constructive and exhibits a formula with which to construct a polynomial of degree $d$ from $d + 1$ values.

# Proof of Lemma & Formula

Let $\beta_i = a(\alpha_i)$ for $i = 1,..., d+1$. Then $a(x)$ is given by Lagrange’s interpolation formula:

$$
a(x) = \sum_{i = 1}^{d+1} \beta_i u_i(x),
$$

where the polynomial $u_i(x)$ is given by

$$
u_i(x) = \frac{(x - \alpha_1)...(x - \alpha_{i-1})(x - \alpha_{i+1})...(x-\alpha_{d+1})}{(\alpha_i - \alpha_1)...(\alpha_i - \alpha_{i-1})(\alpha_i - \alpha_{i+1})...(\alpha_i - \alpha_{d+1})}.
$$

Note that for $u_i(x)$ to be well-defined, all constant terms $\alpha_i - \alpha_j$ in the denominator must be invertible. This is guaranteed if $F$ is a field since $\alpha_i - \alpha_j \neq 0$ for $i \neq j$. Note also that the denominator is simply a constant and hence $u_i(x)$ is indeed a polynomial of degree $d$. It is easy to verify that $u_i(\alpha_i) = 1$ and $u_i(a_j) = 0$ for $j \neq i$. Thus the polynomials $a(x)$ and $a(x) = \sum_{i = 1}^{d+1} \beta_i u_i(x),$ agree when evaluated at any $\alpha_i$, for all $i$. We note that $a(x)$ has degree at most $d$.

It remains to prove the uniqueness. Suppose there is another polynomial $a'(x)$ of degree at most $d$ such that $\beta_i = a'(\alpha_i)$ for $i = 1,...,d+1$ . Then $a(x) - a'(x)$ is also a polynomial of degree at most $d$, which according to the following theorem can have at most $d$ roots, unless it is 0.

<aside>
📖 *For a field $F$, a nonzero polynomial $a(x) \in F[x]$ of degree $d$ has at most $d$ roots, counting multiplicities.*

</aside>

But $a(x) - a'(x)$ has indeed the $d + 1$ roots $\alpha_1, ..., \alpha_{d+1}$. Thus it must be 0, which implies $a(x) = a'(x)$. This concludes the proof.

# Visualization

![Visualized Lagrange-Interpolation for a polynomial of second degree.](Lagrange%20Interpolation%20of%20Polynomials%20e3d16eff64924159afabc54390c2ab4b/LagrangeInterpolation_ManimCE_v0.13.1.png)

Visualized Lagrange-Interpolation for a polynomial of second degree.

In the visualization the polynomial $a(x)$ is computed by adding up all the other polynomials corresponding to the colored parabolas. These colored parabolas correspond to $\beta_i \cdot u_i(x)$ as above. They are computed Lagrange polynomials (as above), with $\alpha_1, \alpha_2,\alpha_3$ given by the yellow arguments for $a(x)$.

# Further Resources

[Lagrange polynomial - Wikipedia](https://en.wikipedia.org/wiki/Lagrange_polynomial)