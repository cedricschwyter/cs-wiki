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
P_{i:j} & = P_{i:k}P_{k-1:j}
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

## Subtraction

Adders can add positive and negative numbers using two’s complement number representation. Subtraction is almost as easy: flip the sign of the second number, then add. Flipping the sign of a two’s complement number is done by inverting the bits and adding 1.

To compute $Y = A - B$, first create the two’s complement of $B$: Invert the bits of $B$ to obtain $\bar{B}$ and add 1 to get $-B = \bar{B} + 1$. Add this quantity to $A$ to get $Y = A + \bar{B} + 1 = A - B$. This sum can be performed with a single CPA by adding $A + \bar{B}$ with $C_{\text{in}}=1$. The figure shows the symbol for a subtractor and the underlying hardware for performing $Y = A-B$.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%208.png)

This example describes a subtractor. 

```verilog
module subtractor #(parameter N = 8)
                   (input  [N-1:0] a, b,
                    output [N-1:0] y);
  assign y = a - b;
endmodule
```

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%209.png)

## Comparators

A *comparator* determines whether two binary numbers are equal or if one is greater or less than the other. A comparator receives two $N$-bit binary numbers, $A$ and $B$. There are two common types of comparators.

An *equality comparator* produces a single output indicating whether $A$ is equal to $B$ ($A == B$). A *magnitude comparator* produces one or more outputs indicating the relative values of $A$ and $B$.

The equality comparator is the simpler piece of hardware. The figure shows the symbol and implementation of a 4-bit equality comparator. It first checks to determine whether the corresponding bits in each column of $A$ and $B$ are equal, using $\text{XNOR}$ gates. The numbers are equal if all of the columns are equal.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2010.png)

Magnitude comparison is usually done by computing $A-B$ and looking at the sign (most significant bit) of the result, as shown. If the result is negative (i.e., the sign bit is 1), then $A$ is less than $B$. Otherwise $A$ is greater or equal to $B$. 

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2011.png)

The example shows how to use various comparison operations. 

```verilog
module comparators # (parameter N = 8)
                     (input  [N-1:0] a, b,
                      output         eq, neq,
                      output         lt, lte,
                      output         gt, gte);
  assign eq = (a == b);
  assign neq = (a != b);
  assign lt = (a < b);
  assign lte = (a <= b);
  assign gt = (a > b);
  assign gte = (a >= b);
endmodule
```

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2012.png)

## ALU

An *Arithmetic/Logical Unit (ALU)* combines a variety of mathematical and logical operations into a single unit. For example, a typical ALU might perform addition, subtraction, magnitude comparison, $\text{AND}$ and $\text{OR}$ operations. The ALU forms the heart of most computer systems.

The figure shows the symbol for an $N$-bit ALU with $N$-bit inputs and outputs. The ALU receives a control signal, $F$, that specifies which function to perform. Control signals will generally be shown in blue to distinguish them from the data. The table lists typical functions that the ALU can perform.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2013.png)

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2014.png)

The figure shows an implementation of the ALU. The ALU contains an $N$-bit adder and $N$ two-input $\text{AND}$ and $\text{OR}$ gates. It also contains an inverter and a multiplexer to optionally invert input $B$ when the $F_2$ control signal is asserted. A 4:1 multiplexer chooses the desired function based on the $F_{1:0}$ control signals. More specifically, the arithmetic and logical blocks in the ALU operate on $A$ and $BB$. $BB$ is either $B$ or $\bar{B}$, depending on $F_2$. If $F_{1:0}=00$, the output multiplexer chooses $A \text{ AND } B$. If $F_{1:0}=01$, the ALU computes $A \text{ OR } B$. If $F_{1:0}=10$, the ALU performs addition or subtraction. Note that $F_2$ is also the carry in to the adder. Also remember that $\bar{B} + 1 = -B$ in two’s complement arithmetic. If $F_2 = 0$, the ALU computes $A+B$. If $F_2=1$ the ALU computes $A + \bar{B} + 1 = A - B$.

When $F_{2:0} = 111$, the ALU performs the *set if less than (SLT)* operation. When $A < B$, $Y = 1$. Otherwise, $Y = 0$. In other words, $Y$ is set to 1 if $A$ is less than $B$.

