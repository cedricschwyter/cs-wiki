# Cauchy-Product of the Exponential Function

# Cauchy Product of the Exponential Function

## Claim

$$
\forall z, w \in \mathbb{C}: \exp(w+z) = \exp(w)\exp(z)
$$

## Proof

The claim can be verified by computing the Cauchy product of the right hand side. We will compute the Cauchy product of the following two series:

$$
 \sum_{i=0}^\infty \frac{w^i}{i!},  \sum_{j=0}^\infty \frac{z^j}{j!}
$$

Recall the Cauchy product and the series expansion of the exponential function $\exp(z)$:

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
💡 The exponential function

We define the exponential function $\exp(z)$ as:

$$
\exp(z) = 1 + z + \frac{z^2}{2!} + \frac{z^3}{3!}+...
$$

(Note: this is a Taylor series expansion of $e^z$)

</aside>

The Cauchy product of the two is

$$
\sum_{n=0}^\infty \bigg( \sum_{j=0}^n\frac{w^{n-j}}{(n-j)!}\frac{z^j}{j!}\bigg)
$$

This part in brackets evaluates to

$$
\sum_{j=0}^n\frac{w^{n-j}}{(n-j)!}\frac{z^j}{j!} = \frac{1}{n!} \sum_{j=0}^n\binom{n}{j}w^{n-j}z^j=\frac{(w+z)^n}{n!}
$$

which by definition of $\exp(w+z)$ completes the proof.