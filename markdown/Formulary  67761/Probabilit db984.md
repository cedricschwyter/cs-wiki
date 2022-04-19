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