SLT is performed by computing $S = A -B$. If $S$ is negative, $A < B$. The *zero extend unit* produces an $N$-bit output by concatenating its 1-bit input with 0’s in the most significant bits. The sign bit of $S$ is their input to the zero extend unit.

Some ALUs produce extra outputs, called *flags*, that indicate information about the ALU output. For example, an *overflow flag* indicates that the result of the adder overflowed. A *zero flag* indicates that the ALU output is 0.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2015.png)

## Shifters and Rotators

*Shifters* and *rotators* move bits and multiply or divide by powers of 2. As the name implies, a shifter shifts a binary number left or right by a specified number of positions. There are several kinds of commonly used shifters:

- Logical shifter - shifts the number to the left (LSL) or right (LSR) and fills empty spots with 0’s.
    - Ex: 11001 LSR 2 = 00110; 11001 LSL 2 = 00100
- Arithmetic shifter - is the same as a logical shifter, but on right shifts fills the most significant bits with a copy of the old most significant bit. This is useful for multiplying and dividing signed numbers. Arithmetic shift left (ASL) is the same as logical shift left (LSL).
    - Ex: 11001 ASR 2 = 11110; 11001 ASL 2 = 00100
- Rotator - rotates number in circle such that empty spots are fulled with bits shifted off the other end.
    - Ex: 11001 ROR 2 = 01110; 11001 ROL 2 = 00111

An $N$-bit shifter can be built from $N$ $N$:1 multiplexers. The input is shifted by 0 to $N-1$ bits, depending on the value of the $\log_2N$-bit select lines. The figure shows the symbol and hardware of 4-bit shifters. The operators $<<$, $>>$, and $>>>$ typically indicate shift left (a)), logical shift right (b)), and arithmetic shift right (c)), respectively. Depending on the value of the 2-bit shift amount, $\text{shamt}_{1:0}$, the output, $Y$, receives the input, $A$, shifted by 0 to 3 bits. For all shifters, when $\text{shamt}_{1:0} = 00$, $Y = A$.

A left shift is a special case of multiplication. A left shift by $N$ bits multiplies the number by $2^N$. For example, $000011_2 << 4 = 110000_2$ is equivalent to $3_{10} \cdot 2_{10}^4 = 48_{10}$.

An arithmetic right shift is a special case of division. An arithmetic right shift by $N$ bits divides the number by $2^N$. For example, $11100_2 >>> 2 = 11111_2$ is equivalent to $-4_{10}/2_{10}^2 = -1_{10}$.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2016.png)

## Multiplication

Multiplication of unsigned binary numbers is similar to decimal multiplication but involves only 1’s and 0’s. The figure compares multiplication in decimal and binary. In both cases, *partial products* are formed by multiplying a single digit of the multiplies with the entire multiplicand. The shifted partial products are summed to form the result.

In general, an $N \times N$ multiplies multiplies two $N$-bit numbers and produces a $2N$-bit result. The partial products in binary multiplication are either the multiplicand or all 0’s. Multiplication of 1-bit binary numbers is equivalent to the $\text{AND}$ operation, so $\text{AND}$ gates are used to form the partial products.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2017.png)

The figure shows the symbol, function and implementation of a $4 \times 4$ multiplier. The multiplier receives the multiplicand and multiplier, $A$ and $B$, and produces the product, $P$. Each partial product is a single multiplier bit ($B_3$, $B_2$, $B_1$ or $B_0$) $\text{AND}$ the multiplicand bits ($A_3, A_2, A_1, A_0$). With $N$-bit operands, there are $N$ partial products and $N-1$ stages of 1-bit adders. For example, for a $4 \times 4$ multiplier, the partial product of the first row is $B_0 \text{ AND } (A_3, A_2, A_1, A_0)$. This partial product is added to the shifted second partial product, $B_1 \text{ AND } (A_3, A_2, A_1, A_0)$. Subsequent rows of $\text{AND}$ gates and adders form and add the remaining partial products.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2018.png)

As with adders, many different multiplier designs with different speed/cost trade-offs exist. Synthesis tools may pick the most appropriate design given the timing constraints. 

