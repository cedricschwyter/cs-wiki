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


📖 *Let $\mathcal{A}$ be a randomized algorithm, that never produces an incorrect result, but outputs “???” at times, where*

$$
\Pr[\mathcal{A}(I) \space \text{is correct}] \geq \epsilon.
$$

*Then it holds for all $\delta \gt 0$: let $\mathcal{A}_\delta$ denote the algorithm that calls $\mathcal{A}$ until we get a value different from “???” or until “???” has been output $N = \epsilon^{-1} \ln \delta^{-1}$ times. Then it holds for the algorithm $\mathcal{A}_\delta$ that* 

$$
\Pr[\mathcal{A}_\delta(I) \space \text{is correct}] \geq 1 - \delta.
$$



## Monte-Carlo Algorithms

In the special case where a Monte-Carlo algorithm outputs a boolean value and we know that one of these values is always correct (i.e. an algorithm with a *one-sided error*) we can apply the following:


📖 *Let $\mathcal{A}$ be a randomized algorithm that always outputs one of $\text{Yes}$ or $\text{No}$, where*

$$
\Pr[\mathcal{A}(I) = \text{Yes}] = 1 \quad \text{if $I$ is a Yes-instance},
$$

*and* 

$$
\Pr[\mathcal{A}(I) = \text{No}] \geq \epsilon \quad \text{if $I$ is a No-instance.}
$$

*Then it holds for all $\delta \gt 0$: let $\mathcal{A}_\delta$ denote the algorithm that calls $\mathcal{A}$ until either $\text{No}$ is output or until $\text{Yes}$ has been output $N = \epsilon^{-1} \ln\delta^{-1}$ times. Then it holds for the algorithm $\mathcal{A}_\delta$ that*

$$
\Pr[\mathcal{A}_\delta(I) \space \text{is correct}] \geq 1-\delta.
$$



We can similarly reduce the probability of failure of *two-sided error* Monte-Carlo algorithms when the original probability of success of the algorithm is strictly larger than $\frac{1}{2}$:


📖 *Let $\epsilon \gt 0$ and $\mathcal{A}$ be a randomized algorithm that always outputs one of $\text{Yes}$ or $\text{No}$, where*

$$
\Pr[\mathcal{A}(I) \space \text{is correct}] \geq \frac{1}{2} + \epsilon.
$$

*Then it holds for all $\delta \gt 0$: let $\mathcal{A}_\delta$ denote the algorithm, that makes $N = 4 \epsilon^{-2} \ln \delta^{-1}$ independent calls of $\mathcal{A}$ and outputs the majority of the returned results. Then it holds for the algorithm $\mathcal{A}_\delta$ that*

$$
\Pr[\mathcal{A}_\delta(I) \space \text{is correct}] \geq 1 - \delta.
$$



For randomized algorithms for optimization problems we usually don’t refer to probabilities of success/failure, but to whether they output the desired result, e.g., if they output a value that is at least as big as the expected value: 


📖 *Let $\epsilon \gt 0$ and $\mathcal{A}$ be a randomized algorithm for a maximization problem, where*

$$
\Pr[\mathcal{A}(I) \geq f(I)] \geq \epsilon.
$$

*Then it holds for all $\delta \gt 0$: let $\mathcal{A}_\delta$ the algorithm, that makes  $N = \epsilon^{-1} \ln \delta^{-1}$ independent calls of $\mathcal{A}$ and outputs the best of the returned results. Then it holds for the algorithm $\mathcal{A}_\delta$ that* 

$$
\Pr[\mathcal{A}_\delta(I) \geq f(I)] \geq 1 - \delta.
$$

*(For minimization problems the analogous statement holds if $\geq f(I)$ is swapped with $\leq f(I)$.)*

