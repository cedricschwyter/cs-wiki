# Sorting and Selecting

# QuickSort

![Untitled](Sorting%20and%20Selecting%202b7f52e90ad64c56b49053b5666629ef/Untitled.png)

Let $T_{l,r}$ be the (random) number of comparisons that are performed per call of $\text{QuickSort}(A,l,r)$. Then it holds that 

$$
\mathbb{E}[T_{1,n}] \leq 2(n+1) \ln n + O(n).
$$

For $l \geq r$ it holds that $T_{l,r} = 0$. For $l \lt r$ it follows that 

$$
\begin{align*}
\mathbb{E}[T_{l,r}] & = \sum_{i=l}^r \Pr[t=i] \cdot (r-l+ \mathbb{E}[T_{l,i-1}]+\mathbb{E}[T_{i+1,r}]) \\
& = \frac{1}{r-l+1} \cdot \sum_{i=0}^{r-l}(r-l+\mathbb{E}[T_{l,l+i-1}] + \mathbb{E}[T_{l+i+1,r}]).
\end{align*}
$$

Here, we made use of the fact that $t$ is uniformly distributed on $\{l,...,r\}$, which follows from the assumption that the elements of $A$ are different.