```verilog
module multiplier # (parameter N = 8)
                    (input  [N-1:0]   a, b,
                     output [2*N-1:0] y);
  assign y = a * b;
endmodule
```

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2019.png)

## Division

Binary division can be performed using the following algorithm for normalized unsigned numbers in the range $[2^N-1, 2^{N-1}]$:

```
R = A
for i = N - 1 to 0
	D = R - B
	if D < 0 then Q_i = 0, R' = R
	else          Q_i = 1, R' = D
	if i != 0 then R = 2*R'
```

The *partial remainder*, $R$, is initialized to the dividend, $A$. The divisor, $B$, is repeatedly subtracted from this partial remainder to determine whether it fits. If the difference, $D$, is negative, then the quotient bit, $Q_i$, is 0 and the difference is discarded. Otherwise, $Q_i$ is 1, and the partial remainder is updated to be the difference. In any event, the partial remainder is then doubled, and the process repeats. The result satisfies: 

$$
\frac{A}{B} = (Q+\frac{R}{B}) 2^{-(N-1)}
$$

The figure shows a schematic of a 4-bit array divider. The divider computes $A/B$ and produces a quotient, $Q$, and a remainder, $R$. The legend shows the symbol and schematic for each block in the array divider. The signal $P$ indicates whether $R - B$ is negative. It is obtained from the $C_{\text{out}}$ output of the leftmost block in the row, which is the sign of the difference.

The delay of an $N$-bit array divider increases proportionally to $N^2$ because the carry must ripple through all $N$ stages in a row before the sign is determined and the multiplexer selects $R$ or $D$. This repeats for all $N$ rows. Division is a slow and expensive operation in hardware and theerefore should be used as infrequently as possible.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2020.png)

# Number Systems

Computers operate on both integers and fractions. So far, we have only considered representing signed or unsigned integers. This section introduces fixed- and floating point number systems that can also represent rational numbers. Fixed-point numbers are analogous to decimals; some of the bits represent the integer part, and the rest represent the fraction. Floating-point numbers are analogous to scientific notation, with a mantissa and an exponent.

## Fixed-Point Number Systems

*Fixed-point notation* has an implied *binary point* between the integer and fraction bits, analogous to the decimal point between the integer and fraction digits of an ordinary decimal number. The figure a) shows a fixed-point number with four integer bits and four fraction bits. b) shows the implied binary point in blue, and c) shows the equivalent decimal value.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2021.png)

Signed fixed-point numbers can use either two’s complement (c)) or sign/magnitude (b)) notations. The figure shows the fixed-point representation of -2.375 using both notations with four integer and four fraction bits. The implicit binary point is shown in blue for clarity. In sign/magnitude form, the most significant bit is used to indicate the sign. The two’s complement representation is formed by inverting the bits of the absolute value (a)) and adding a 1 to the least significant /rightmost) bit. In this case, the least significant bit position is the $2^{-4}$ column.

Like all binary number representations, fixed-point numbers are just a collection of bits. There is no way of knowing the existence of the binary point except through agreement of those people interpreting the number.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2022.png)

## Floating-Point Number Systems

Floating-point numbers are analogous to scientific notation. They circumvent the limitation of having a constant number of integer and fractional bits, allowing the representation of very large and very small numbers. Like scientific notation, floating-point numbers have a *sign*, *mantissa* (M), *base* (B), and *exponent* (E), as shown. For example. the number $4.1\times 10^3$ is the decimal scientific notation for 4100. It has a mantissa of 4.1, a base of 10, and an exponent of 3. The decimal point *floats* to the position right after the most significant digit. Floating-point numbers are base 2 with a binary mantissa. 32 bits are used to represent 1 sign bit, 8 exponent bits, and 23 mantissa bits.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2023.png)

In binary floating-point, the first bit of the mantissa (to the left of the binary point) is always 1 and therefore need not be stored. It is called the *implicant leading one*. The figure shows the modified floating point representation of $228_{10}=11100100_2 \times 2^0 = 1.11001_2 \times 2^7$. The implicit leading one is not included in the 23-bit mantissa for efficiency. Only the fraction bits are stored. This frees up an extra bit for useful data.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2024.png)

