# Probability

# Probability Spaces

<aside>
💡 Terminology: A set $\Omega$ is called a **probability base space** (or *sample space*). An element $\omega \in \Omega$ is called an **elementary event**.
</aside>

<aside>
💡 A system of sets $\mathcal{F} \sub \mathcal{P}(\Omega)$ is called **Sigma-algebra** ($\sigma$-algebra), if it fulfills the following conditions:

**E1**. $\Omega \in \mathcal{F}$

**E2**. $A \in \mathcal{F} \implies A^{c} \in \mathcal{F}$

**E3**. $A_1, A_2, ... \in \mathcal{F} \implies \bigcup_{i=1}^{\infty} A_i \in \mathcal{F}$

The elements of the $\sigma$-algebra are called **events**.
</aside>

<aside>
💡 Let $\Omega$ be a sample space and let $\mathcal{F}$ be a $\sigma$-algebra. A transformation 

$$\begin{align*}
\text{Pr} : \space & \mathcal{F} \longrightarrow [0, 1] 
\\ & A \longmapsto \text{Pr}[A]
\end{align*}$$

(sometimes also denoted by $\mathbb{P} = \text{Pr}$) is called **probability measure** on $(\Omega, \mathcal{F})$, if the following properties hold:

**E1**. $\text{Pr}[\Omega] = 1$

**E2**. ($\sigma$-**additivity**) $\text{Pr}[A] = \sum_{i=1}^{\infty} \text{Pr}[A_i] \quad \text{if} \space A = \bigcup_{i=1}^{\infty} A_i$ (disjoint union)

</aside>

<aside>
💡 Let $\Omega$ be a sample space, $\mathcal{F}$ a $\sigma$-algebra and $\text{Pr}$ a probability measure. The triple $(\Omega, \mathcal{F}, \text{Pr})$ is called a **probability space**.
</aside>

<aside>
💡 Terminology: Let $A$ be an event and let $\omega$ be an arbitrary elementary event.
We say that $A$ **occurs** (for $\omega$) if $\omega \in A$.
We say that $A$ **does not occur** if $\omega \notin A$.
</aside>

<aside>
💡 Let $\Omega$ be a finite sample space. The **Laplace model** on $\Omega$ is a triple $(\Omega, \mathcal{F}, \text{Pr})$, such that

- $\mathcal{F} = \mathcal{P}(\Omega)$
- $\text{Pr} : \mathcal{F} \longrightarrow [0, 1]$ is defined by $$\forall A \in \mathcal{F} \quad \text{Pr}[A] = \frac{\lvert A \rvert}{\lvert \Omega \rvert}.$$
</aside>

<aside>
📖 *(Closure of a $\sigma$-algebra under operations)
Let $\mathcal{F}$ be a $\sigma$-algebra on $\Omega$. The following hold:*

**E4**. $\varnothing \in \mathcal{F}$,

**E5**. $A_1, A_2, ... \in \mathcal{F} \implies \bigcap_{i=1}^{\infty} A_i \in \mathcal{F}$,

**E6**. $A, B \in \mathcal{F} \implies A \cup B \in \mathcal{F}$,

**E7**. $A, B \in \mathcal{F} \implies A \cap B \in \mathcal{F}$.
</aside>
