# Randomized Algorithms

# Randomized Algorithms in General

The goal of a deterministic algorithm is to return an output $\mathcal{A}(I)$ for an input $I$. With randomized algorithms the idea is that the algorithm also has access to random variables. The output of the algorithm is thus not only dependent on the input $I$ but also on the values of the random variables. We denote the output of the randomized algorithm with $\mathcal{A}(I, \mathcal{R})$ where $\mathcal{R}$ denotes the values of the random variables. We also denote by $\mathcal{A}(I)$ the random variable corresponding to the value of $\mathcal{A}(I, \mathcal{R})$ for a random choice of $\mathcal{R}$. With randomized algorithms we may thus receive different results when executing the algorithm multiple times. We distinguish two types of randomized algorithms: Las-Vegas and Monte-Carlo algorithms.

## Las-Vegas Algorithms

A Las-Vegas algorithm’s runtime is a random variable, however the algorithm is guaranteed to deliver a correct result. We can look at a Las-Vegas algorithm from a different perspective: we can abort the execution of the algorithm if we reach a certain runtime-limit and output “???”. The two are equivalent.

## Monte-Carlo Algorithms

A Monte-Carlo algorithm has a deterministic runtime but a chance of delivering a wrong result.

# Reducing the Probability of Failure

## Las-Vegas Algorithms

For Las-Vegas algorithms it is enough to output a correct result with a probability at least  $\epsilon$, where $\epsilon \gt 0$ may be arbitrarily small. Through enough repetitions of the algorithm we can generate every arbitrarily small probability of success. The amount of iterations only depends on the original probability of success $\epsilon$ of the algorithm and the desired overall probability of failure $\delta$.

<aside>
📖 *Let $\mathcal{A}$ be a randomized algorithm, that never produces an incorrect result, but outputs “???” at times, where*

$$
\Pr[\mathcal{A}(I) \space \text{is correct}] \geq \epsilon.
$$

*Then it holds for all $\delta \gt 0$: let $\mathcal{A}_\delta$ denote the algorithm that calls $\mathcal{A}$ until we get a value different from “???” or until “???” has been output $N = \epsilon^{-1} \ln \delta^{-1}$ times. Then it holds for the algorithm $A_\delta$ that* 

$$
\Pr[\mathcal{A}_\delta(I) \space \text{is correct}] \geq 1 - \delta.
$$

</aside>

## Monte-Carlo Algorithms

In the special case where a Monte-Carlo algorithm outputs a boolean value and we know that one of these values is always correct we can apply the following:

<aside>
📖 *Let $\mathcal{A}$ be a randomized algorithm that always outputs one of $\text{Yes}$ or $\text{No}$, where*

$$
\Pr[\mathcal{A}(I) = \text{Yes}] = 1 \quad \text{if $I$ is a Yes-instance},
$$

*and* 

$$
\Pr[\mathcal{A}(I) = \text{No}] \geq \epsilon \quad \text{if $I$ is a No-instance.}
$$

*Then it holds for all $\delta \gt 0$: let $\mathcal{A}_\delta$ denote the algorithm that calls $\mathcal{A}$ until either $\text{No}$ is output or until $\text{Yes}$ has been output $N = \epsilon^{-1} \ln\delta^{-1}$ times.*

</aside>