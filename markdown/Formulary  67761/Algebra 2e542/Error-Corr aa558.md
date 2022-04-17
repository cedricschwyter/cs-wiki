# Error-Correcting Codes

(Copied/paraphrased/annotated from the script on Discrete Mathematics HS21 by Prof. Ueli Maurer)

# Motivation and Introduction

Error-correcting codes are used in many communication protocols and other applications. For example, the digital information on a CD is stored in such a manner that even if some of the information is lost (e.g. because of a scratch or dirt on the disc), the entire information can still be reconstructed without quality degradation, as long as sufficiently much of the data is still available.

There are two types of problems that can occur in data transmission or when reading data from a storage medium. First, data can be erased, meaning that when reading (or receiving) it one realizes that it is missing. Second, data can contain errors, The second type of problem is more severe because it is not even known where in a data stream the errors occurred. A good error-correcting scheme can handle both problems.

# Encoding

<aside>
💡 A $(n, k)$-*encoding function* $E$ for some alphabet $\mathcal{A}$ is an injective function that maps a list $(a_0, ... ,a_{k - 1}) \in \mathcal{A}^k$ of $k$ (information) symbols to a list $(c_0, ... , c_{n - 1}) \in \mathcal{A}^n$ of $n \gt k$ (encoded) symbols in $\mathcal{A}$, called *codeword*:

$$
E : \mathcal{A}^k \longrightarrow \mathcal{A}^n : (a_0, ... ,a_{k - 1}) \longmapsto E((a_0, ... , a_{k - 1})) = (c_0, ... , c_{n - 1}).
$$

</aside>

For an encoding function $E$ one often consider the set

$$
\mathcal{C} = \text{Im}(E) = \{E((a_0,...,a_{k - 1})) \space | \space a_0, ... a_{k - 1} \in \mathcal{A} \}
$$

of codewords, which is called an error-correcting code.

<aside>
💡 An $(n, k)$-*error-correcting code* over the alphabet $\mathcal{A}$ with $\lvert \mathcal{A} \rvert = q$ is a subset of $\mathcal{A}^n$ of cardinality $q^k$.

</aside>

It is natural to use as the alphabet $\mathcal{A} = \{0,1\}$, i.e., to take bits as the basic unit of information. However, for several reasons (one being the efficiency of encoding and in particular decoding), one often considers larger units of information, for example bytes (i.e., $\mathcal{A} = \{0, 1\}^8$).

<aside>
💡 The *Hamming distance* between two strings of equal length over a finite alphabet $\mathcal{A}$ is the number of positions at which the two strings differ.

</aside>

<aside>
💡 The *minimum distance* of an error-correcting code $\mathcal{C}$, denoted $d_{\text{min}}(\mathcal{C})$, is the minimum of the *Hamming distance* between two codewords.

</aside>

## Example

The following code is a $(5, 2)$-code over the alphabet $\{0, 1\}$:

$$
\{(0, 0, 0, 0, 0), (1, 1, 1, 0, 0), (0, 0, 1, 1, 1), (1, 1, 0, 1, 1)\}.
$$

The minimum distance is 3.

# Decoding

<aside>
💡 A *decoding function* $D$ for an $(n ,k)$-encoding function is a function $D : \mathcal{A}^n \longrightarrow \mathcal{A}^k$.

</aside>

The idea is that a good decoding function takes an arbitrary list $(r_0, ... ,r_{n - 1}) \in \mathcal{A}^n$ of symbols and decodes it to the most plausible (in some sense) information vector $(a_0, ..., a_{k - 1})$. Moreover, a good decoding function should be efficiently computable.

The error-correcting capability of a code $\mathcal{C}$ can be characterized in terms of the number $t$ of errors that can be corrected. More precisely:

<aside>
💡 A decoding function $D$ is $t$-*error correcting* for encoding function $E$ if for any $(a_0, ..., a_{k - 1})$

$$
D((r_0, ... r_{n - 1})) = (a_0, ... , a_{k - 1})
$$

for any $(r_0, ..., r_{n - 1})$ with Hamming distance at most $t$ from $E((a_0, ..., a_{k - 1}))$.

A code $\mathcal{C}$ is $t$-*error correcting* if there exists $E$ and $D$ with $\mathcal{C} = \text{Im}(E)$ where $D$ is $t$-error correcting.

</aside>

<aside>
📖 *A code $\mathcal{C}$ with minimum distance $d$ is $t$-error correcting if and only if $d \geq 2t + 1$.*

</aside>

*Proof*: ($\impliedby$) If any two codewords have Hamming distance at least $2t + 1$ (i.e., differ in at least $2t + 1$ positions), then it is impossible that a word $(r_0, ... , r_{n - 1}) \in \mathcal{A} ^ n$ could result from two different codewords by changing $t$ positions. Thus if $(r_0, ... , r_{n - 1})$ has a distance at most $t$ from a codeword $(c_0, ..., c_{n - 1})$, then this codeword is uniquely determined. The decoding function $D$ can be defined to decode to (one of) the nearest codeword(s) (more precisely, to the information resulting (by $E$) in that codeword).

($\implies$) If there are two codewords that differ in at most $2t$ positions, then there exists a word $(r_0, ... , r_{n - 1})$ which differs from both codewords in at most $t$ positions; hence it is possible that $t$ errors can not be corrected. This proves the theorem.

## Example

A code with minimum distance $d = 5$ can correct $t = 2$ errors. The code in the other example above can correct a single error ($t = 1$).

# Codes based on Polynomial Evaluation

A very powerful class of codes is obtained by polynomial interpolation if $\mathcal{A}$ has a field structure, i.e., $\mathcal{A} = \text{GF}(q)$ for some $q$:

<aside>
📖 *Let $\mathcal{A} = \text{GF}(q)$ and let $\alpha_0, ... \alpha_{n - 1}$ be arbitrary distinct elements of $\text{GF}(q)$. Consider the encoding function*

$$
E((a_0,..., a_{k - 1})) = (a(\alpha_0),...,a(\alpha_{n - 1})),
$$

*where $a(x)$ is the polynomial*

$$
a(x) = a_{k - 1}x^{k - 1} + ... + a_1x + a_0.
$$

*This code has minimum distance $n - k + 1$.*

</aside>

*Proof*: The polynomial $a(x)$ of degree $k - 1$ can be interpolated from any $k$ values, i.e., from any $k$ codeword symbols. If two polynomials agree for $k$ arguments (or, equivalently, if two codewords agree at $k$ positions), then they are equal. This means that two *different* codewords cannot agree at $k$ positions. Hence any two codewords disagree in at least $n - k + 1$ positions. This proves the theorem.

An ($n,k$)-code over the field $\text{GF}(2^d)$ can be interpreted as a binary ($dn, dk$)-code (over $\text{GF}(2)$). The minimum distance of this binary code is at least that of the original code because two different $\text{GF}(2^d)$-symbols must differ in at least one bit (but can of course differ in more than one bit).

## Example

Polynomial codes as described are used for storing information on Compact Discs. In fact, the coding scheme of CD’s makes use of two different such codes. The field is $\text{GF}(2^8)$ defined by an irreducible polynomial of degree 8 over $\text{GF}(2)$ and the two codes are a (32, 28)-code over $\text{GF}(2^8)$ and a (28, 24)-code over $\text{GF}(2^8)$, both with minimum distance 5.