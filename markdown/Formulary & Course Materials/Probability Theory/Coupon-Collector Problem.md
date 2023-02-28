# Coupon-Collector Problem

# Motivation

We are collecting cards. There are $n$ total different cards. We can buy cards in packets, where each card has an equal probability of landing in a packet. We want to find how many packets we are expected to buy in order to have a full collection of all cards.

# Solution

Let $\Chi$ be the number of purchases until completion of the collection. We partition the time into phases: let phase $i$ denote the number of steps from obtaining the $(i-1)$-th card (exclusive) up to obtaining the $i$-th card (inclusive).

Let $\Chi_i$ be the number of purchases in phase $i$. Clearly, it then holds that $\Chi = \sum_{i=1}^n \Chi_i$. Phase $i$ concludes when we receive one of the remaining $n - i + 1$ cards which we do not yet possess. Then, $\Chi_i$ is geometrically distributed with parameter $p = \frac{n-i+1}{n}$ and expected value $\mathbb{E}[\Chi_i]=\frac{n}{n-i+1}$.

By linearity of the expected value it follows that 

$$
\mathbb{E}[\Chi] = \sum_{i=1}^n\mathbb{E}[\Chi_i] = \sum_{i=1}^n \frac{n}{n-i+1} = n \cdot \sum_{i=1}^n\frac{1}{i} = n \cdot H_n,
$$

where $H_n = \sum_{i=1}^n \frac{1}{i}$ denotes the $*n$-th harmonic number*.