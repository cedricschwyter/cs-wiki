# Digital Building Blocks

# Arithmetic Circuits

Arithmetic circuits are the central building blocks of computers. Computers and digital logic perform many arithmetic functions: addition, subtraction, comparison, shift, multiplication and division.

## Addition

Addition is one of the most common operations in digital systems. We first consider how to add two 1-bit binary numbers. We then extend to $N$-bit binary numbers. Adders also illustrate trade-offs between speed and complexity.

### Half Adder

We begin by building a 1-bit *half adder*. As shown in the figure, the half adder has two inputs, $A$ and $B$, and two outputs, $S$ and $C_{\text{out}}$. $S$ is the sum of $A$ and $B$. If $A$ and $B$ are both 1, $S$ is 2, which cannot be represented with a single binary digit. Instead, it is indicated with a carry out, $C_{\text{out}}$, in the next column. The half adder can be built from an $\text{XOR}$ gate and an $\text{AND}$ gate.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled.png)

In a multi-bit adder, $C_\text{out}$is added or *carried in* to the next most significant bit. For example, as shown in the figure, the carry bit shown in blue is the output, $C_{\text{out}}$, of the first column of 1-bit addition and the input, $C_{\text{in}}$, to the second column of addition. However, the half adder lacks a $C_{\text{in}}$ input to accept $C_{\text{out}}$ of the previous column. The *full adder*, described in the next section, solves this problem.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%201.png)

### Full Adder

A *full adder* accepts the carry in, $C_\text{in}$ as shown. The figure also shows the output equations for $S$ and $C_{\text{out}}$.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%202.png)

### Carry Propagate Adder

An $N$-bit adder sums two $N$-bit inputs, $A$ and $B$, and a carry in, $C_{\text{in}}$, to produce an $N$-bit result, $S$, and a carry out, $C_{\text{out}}$. It is commonly called a *carry propagate adder (CPA)* because the carry out of one bit propagates into the next bit. The symbol for a CPA is shown in the figure; it is drawn just like a full adder except that $A$, $B$, and $S$ are busses rather than single bits. Three common CPA implementations are called ripple-carry adders, carry-lookahead adders, and prefix adders.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%203.png)

### Ripple-Carry Adder

The simplest way to build an $N$-bit carry propagate adder is to chain together $N$ full adders. The $C_{\text{out}}$ of one stage acts as the $C_{\text{in}}$ of the next stage, as shown in the figure for 32-bit addition. This is called a *ripple-carry adder*. It is a good application of modularity and regularity: the full adder module is reused many times to form a larger system. The ripple-carry adder has the disadvantage of being slow when $N$ is large. $S_{31}$ depends on $C_{30}$, which depends on $C_{29}$ and so forth all the way back to $C_{\text{in}}$, as shown blue in the figure. We say that the carry *ripples* through the carry chain. The delay of the adder, $t_{\text{ripple}}$, grows directly with the number of bits, as given by below equation, where $t_{FA}$ is the delay of a full adder. 

$$
t_{\text{ripple}} = Nt_{FA}
$$

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%204.png)

### Carry-Lookahead Adder

The fundamental reason that large ripple-carry adders are slow is that the carry signals must propagate through every bit in the adder. A *carry-lookahead* adder is another type of carry propagate adder that solves this problem by dividing the adder into *blocks* and providing circuitry to quickly determine the carry out of a block as soon as the carry in is known. This it is said to *look ahead* across the blocks rather than waiting to ripple through all the full adders inside a block, For example, a 32-bit adder may be divided into eight 4-bit blocks.

Carry-lookahead adders use *generate* ($G$) and *propagate* ($P$) signals that describe how a column or block determines the carry out. The $i$-th column of an adder is said to *generate* a carry if it produces a carry out independent of the carry in. The $i$-th column of an adder is guaranteed to generate a carry, $C_i$, if $A_i$ and $B_i$ are both 1. Hence $G_i$, the generate signal for column $i$, is calculated as $G_i = A_iB_i$. The column is said to *propagate* a carry if it produces a carry out whenever there is a carry in. The $i$-th column will propagate a carry in, $C_{i-1}$, if either $A_i$ or $B_i$ is 1. Thus, $P_i = A_i + B_i$. Using these definitions, we can rewrite the carry logic for a particular column of the adder. The $i$-th column of an adder will generate a carry out, $C_i$, if it either generates a carry, $G_i$, or propagates a carry in, $P_iC_{i-1}$. In equation form: 

$$
C_i = A_iB_i+(A_i+B_i)C_{i-1} = G_i+P_iC_{i-1}
$$

The generate and propagate definitions extend to multiple-bit blocks. A block is said to generate a carry if it produces a carry out independent of the carry in to the block. The block is said to propagate a carry if it produces a carry out whenever there is a carry in to the block. We define $G_{i:j}$ and $P_{i:j}$ as generate and propagate signals for blocks spanning columns $i$ through $j$.

A block generates a carry if the most significant column generates a carry, or if the most significant column propagates a carry and the previous column generated a carry, and so forth. For example, the generate logic for a block spanning columns 3 through 0 is 

$$
G_{3:0} = G_3 + P_3(G_2+P_2(G_1+P_1G_0))
$$

A block propagates a carry if all the columns in the block propagate the carry. For example, the propagate logic for a block spanning columns 3 through 0 is 

$$
P_{3:0}=P_3P_2P_1P_0
$$

Using the block generate and propagate signals, we can quickly compute the carry out of the block, $C_i$, using the carry in to the block, $C_j$.

$$
C_i = G_{i:j}+P_{i:j}C_j
$$

