# Probability Theory (TODO)

# Definitions and Basic Terms

<aside>
💡 A *discrete probability space* is defined by the *sample space/possibility space* $\Omega = \{\omega_1, \omega_2,...\}$ of *elementary events*. An (elementary-) probability $\Pr[\omega_i]$ is assigned to every elementary event $\omega_i$, where we require $0\leq \Pr[\omega_i] \leq 1$ and

$$
\sum_{\omega \in \Omega} \Pr[\omega]=1.
$$

A set $E \sube \Omega$ is called an *event*. The probability $\Pr[E]$ of an event is defined by

$$
\Pr[E] = \sum_{\omega \in E} \Pr[\omega].
$$

If $E$ is an event, then we define $\bar{E} = \Omega \setminus E$ as the *complementary event* of $E$.

</aside>

<aside>
📌 *For events $A, B$ the following hold:*

1. $\Pr[\varnothing] = 0, \Pr[\Omega]=1$
2. $0 \leq \Pr[A] \leq 1$
3. $\Pr[\bar{A}] = 1-\Pr[A]$
4. *If $A \sube B$, then it follows that $\Pr[A] \leq \Pr[B].$*
</aside>

<aside>
📖 (Addition theorem).

*If the events $A_1,...,A_n$ are pairwise disjoint (i.e., if it holds for all pairs $i \neq j$ that $A_i \cap A_j = \varnothing$), then it holds that* 

$$
\Pr\bigg[\bigcup_{i=1}^n A_i \bigg] = \sum_{i=1}^n \Pr[A_i].
$$

*For an infinite set of disjoint events $A_1, A_2,...$ it holds analogously*

$$
\Pr\bigg[\bigcup_{i=1}^\infty A_i \bigg] = \sum_{i=1}^\infty \Pr[A_i].
$$

</aside>

<aside>
📖 (The sieve formula, Inclusion-Exclusion principle).

*For events $A_1,...,A_n \quad (n \geq 2)$ the following holds:*

$$
\begin{align*}
\Pr\bigg[\bigcup_{i = 1}^n A_i  = \bigg] & = \sum_{l=1}^n (-1)^{l+1} \sum_{1 \leq i_1 \lt ...\lt i_l \leq n} \Pr[A_{i_1}\cap...\cap A_{i_l}] \\
& = \sum_{i=1}^n \Pr[A_i] - \sum_{1 \leq i_1 \lt i_2 \leq n} \Pr[A_{i_1}\cap A_{i_2}] \\
& \quad\quad + \sum_{1 \leq i_1 \lt i_2\lt i_3 \leq n} \Pr[A_{i_1}\cap A_{i_2} \cap A_{i_3}] - ... \\
& \quad\quad + (-1)^{n+1} \cdot \Pr[A_1 \cap ... \cap A_n].
\end{align*}
$$

</aside>

<aside>
📎 (Boole’s Inequality, Union Bound).

*For events $A_1, ..., A_n$ the following holds:*

$$
\Pr\bigg[\bigcup_{i=1}^n A_i \bigg] \leq \sum_{i=1}^n \Pr[A_i].
$$

*Analogously, the following holds for an infinite sequence of events $A_1, A_2,...$:*

$$
\Pr\bigg[\bigcup_{i=1}^\infty A_i \bigg] \leq \sum_{i=1}^\infty \Pr[A_i].
$$

</aside>

<aside>
💡 (Principle of Laplace).

*If nothings indicates otherwise, we assume that all elementary events are equally likely.*

Therefore, $\Pr[\omega] = \frac{1}{\lvert \Omega \rvert}$ for all elementary events $\omega$.

It immediately follows for an arbitrary event $E$ that 

$$
\Pr[E] = \frac{\lvert E \rvert}{\lvert \Omega \rvert}.
$$

We say, the event of the modeled experiment on $\Omega$ is *uniformly distributed* or *equally distributed*.

</aside>