We make one final modification to the exponent field. The exponent needs to represent both positive and negative exponents. To do so, floating-point uses a *biased* exponent, which is the original exponent plus a constant bias. 32-bit floating-point uses a bias of 127. For example, for the exponent 7, the biased exponent is $7 + 127 = 134 =10000110_2$. For the exponent -4, the biased exponent is $-4 + 127 = 123=01111011_2$. The figure shows $1.11001_2 \times 2^7$ represented in floating-point notation with an implicit leading one and a biased exponent of 134. This notation conforms to the IEEE 754 floating-point standard.

### Special Cases: 0, $\pm \infty$, and NaN

The IEEE floating-point standard has special cases to represent numbers such as zero, infinity, and illegal results. For example, representing the number zero is problematic in floating-point notation because of the implicit leading one. Special codes with exponents of all 0’s or all 1’s are reserved for these special cases. The table shows the floating-point representations of 0, $\pm \infty$, and NaN. As with sign/magnitude numbers, floating-point has both positive and negative 0. NaN is used for numbers that don’t exist, such as $\sqrt{-1}$ or $\log_2(-5)$.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2025.png)

### Single- and Double-Precision Formats

So far, we have examined 32-bit floating-point numbers. This format is also called *single-precision*, *single*, or *float*. The IEEE 754 standard also defines 64-bit *double-precision* (also called *double*) numbers that provide greater precision and greater range. The table shows the number of bits used for the fields in each format.

Excluding the special cases mentioned earlier, normal single-precision numbers span a range of $\pm 1.175494 \times 10^{-38}$ to $\pm 3.402824 \times 10^{38}$. They have a precision of about seven significant decimal digits (because $2^{-24} \approx 10^{-7}$). Similarly, normal double-precision numbers span a range of $\pm 2.22507385850720 \times 10^{-308}$ to $\pm 1.79769313486232 \times 10^{308}$ and have a precision of about 15 significant decimal digits.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2026.png)

### Rounding

Arithmetic results that fall outside of the available precision must round to a neighboring number. The rounding modes are (1) round down, (2) round up, (3) round toward zero, and (4) round to nearest. The default rounding mode is round to nearest. In the round to nearest mode, if two numbers are equally near, the one with a 0 in the least significant position of the fraction is chosen.

Recall that a number *overflows* when its magnitude is too large to be represented. Likewise, a number *underflows* when it is too tiny to be represented. In round to nearest mode, overflows are rounded up to $\pm \infty$ and underflows are rounded down to 0.

### Floating-Point Addition

Addition with floating-point numbers is not as simple as addition with two’s complement numbers. The steps for adding floating-point numbers with the same sign are as follows:

1. Extract exponent and fraction bits
2. Prepend leading 1 to form the mantissa
3. Compare exponents
4. Shift smaller mantissa if necessary
5. Add mantissas
6. Normalize mantissa and adjust exponent if necessary
7. Round result
8. Assemble exponent and fraction back into floating-point number

The figure show the floating-point addition of 7.875 ($1.11111 \times 2^2$) and 0.1875 ($1.1 \times 2^{-3}$). The result is 8.0625 ($1.0000001 \times 2^3$). After the fraction and exponent bits are extracted and the implicit leading 1 is prepended in steps 1 and 2, the exponents are compared by subtracting the smaller exponent from the larger exponent. The result is the number of bits by which the smaller number is shifted to the right to align the implied binary point (i.e. to make the exponents equal) in step 4. The aligned numbers are added. Because the sum has a mantissa that is greater than or equal to 2.0, the result is normalized by shifting it to the right by one bit and incrementing the exponent. In this example, the result is exact, so no rounding is necessary. The result is stored in floating-point notation by removing the implicit leading one of the mantissa and prepending the sign bit.

Floating-point arithmetic is usually done in hardware to make it fast. This hardware, called the *floating-point unit (FPU)* is typically distinct from the *central processing unit (CPU)*. The infamous *floating-point division (FDIV)* bug in the Pentium FPU cost Intel 475 million dollars to recall and replace defective chips. The bug occurred simply because a lookup table was not loaded correctly.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2027.png)

