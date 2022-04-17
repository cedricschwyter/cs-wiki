# RSA Public-Key Encryption

(Copied/paraphrased/annotated from the script on Discrete Mathematics HS21 by Prof. Ueli Maurer)

# Motivation and Introduction

The RSA public-key cryptosystem, invented in 1977 by Rivest, Shamir, and Adleman (R. L. Rivest, A. Shamir, and L. Adleman, A method for obtaining digital signatures and publickey cryptosystems, Communications of the ACM, Vol. 21, No. 2, pp. 120–126, 1978.), is used in many security protocols on the Internet, for instance in TLS/SSL. Like the Diffie-Hellman protocol ([Diffie-Hellman Key-Agreement](../Number%20The%20ad0a4/Diffie-Hel%20075c2.md)) it allows two parties to communicate securely, even if the communication channel is insecure, provided only that they can authenticate each other’s public keys (respectively the Diffie-Hellman values). Moreover, the RSA system can be used as a digital signature scheme (see below). RSA was the first cryptographic system offering this important functionality.

# $e$-th Roots in a Group

Recall Lagrange’s theorem:

<aside>
📖 *Lagrange’s Theorem:
Let $G$ be a finite group and let $H$ be a subgroup of $G$. Then the order of $H$ divides the order of $G$, i.e., $\lvert H \rvert$ divides $\lvert G \rvert$.*

</aside>

To understand the RSA system, all we need is the following simple theorem which is a consequence of Lagrange’s theorem.

<aside>
📖 $*e$-th Roots in a Group:
Let $G$ be some finite group (multiplicatively written), and let $e \in \mathbb{Z}$ be relatively prime to $\lvert G \rvert$ (i.e., $\text{gcd}(e, \lvert G \rvert) = 1$). The function $x \mapsto x^e$ is a bijection and the (unique) $e$-th root of $y \in G$, namely $x \in G$ satisfying $x^e = y$, is*

$$
x = y^d
$$

*where $d$ is the multiplicative inverse of $e$ modulo $\lvert G \rvert$, i.e.,*

$$
ed \equiv_{\lvert G \rvert} 1.
$$

</aside>

*Proof*: We have $ed = k \cdot \lvert G \rvert + 1$ for some $k$. Thus, for any $x \in G$ we have

$$
(x^e)^d = x^{ed} = x^{k \cdot \lvert G \rvert + 1} = (x^{\lvert G \rvert}) ^ k \cdot x = x
$$

$x^{\lvert G \rvert} = 1$ because of the following corollary we stated earlier:

<aside>
📎 *Let $G$ be a finite group. Then $a^{\lvert G \rvert} = e$ for every $a \in G$.*

</aside>

This thus means that the function $y \mapsto y^d$ is the inverse function of the function $x \mapsto x^e$ (which is hence a bijection). Thus the theorem about $e$-th roots in a group has been proven.

# Description of RSA

Motivated by the Diffie-Hellman protocol also based on modular exponentiation, Rivest, Shamir and Adleman suggested as a possible class of groups the groups $\mathbb{Z}_n^*$, where $n = pq$ is the product of two sufficiently large secret primes $p$ and $q$. Recall that $\varphi(n)$ is the Euler function mentioned earlier:

<aside>
💡 The *Euler function* $\varphi : \mathbb{Z}^+ \rightarrow \mathbb{Z}$ is defined as the cardinality of $\mathbb{Z}_m^*$ (known as *Euler’s totient function* or *Euler’s phi function*):

$$
\varphi (m) = \lvert \mathbb{Z}_m^* \rvert.
$$

</aside>

Also recall that its value can be computed using the prime factorization of its argument:

<aside>
📌 *If the prime factorization of $m$ is $m = \prod_{i=1}^r p_i^{e_i}$, then*

$$
\varphi (m) = \prod_{i=1}^r (p_i - 1) p_i^{e_i - 1}.
$$

</aside>

The order of $\mathbb{Z}_n^*$,

$$
\lvert \mathbb{Z}_n^* \rvert = \varphi(n) = (p - 1) (q - 1),
$$

can thus only be computed if the prime factors $p$ and $q$ of $n$ are known. The (public) encryption transformation is defined by

$$
m \mapsto y = R_n(m^e),
$$

and the (secret) decryption transformation is defined by

$$
y \mapsto m = R_n(y^d),
$$

where $d$ can be computed according to

$$
ed \equiv_{(p - 1)(q - 1)} 1.
$$

The RSA public-key cryptosystem is summarized in the following figure. Note, that this is one-way only, Alice will receive an encrypted message from Bob and will be able to decrypt it. One would also need to mirror the setup to enable two-way encrypted communication also from Alice to Bob.

![Untitled](RSA%20Public%20ba241/Untitled.png)

The RSA system is usually (for instance in the TLS/SSL protocol) used only for *key management*, not for encrypting actual application data. The message $m$ is an encryption key (typically a short-term session key) for a conventional cryptosystem which is used to encrypt the actual application data (e.g. of a TLS session).

# On the Security of RSA

Let us have a brief look at the security of the RSA public-key system. It is not known whether computing $e$-th roots modulo $n$ (when $\text{gcd}(e, \varphi(n)) = 1$) is easier than factoring $n$, but it is widely believed that the two problems are computationally equivalent. Factoring large integers is believed to be computationally infeasible. If no significant breakthrough in factoring is achieved and if processor speeds keep improving at the same rate as they are now (using the so-called Moore’s law), a modulus with 2048 bits appears to be secure for the next 15 years, and larger moduli (e.q. 8192 bits) are secure for a very long time.

Obviously, the system is insecure unless Bob can make sure he obtains the correct public key from Alice rather than a public key generated by an adversary and posted in the name of Alice. in other words, the public key must be sent from Alice to Bob via an authenticated channel. This is usually achieved (indirectly) by using a so-called public-key certificate signed by a trusted certification authority. One also uses the term *public-key infrastructure (PKI)*.

It is important to point out that for a public-key system to be secure, the message must be randomized in an appropriate manner. Otherwise, when given an encrypted message, an adversary can check plaintext messages by encrypting them and comparing them with the given encrypted message. If the message space is small (e.g. a bit), then this would allow to efficiently break the system.

# Digital Signatures

The RSA system can also be used for generating digital signatures. A digital signature can only be generated by the entity knowing the secret key, but it can be verified by anyone, e.g. by a judge, knowing the public key. Alice’s signature $s$ for a message $m$ is

$$
s = R_n(z^d) \space \text{for} \space z = m \| h(m),
$$

where $\|$ denotes concatenation and $h$ is a suitable function introducing redundancy into the message and the string $z$ is naturally understood as an element of $\mathbb{Z}_n$. A signature can be verified by raising it to the $e$-th power modulo $n$ and checking that it is of the correct form $m \| h(m)$. The message is recovered from the signature.