Figure a) shows a 32-bit carry-lookahead adder composed of eight 4-bit blocks. Each block contains a 4-bit ripple-carry adder and some lookahead logic to compute the carry out of the block given the carry in, as shown in figure b). The $\text{AND}$ and $\text{OR}$ gates beeded to compute the single-bit generate and propagate signals, $G_i$ and $P_i$, are left out for brevity. Again, the carry-lookahead adder demonstrates modularity and regularity.

All of the CLA blocks compute the single-bit and block generate and propagate signals simultaneously. The critical path starts with computing $G_0$ and $G_{3:0}$ in the first CLA block. $C_{\text{in}}$ then advances directly to $C_{\text{out}}$ through the $\text{AND}/\text{OR}$ gate in each block until the last. For a large adder, this is much faster than waiting for the carries to ripple through each consecutive bit of the adder. Finally, the critical path through the last block contains a short ripple-carry adder. Thus, an $N$-bit adder divided into $k$-bit blocks has a delay 

$$
t_{CLA}=t_{pg}+t_{pg\_\text{block}} + (\frac{N}{k} - 1)t_{\text{AND}\_\text{OR}} + kt_{FA}
$$

where $t_{pg}$ is the delay of the individual generate/propagate gates (a single $\text{AND}$ or $\text{OR}$ gate) to generate $P$ and $G$, $t_{pg\_\text{block}}$ is the delay to find the generate/propagate signals $P_{i:j}$ and $G_{i:j}$ for a $k$-bit block, and $t_{\text{AND}\_\text{OR}}$ is the delay from $C_{\text{in}}$ to $C_{\text{out}}$ through the $\text{AND}/\text{OR}$ logic of the $k$-bit CLA block. For $N \gt 16$, the carry-lookahead adder is generally much faster than the ripple-carry adder. However, the adder delay still increases linearly with $N$.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%205.png)

### Prefix Adder

*Prefix adders* extend the generate and propagate logic of the carry-lookahead adder to perform addition even faster. They first compute $G$ and $P$ for pairs of columns, then for blocks of 4, then for blocks of 8, then 16, and so forth until the generate signal for every column is known. The sums are computed from these generate signals.

In other word, the strategy of a prefix adder is to compute the carry in, $C_{i-1}$, for each column, $i$, as quickly as possible, then to compute the sum using 

$$
S_i=(A_i \oplus B_i) \oplus C_{i-1}
$$

Define column $i = -1$ to hold $C_{\text{in}}$, so $G_{-1}=C_{\text{in}}$ and $P_{-1} = 0$. Then $C_{i-1}=G_{i-1:-1}$ because there will be a carry out of column $i-1$ if the block spanning columns $i-1$ through $-1$ generates a carry. The generated carry is either generated in column -1 or generated in a previous column and propagated. Thus, we can rewrite above equation as 

$$
S_i=(A_i \oplus B_i) \oplus G_{i-1:-1}
$$

Hence, the main challenge is to rapidly compute all the block generate signals $G_{-1:-1}$, $G_{0:-1}$, $G_{1:-1}$,…, $G_{N-2:-1}$. These signals, along with $P_{-1:-1}, P_{0:-1}, P_{1:-1},...,P_{N-2:-1}$ are called *prefixes*.

The figure shows an $N = 16$-bit prefix adder. The adder begins with a *precomputation* to form $P_i$ and $G_i$ for each column from $A_i$ and $B_i$ using $\text{AND}$ and $\text{OR}$ gates. It then uses $\log_2N=4$ levels of black cells to form the prefixes of $G_{i:j}$ and $P_{i:j}$. A black cell takes inputs from the upper part of a block spanning bits $i:k$ and from the lower part of a block spanning bits $k-1:j$. It combines these parts to form generate and propagate signals for the entire block spanning bits $i:j$ using the following equations: 

$$
\begin{align*}
G_{i:j} & = G_{i:k}+P_{i:k}G_{k- 1:j} \\
P_{i:j} &= P_{i:k}P_{k-1:j}
\end{align*}
$$

In other words, a block spanning bits $i:j$ will generate a carry if the upper part generates a carry or if the upper part propagates a carry generated in the lower part. The block will propagate a carry if both the upper and lower parts propagate the carry. Finally, the prefix adder computes the sums using the equations for $S_i$ above.

In summary, the prefix adder achieves a delay that grows logarithmically rather than linearly with the number of columns in the adder. This speedup is significant, especially for adders with 32 or more bits, but it comes at the expense of more hardware than a simple carry-lookahead adder. The network of black cells is called a *prefix tree*.

The general principle of using prefix trees to perform computations in time that grows logarithmically with the number of inputs is a powerful technique. With some cleverness, it can be applied to many other types of circuits.

The critical path for an $N$-bit prefix adder involves the precomputation of $P_i$ and $G_i$ followed by $\log_2N$ stages of black prefix cells to obtain all the prefixes. $G_{i-1:-1}$ then proceeds through the final $\text{XOR}$ gate at the bottom to compute $S_i$. Mathematically, the delay of an $N$-bit prefix adder is 

$$
t_{PA} = t_{pg}+\log_2N(t_{pg\_\text{prefix}}) + t_{\text{XOR}}
$$

where $t_{pg\_\text{prefix}}$ is the delay of a black prefix cell.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%206.png)

Hardware description languages provide the $+$ operation to specify a CPA. Modern synthesis tools select among many possible implementations, choosing the cheapest (smallest) design that meets the speed requirements. This greatly simmplifies the designer’s job. The example describes a CPA with carries in and out. 

```verilog
module adder #(parameter N = 8)
							(input  [N-1:0] a, b,
							 input          cin,
							 output [N-1:0] s,
							 output         cout);
	assign {cout, s} = a + b + cin;
endmodule
```

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%207.png)

# Number Systems

# Sequential Building Blocks

# Memory Arrays

# Logic Arrays