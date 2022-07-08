# Sorting and Selecting (TODO)

# QuickSort

![Untitled](Sorting%20and%20Selecting%20(TODO)%202b7f52e90ad64c56b49053b5666629ef/Untitled.png)

## Claim

Let $T_{l,r}$ be the (random) number of comparisons that are performed per call of $\text{QuickSort}(A,l,r)$, where $A$ is an array of pairwise different numbers. Then it holds that 

$$
\mathbb{E}[T_{1,n}] \leq 2(n+1) \ln n + O(n).
$$

## Proof

For $l \geq r$ it holds that $T_{l,r} = 0$. For $l \lt r$ it follows that 

$$
\begin{align*}
\mathbb{E}[T_{l,r}] & = \sum_{i=l}^r \Pr[t=i] \cdot (r-l+ \mathbb{E}[T_{l,i-1}]+\mathbb{E}[T_{i+1,r}]) \\
& = \frac{1}{r-l+1} \cdot \sum_{i=0}^{r-l}(r-l+\mathbb{E}[T_{l,l+i-1}] + \mathbb{E}[T_{l+i+1,r}]).
\end{align*}
$$

Looking at this expression more closely we can find that the expected value $\mathbb{E}[T_{l,r}]$ does not actually depend on $r$ and $l$, but much rather only from the amount of elements to sort $r-l+1$. We can thus recursively define numbers $t_n$: 

$$
t_n = \begin{cases}
0 & \text{if} \quad n \leq 1, \\
\frac{1}{n}\sum_{i=0}^{n-1}(n-1+t_i+t_{n-i-1}) & \text{if} \quad n \geq 2.
\end{cases}
$$

By induction on $r-l$ we can easily see that for all $l,r$ the equality $\mathbb{E}[T_{l,r}]=t_{r-l+1}$ holds. Let’s determine an upper bound for $t_n$. For all $n \geq 3$ it holds according to above definition that 

$$
n \cdot t_n = \sum_{i=0}^{n-1}(n-1+t_i+t_{n-i-1}).
$$

as well as 

$$
(n-1)\cdot t_{n-1} = \sum_{i=0}^{n-2} (n-2+t_i+t_{n-i-2}).
$$

If we subtract the second from the first equation we get: 

$$
nt_n - (n-1)\cdot t_{n-1} = 2(n-1)+2t_{n-1}.
$$

and therefore f

$$
t_n=\frac{n+1}{n} \cdot t_{n-1}+\frac{2(n-1)}{n} \leq \frac{n+1}{n} \cdot t_{n-1}+2.
$$

By induction over $n$ we can show that for all $n \geq 2$ that 

$$
t_n \leq 2 \sum_{i=3}^{n+1} \frac{n+1}{i}.
$$

For $n=2$ it follows from the definition of $t_n$, that $t_2 = 1 \leq 2 = \sum_{i=3}^3 1$. For $n \geq 3$ we can use the inequality $t_n \leq \frac{n+1}{n} \cdot t_{n-1}+2.$ that we derived above together with the induction hypothesis.

Since $\sum_{i=1}^n \frac{1}{i} = H_n = \ln n + O(1)$ it holds in particular that 

$$
\mathbb{E}[T_{1,n}] = t_n \leq 2(n+1) \ln n + O(n).
$$

This proves the claim.

# QuickSelect

![Untitled](Sorting%20and%20Selecting%20(TODO)%202b7f52e90ad64c56b49053b5666629ef/Untitled%201.png)

## Claim

We can find the $k$-th least element in a sequence of $n$ elements in $O(n)$ using the above $\text{QuickSelect}(A,l,r,k)$ algorithm, where $A$ is an array of pairwise different numbers.

## Proof