<aside>
💡 In an information-theoretical sense such a probability space ($\Pr[\omega] = \frac{1}{\lvert \Omega \rvert}$ for all $\omega \in \Omega$) has the largest-possible entropy. Every deviation from uniform probability distribution requires that we put more information into the model (and therefore decrease entropy).

</aside>

# Conditional Probability

<aside>
💡 Let $A$ and $B$ be events with $\Pr[B] \gt 0$. The *conditional probability* $\Pr[A \vert B]$ of $A$ given $B$ is defined by

$$
\Pr[A \vert B] = \frac{\Pr[A \cap B]}{\Pr[B]}.
$$

</aside>

<aside>
💡 The conditional probabilities of the form $\Pr[\cdot \vert B]$ form a new probability space over $\Omega$ for an arbitrary event $B \sube \Omega$ with $\Pr[B] \gt 0$.

The probabilities of the elementary events $\omega_i$ are calculated through $\Pr[\omega_i \vert B]$. Then 

$$
\sum_{\omega \in \Omega}\Pr[\omega \vert B] = \sum_{\omega \in \Omega} \frac{\Pr[\omega \cap B]}{\Pr[B]} = \sum_{\omega \in B} \frac{\Pr[\omega]}{\Pr[B]} = \frac{\Pr[B]}{\Pr[B]} = 1.
$$

the definition of a discrete probability space is still fulfilled and therefore all rules for probabilities still apply to conditional probabilities.

</aside>

<aside>
📖 (Multiplication theorem).

*Let the events $A_1, ..., A_n$ be given. If $\Pr[A_1 \cap ... \cap A_n] \gt 0$ then the following holds:*

$$
\Pr[A_1 \cap...\cap A_n] = \Pr[A_1] \cdot \Pr[A_2 \vert A_1] \cdot \Pr[A_3 \vert A_1 \cap A_2] \cdot ... \cdot \Pr[A_1 \cap ... \cap A_{n-1}].
$$

</aside>

<aside>
📖 (Law of total probability).

*Let the events $A_1,...,A_n$ be pairwise disjoint and let $B \sube A_1 \cup ... \cup A_n.$ Then it follows that*

$$
\Pr[B] = \sum_{i = 1}^n \Pr[B \vert A_i] \cdot \Pr[A_i].
$$

*Analogously, for pairwise disjoint events $A_1, A_2,...$ with $B \sube \bigcup_{i=1}^\infty A_i$ it follows that*

$$
\Pr[B] = \sum_{i=1}^\infty \Pr[B \vert A_i] \cdot \Pr[A_i].
$$

</aside>

<aside>
📖 (Bayes’ theorem).

*Let the events $A_1, ..., A_n$ be pairwise disjoint. Furthermore, let $B \sube A_1 \cup ... \cup A_n$ be an event with $\Pr[B] \gt 0$. Then it holds for an arbitrary $i = 1,...,n$ that*

$$
\Pr[A_i \vert B] = \frac{\Pr[A_i \cap B]}{\Pr[B]} = \frac{\Pr[B \vert A_i] \cdot \Pr[A_i]}{\sum_{j=1}^n \Pr[B \vert A_j] \cdot \Pr[A_j]}.
$$

*Analogously, for pairwise disjoint events $A_1, A_2, ...$ with $B \sube \bigcup_{i=1}^\infty A_i$ it holds that*

$$
\Pr[A_i \vert B] = \frac{\Pr[A_i \cap B]}{\Pr[B]} = \frac{\Pr[B \vert A_i] \cdot \Pr[A_i]}{\sum_{j=1}^\infty \Pr[B \vert A_j] \cdot \Pr[A_j]}.
$$

</aside>

# Independence

<aside>
💡 The events $A$ and $B$ are called *independent* if

$$
\Pr[A \cap B] = \Pr[A] \cdot \Pr[B]
$$

</aside>

<aside>
💡 The events $A_1, ...,A_n$ are called *independent* if it holds for all subsets $I \sube \{1,...,n\}$ with $I = \{i_1, ...,i_k\}$ that