# Sequential Building Blocks

## Counters

An $N$-bit *binary counter*, as shown, is a sequential arithmetic circuit with clock and reset inputs and an $N$-bit output, $Q$. *Reset* initializes the output to 0. The counter then advances through all $2^N$ possible outputs in binary order, incrementing on the rising edge of the clock.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2028.png)

The figure shows an $N$-bit counter composed of an adder and a resettable register. On each cycle, the counter adds 1 to the value stored in the register. 

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2029.png)

The example describes a binary counter with asynchronous reset. 

```verilog
module counter # (parameter N = 8)
                 (input              clk,
                  input              reset,
                  output reg [N-1:0] q);
  always @ (posedge clk or posedge reset)
    if (reset) q <= 0;
    else q <= q + 1;
endmodule
```

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2030.png)

## Shift Registers

A *shift register* has a clock, a serial input, $S_{\text{in}}$, a serial output, $S_{\text{out}}$, and $N$ parallel outputs, $Q_{N-1:0}$, as shown. On each rising edge of the clock, a new bit is shifted in from $S_{\text{in}}$ and all the subsequent contents are shifted forward. The last bit in the shift register is available at $S_{\text{out}}$. Shift registers can be viewed as *serial-to-parallel converters*. The input is provided serially at $S_\text{in}$. After $N$ cycles, the past $N$ inputs are available in parallel at $Q$.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2031.png)

A shift register can be constructed from $N$ flip-flops connected in series, as shown. Some shift registers also have a reset signal to initialize all of the flip-flops.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2032.png)

A related circuit is a *parallel-to-serial* converter that loads $N$ bits in parallel, then shifts them out one at a time. A shift register can be modified to perform both serial-to-parallel and parallel-to-serial operations by adding a parallel input, $D_{N-1:0}$, and a control signal, $\text{Load}$, as shown. When $\text{Load}$ is asserted, the flip-flops are loaded in parallel from the $D$ inputs. Otherwise, the shift register shifts normally.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2033.png)

The example describes such a circuit. 

```verilog
module shiftreg # (parameter N = 8)
                  (input              clk,
                   input              reset, load,
                   input              sin,
                   input      [N-1:0] d,
                   output reg [N-1:0] q,
                   output             sout);
  always @ (posedge clk or posedge reset)
    if (reset) q <= 0;
    else if (load) q <= d;
    else q <= {q[N-2:0], sin};

  assign sout = q[N-1]
endmodule
```

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2034.png)

### Scan Chains

Shift registers are often used to test sequential circuits using a technique called *scan chains*. Testing combinational circuits is relatively straightforward. Known inputs called *test vectors* are applied, and the outputs are checked against the expected result. Testing sequential circuits is more difficult, because the circuits have state. Starting from a known initial condition, a large number of cycles of test vectors may be needed to put the circuit into a desired state. For example, testing that the most significant bit of a 32-bit counter advances from 0 to 1 require resetting the counter, then applying $2^{31}$ clock pulses.

To solve this problem, designers like to be able to directly observe and control all the state of the machine. This is done by adding a test mode in which the contents of all flip-flops can be read out or loaded with desired values. Most systems have too many flip-flops to dedicate individual pins to read and write each flip-flop. Instead, all the flip-flops in the system are connected together into a shift register called a scan chain. In normal operation, the flip-flops load data from their $D$ input and ignore the scan chain. In test mode, the flip-flops serially shift their contents out and shift in new contents using $S_{\text{in}}$ and $S_{\text{out}}$. The load multiplexer is usually integrated into the flip-flop to produce a *scannable flip-flop*.  The figure shows the schematic and symbol for a scannable flip-flop and illustrates how the flops are cascaded to build an $N$-bit scannable register.

For example, the 32-bit counter could be tested by shifting in the pattern 01111….111 in test mode, counting for one cycle in normal mode, then shifting out the result, which should be 10000…000. This requires only 32 + 1 + 32 = 65 cycles.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2035.png)

# Memory Arrays