$$
\Pr[A_{i_1} \cap ... \cap A_{i_k}] = \Pr[A_{i_1}]\cdot ... \cdot \Pr[A_{i_k}].
$$

An infinite family of events $A_i$ with $i \in \mathbb{N}$ is called independent if the above condition is met for all finite subsets $I \sube \mathbb{N}$.

</aside>

<aside>
📌 *The events $A_1,...,A_n$ are independent if and only if it holds for all $(s_1,...,s_n) \in \{0,1\}^n$ that*

$$
\Pr[A_1^{s_1}\cap...\cap A_n^{s_n}] = \Pr[A_1^{s_1}] \cdot ... \cdot \Pr[A_n^{s_n}],
$$

*where $A_i^0 = \bar{A}_i$ and $A_i^1 = A_i$.*

</aside>

<aside>
📌 *Let $A$, $B$ and $C$ be independent events. Then $A \cap B$ and $C$ respectively $A \cup B$ and $C$ independent.*

</aside>

# Random Variables

<aside>
💡 A *random variable* is a transformation $\Chi : \Omega \longrightarrow \mathbb{R}$, where $\Omega$ is the possibility space of a probability space.

</aside>

<aside>
💡 In discrete probability spaces the *codomain* of a random variable

$$
W_\Chi = \Chi(\Omega) = \{\chi \in \mathbb{R} \space \vert \space \exists \space \omega \in \Omega \quad \Chi(\omega) = \chi\}
$$

is in all cases finite or countably infinite, depending on $\Omega$ being finite or countably infinite.

</aside>

<aside>
💡 When researching a random variable $\Chi$ one is interested in the probabilities with which $\Chi$ assumes a specific value. For $W_{\Chi} = \{\chi_1,...,\chi_n\}$ respectively $W_{\Chi} = \{\chi_1,\chi_2,...\}$ for an arbitrary $1 \leq i \leq n$ respectively $\chi_i \in \mathbb{N}$ we regard the event $\Chi^{-1}(\chi_i) = \{\omega \in \Omega \space \vert \space \Chi(\omega) = \chi_i\}$. We abbreviate $\Chi^{-1}(\chi_i)$ as $"\Chi = \chi_i"$.

Therefore, we can define

$$
\Pr[\Chi \leq \chi_i] = \sum_{\chi \in W_{\Chi} \space \vert \space \chi \leq \chi_i} \Pr[\Chi = \chi] = \Pr[\{\omega \in \Omega \space \vert \space \Chi(\omega) \leq \chi_i\}].
$$

</aside>

<aside>
💡 The function

$$
\begin{align*}
f_{\Chi} : \mathbb{R} & \longrightarrow [0,1] \\
\chi & \longmapsto \Pr[\Chi = \chi]
\end{align*}
$$

is called the *density (function)* of $\Chi$.

</aside>

<aside>
💡 The function

$$
\begin{align*}
F_{\Chi}: \mathbb{R} & \longrightarrow [0, 1] \\
\chi & \longmapsto \Pr[\Chi \leq \chi] = \sum_{\chi' \in W_{\Chi} \space \vert \space \chi' \leq \chi} \Pr[\Chi = \chi']
\end{align*}
$$

is called the *distribution (function) of $\Chi$.*

</aside>

## Expected Value

<aside>
💡 For a random variable $\Chi$ we define the *expected value* $\mathbb{E}[\Chi]$ as

$$
\mathbb{E}[\Chi] = \sum_{\chi \in W_\Chi} \chi \cdot \Pr[\Chi = \chi]
$$

if that sum converges absolutely. Otherwise the expected value is said to be undefined.

</aside>

<aside>
📌 *If $\Chi$ is a random variable then the following holds:*

$$
\mathbb{E}[\Chi]=\sum_{\omega \in \Omega} \Chi(\omega) \cdot \Pr[\omega].
$$

</aside>

<aside>
📖 *Let $\Chi$ a random variable with $W_{\Chi} \sube \mathbb{N}_0$. Then it holds that*

$$
\mathbb{E}[\Chi] = \sum_{i=1}^\infty \Pr[\Chi \leq i].
$$

</aside>

<aside>
💡 **Conditional Random Variables**

Let $\Chi$ be a random variable and $A$ an event with $\Pr[A] \gt 0$. By $\Chi \vert A$ we denote that we calculate probabilities with which the random variable $\Chi$ assumes specific values with respect to the on $A$ conditional probabilities. It thus holds that

$$
\Pr[(\Chi \vert A) \leq \chi] = \Pr[\Chi \leq \chi \vert A] = \frac{\Pr[\{\omega \in A \space \vert \space \Chi(\omega) \leq \chi\}]}{\Pr[A]}
$$

</aside>

<aside>
📖 *Let $\Chi$ be a random variable. For pairwise disjoint events $A_1,...,A_n$ with $A_1 \cup ...\cup A_n = \Omega$ and $\Pr[A_1],...,\Pr[A_n] \gt 0$ it holds that*

$$
\mathbb{E}[\Chi] = \sum_{i=1}^n \mathbb{E}[\Chi \vert A_i] \cdot \Pr[A_i].
$$

*For pairwise disjoint events $A_1, A_2,...$ with $\bigcup_{i=1}^\infty A_k = \Omega$ and $\Pr[A_1], \Pr[A_2],..\gt 0$ it holds analogously that*

$$
\mathbb{E}[\Chi] = \sum_{i = 1} ^\infty \mathbb{E}[\Chi \vert A_i] \cdot \Pr[A_i].
$$

</aside>

<aside>
💡 **Linearity of the Expected Value**

Assume, we have defined $n$ random variables: 

$$
\Chi_1,...,\Chi_n : \Omega \longrightarrow \mathbb{R}.
$$

For an $\omega \in \Omega$ we thus receive $n$ real numbers $\Chi_1(\omega),...,\Chi_n(\omega)$. When we define a function $f : \mathbb{R}^n \longrightarrow \mathbb{R}$ we immediately see that the concatenation $f(\Chi_1,...,\Chi_n)$ in turn is also a random variable, for it holds that:

$$
f(\Chi_1, ..., \Chi_n):\Omega \longrightarrow \mathbb{R}.
$$

This holds for arbitrary functions $f : \mathbb{R}^n \longrightarrow \mathbb{R}$, in particular for affine linear functions: 

$$
\begin{align*}
f : \mathbb{R}^n & \longrightarrow \mathbb{R} \\
(\chi_1,...,\chi_n) & \longmapsto a_1\chi_1 + ... + a_n\chi_n + b,
\end{align*}
$$

where $a_1,...,a_n,b \in \mathbb{R}$ are arbitrary real numbers. In this case we usually denote the random variable $f(\Chi_1,...,\Chi_n)$ explicitly as 

$$
\Chi = a_1\Chi_1 + ...+ a_n\Chi_n + b.
$$

</aside>

<aside>
📖 (Linearity of the Expected Value).

*For random variables $\Chi_1,...,\Chi_n$ and $\Chi = a_1\Chi_1+...+a_n\Chi_n+b$ with $a_1,..,a_n,b \in \mathbb{R}$ it holds that*

$$
\mathbb{E}[\Chi] = a_1 \mathbb{E}[\Chi] + ... + a_n \mathbb{E}[\Chi_n] + b.
$$

</aside>

<aside>
💡 For an event $A \sube \Omega$ the corresponding *indicator variable $\Chi_A$* is defined by:

$$
\Chi_A(\omega) = \begin{cases}
1, & \text{if} \quad \omega \in A, \\
0, & \text{else}.
\end{cases}
$$

For the expected value of $\Chi_A$ it holds that: $\mathbb{E}[\Chi_A] = \Pr[A]$.

</aside>

## Variance