The previous sections introduced arithmetic and sequential circuits for manipulating data. Digital systems also require *memories* to store the data used and generated by such circuits. Registers built from flip-flops are a kind of memory that stores small amounts of data. This section describes *memory arrays* that can efficiently store large amounts of data.

## Overview

The figure shows a generic symbol for a memory array. The memory is organized as a two-dimensional array of memory cells. The memory reads or writes the contents of one of the rows of the array. This row is specified by an *Address*. The value read or written is called *Data*. An array with $N$-bit addresses and $M$-bit data has $2^N$ rows and $M$ columns. Each row of data is called a *word*. Thus, the array contains $2^N$ $M$-bit words.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2036.png)

The figure shows a memory array with two address bits and three data bits. The two address bits specify one of the four rows (data words) in the array. Each data word is three bits wide. b) shows some possible contents of the memory array.

The *depth* of an array is the number of rows, and the *width* is the number of columns, also called the word size. The size of an array is given as *depth $\times$ width*. The figure is a 4-word $\times$ 3-bit array, or simply a $4\times3$ array. 

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2037.png)

The symbol for a 1024-word $\times$ 32-bit array is shown in the figure.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2038.png)

### Bit Cells

Memory arrays are built as an array of *bit cells*, each of which stores 1 bit of data. The figure shows that each bit cell is connected to a *wordline* and a *bitline*. For each combination of address bits, the memory asserts a single wordline that activates the bit cells in that row. When the wordline is HIGH, the stored bit transfers to or from the bitline. Otherwise, the bitline is disconnected from the bit cell. The circuitry to store the bit varies with memory type.

To read a bit cell, the bitline is initially left floating (Z). Then the wordline is turned ON, allowing the stored value to drive the bitline to 0 or 1. To write a bit cell, the bitline is strongly driven to the desired value. Then the wordline is turned ON, connecting the bitline to the stored bit. The strongly driven bitline overpowers the contents of the bit cell, writing the desired value into the stored bit.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2039.png)

### Organization

The figure shows the internal organization of a 4 $\times$ 3 memory array. Of course, practical memories are much larger, but the behavior of larger array can be extrapolated from the smaller array.

During a memory read, a wordline is asserted and the corresponding row of bit cells drives the bitlines HIGH or LOW. During a memory write, the bitlines are driven HIGH or LOW first and then a wordline is asserted, allowing the bitline values to be stored in that row of bit cells.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2040.png)

### Memory Ports

All memories have one or more *ports*. Each port gives read and/or write access to one memory address. The previous examples were all single-ported memories.

*Multiported* memories can access several addresses simultaneously. The figure shows a three-ported memory with two read ports and one write port. Port 1 reads the data from address A1 onto the read data output RD1. Port 2 reads the data from address A2 onto RD2. Port 3 writes the data from the write data input, WD3, into address A3 on the rising edge of the clock if the write enable, WE3, is asserted.

![Untitled](Digital%20Building%20Blocks%20a9eb32e4dadb41e0ab37a07362790d4d/Untitled%2041.png)

### Memory Types

Memory arrays are specified by their size (depth $\times$ width) and the number and type of ports. All memory arrays store data as an array of bit cells, but they differ in how they store bits.

Memories are classified based on how they store bits in the bit cell. The broadest classification is *random access memory (RAM)* versus *read only memory (ROM)*. RAM is *volatile*, meaning that it retains its data indefinitely, even without a power source.

RAM and ROM received their names for historical reasons that are no longer very meaningful. RAM is called *random* access memory because any data word is accessed with the same delay as any other. A sequential access memory, such as a tape recorder, accesses nearby data more quickly than faraway data.

ROM is called *read only* memory because, historically, it could only be read but not written. These names are confusing, because ROMs are randomly accessed too. Worse yet, most modern ROMs can be written as well as read! The important distinction to remember is that RAMs are volatile and ROMs are nonvolatile.

The two major types of RAMs are *dynamic RAM (DRAM)* and *static RAM (SRAM)*. Dynamic RAM stores data as a charge on a capacitor, whereas static RAM stores data using a pair of cross-coupled inverters. There are many flavors of ROMs that vary by how they are written and erased.

## Dynamic Random Access Memory

# Logic Arrays