# Introduction

# The Art of Managing Complexity

An important characteristic that separates an engineer or computer scientist from a normal programmer/developer is a systematic approach to managing complexity. Digital systems these days are built from billions of transistors, we would never be able to understand them by writing equations that describe the movement of electrons in a transistor and solving all of these equations simultaneously. The keyword here is abstraction.

## Abstraction

A system can be viewed from many levels of abstraction. Specifically in electronic computing systems we typically distinguish the following levels of abstraction:

In this course we focus on the levels of abstraction from digital circuits through computer architecture. When working on a level of abstraction it is always recommended to have knowledge of the levels just below and above. A computer scientist can not fully optimize code without understanding the architecture for which the program is written.

## Discipline

Discipline is the act of intentionally restricting design choices such that one can work more productively at a higher level of abstraction. Using interchangeable parts is a familiar application of discipline. By limiting our choices to digital circuits we can easily combine components into sophisticated systems that ultimately outperform equivalent systems built using analog components in many applications.

## The three Y’s

Additionally, designers use the three “y’s” to manage complexity:

- *hierarchy*: involves dividing a system into modules, then further subdividing each of these modules until the pieces are easy to understand.
- *modularity*: states that the modules have well-defined functions and interfaces, so that they connect together easily without unanticipated side effects.
- *regularity*: seeks uniformity among the modules. Common modules are reused many times, reducing the number of distinct modules that must be designed.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled.png)

# The Digital Abstraction

Most physical variables are continuous, especially in the realm of electrical engineering. Digital systems however represent information with *discrete-valued variables*, that is, variables with a finite number of distinct values.

The *amount of information* $D$ in a discrete valued variable with $N$ distinct states is measured in units of *bits* as 

$$
D = \log_2N \space \text{bits}.
$$

A binary variable conveys $\log_22=1$ bit of information. Of course, the word bit is short for binary digit. A continuous signal theoretically contains an infinite amount of information because it can take on an infinite number of values. In practice however, noise and measurement errors limit the information to only 10 to 16 bits for most continuous signals.

# Number Systems

In digital systems, binary or hexadecimal numbers are often more convenient than the base-10 number system.

## Decimal Numbers

Decimal digits are joined together to form longer decimal numbers. Each column of a decimal number has ten times the weight of the previous column. From right to left, the column weight are 1, 10, 100, 1000 and so on. Decimal numbers are referred to as *base* 10. The base is indicated by a subscript after the number to prevent confusion when working in more than one base.

An $N$-digit decimal number represents one of $10^N$ possibilities: $0,1,2,3,...,10^{N-1}$. This is called the *range* of the number.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%201.png)

## Binary Numbers

Bits represent one of two values, 0 or 1, and are joined together to form *binary numbers*. Each column of a binary number has twice the weight of the previous column, so binary numbers are *base 2*. In binary, the column weights are 1, 2, 3, 4, 16, 32, 64, 128 and so on.

An $N$-bit binary number represents one of $2^N$ possibilities, $0,1,2,3,...,2^{N-1}$.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%202.png)

## Hexadecimal Numbers

Writing long binary numbers becomes tedious and prone to error. A group of four bits represents one of $2^4=16$ possibilities. Hence, it is sometimes more convenient to work in *base 16*, called *hexadecimal*. Hexadecimal numbers use the digits 0 to 9 along with the letters A to F. Columns in base 16 have weights of $1, 16, 16^2,16^3$ and so on.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%203.png)

### Bytes, Nibbles, Words

A group of eight bits is called a *byte*. It represents one of $2^8 = 256$ possibilities. A group of four bits, or half a byte, is called a *nibble*. It represents one of $2^4=16$ possibilities. One hexadecimal digit stores one nibble and two hexadecimal digits store one full byte.

Microprocessors handle data in chunks called *words*. The size of a word depends on the architecture of the microprocessor.

Within a group of bits, the bit in the 1’s column is called the *least significant bit (lsb)* and the bit at the other end is called the *most significant bit (msb)*. Within a word, the bytes are identified as *least significant byte (LSB)* through *most significant byte (MSB)*.

By coincidence, $2^{10} = 1024 \approx 10^3$. Therefore the term *kilo* indicates $2^{10}$. Similarly, *mega* (million) indicates $2^{20} \approx 10^6$ and *giga* (billion) indicates $2^{30} \approx 10^9$.

1024 bytes is called a *kilobyte* (KB). 1024 bits is called a *kilobit* (Kb or Kbit). Similarly, MB, Mb, GB and Gb are used for millions and billions of bytes and bits. Memory capacity is usually measured in bytes. Communication speed is usually measured in bits/sec.

## Binary Addition

As in decimal addition, if the sum of two numbers is greater than what fits in a single digit, we *carry* a 1 into the next column. The bit that is carried over to the neighboring column is called the *carry bit*.

Digital systems usually operate on a fixed number of digits. Addition is said to *overflow* if the result is too big to fit in the available digits. overflow can be detected by checking for a carry out of the most significant column.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%204.png)

## Signed Binary Numbers

### Sign/Magnitude Numbers

*Sign/magnitude* numbers are intuitively appealing because they match our custom of writing negative numbers with a minus sign followed by the magnitude. An $N$-bit sign/magnitude number uses the most significant bit as the sign and the remaining $N - 1$ bits as the magnitude (absolute value). A sign bit of 0 indicates positive and a sign bit of 1 indicates negative.

Unfortunately, ordinary binary addition does not work for sign/magnitude numbers. For example, using ordinary addition on $-5_{10}+5_{10}$ gives $1101_2+0101_2 = 10010_2$, which is nonsense.

An $N$-bit sign/magnitude number spans the range $[-2^{N-1} + 1, 2^{N-1}-1]$. Sign/magnitude numbers are slightly odd in that both $+0$ and $-0$ exist. Both indicate zero.

### Two’s Complement Numbers

*Two’s complement* numbers are identical to unsigned binary numbers except that the most significant bit position has a weight of $-2^{N-1}$ instead of $2^{N-1}$. They overcome the shortcomings of sign/magnitude numbers: zero has a single representation, and ordinary addition works.

In two’s complement representation, zero is written as all zeros: $000..0_2$. The most positive number has a 0 in the most significant position and 1’s elsewhere: $0111111...1_2$. The most negative number has a 1 in the most significant position and o’s elsewhere: $100000...0_2 = -2^{N-1}$. -1 is written as all ones: $1111...1_2$.

The sign of a two’s complement number is reversed in a process called *taking the two’s complement*. The process consists of inverting all of the bits in the number, then adding 1 to the least significant bit position. This is useful to find the representation of a negative number or to determine the magnitude of a negative number.

Two’s complement numbers have the advantage that addition works properly for both positive and negative numbers. Recall that when adding $N$-bit numbers, the carry out of the $N$th bit is discarded.

Subtraction is performed by taking the two’s complement of the second number, then adding.

Unlike the sign/magnitude system, the two’s complement system has no separate -0.

In general, the range of an $N$-bit two’s complement number spans $[-2^{N-1}, 2^{N-1}-1]$. It should make sense that there is one more negative number than positive number because there is no -0.

The most negative number $100...000_2 = -2^{N-1}$ is sometimes called the *weird number*. Its two’s complement is found by inverting the bits (producing $01...111_2$) and adding 1, which produces $10...000_2$, the weird number, again. Hence, this negative number has no positive counterpart.

Adding two $N$-bit positive numbers or negative numbers may cause overflow if the result is greater than $2^{N-1} - 1$ or less than $-2^{N-1}$. Adding a positive number to a negative number never causes overflow. Unlike signed numbers, a carry out of the most significant column does not indicate overflow. Instead, overflow occurs if the two numbers being added have the same sign bit and the result has the opposite sign bit.

When a two’s complement number is extended to more bits, the sign bit must be copied into the most significant bit positions. This process is called *sign extension*. For example the numbers 3 and -3 are written as 4-bit two’s complement numbers 0011 and 1101 respectively. They are sign-extended to seven bits by copying the sign bit into the three new upper bits to form 0000011 and 1111101 respectively.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%205.png)

# Logic Gates

*Logic gates* are simple digital circuits that take one or more binary inputs and produce a binary output. Logic gates are drawn with a symbol showing the input (or inputs) and the output. Inputs are usually drawn to the left (or top) and outputs on the right (or bottom). Digital designers typically use letters near the beginning of the alphabet for gate inputs and the letter $Y$ for the gate output. The relationship between the inputs and the output can be described with a truth table or a boolean equation. A *truth table* lists inputs on the left and the corresponding output on the right. It has one row for each possible combination of inputs. A *Boolean equation* is a mathematical expression using binary variables.

## $\text{NOT}$ Gate

A $\text{NOT}$ gate has one input, $A$, and one output, $Y$, as shown.

The $\text{NOT}$ gate’s output is the inverse of its input. If $A$ is $\text{FALSE}$, then $Y$ is $\text{TRUE}$. If $A$ is $\text{TRUE}$, then $Y$ is $\text{FALSE}$. This relationship is summarized by the truth table and boolean equation in the figure. This gate is also called an *inverter*.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%206.png)

## Buffer

The other one-input logic gate is called a *buffer* as shown. From the logical point of view, a buffer is no different from a wire, so it might seem useless. However, from the analog point of view, the buffer might have desirable characteristics such as the ability to deliver large amounts of current to a motor, or the ability to quickly send its output to many gates. This is an example of why we need to consider multiple levels of abstraction to fully understand a system; the digital abstraction hides the real purpose of a buffer.

The triangle symbol indicates a buffer. A circle on the output is called a *bubble* and indicates inversion, as was seen in the $\text{NOT}$ gate symbol.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%207.png)

## $\text{AND}$ Gate

Two-input logic gates are more interesting. The $\text{AND}$ gate as shown produces a $\text{TRUE}$ output $Y$ if and only if both $A$ and $B$ are $\text{TRUE}$. Otherwise, the output is $\text{FALSE}$. By convention, the inputs are listed in the order you would count up in binary.

The Boolean equation for an $\text{AND}$ gate can be written in several ways: $Y = A \bullet B$, $Y = AB$ or $Y = A \cap B$.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%208.png)

## $\text{OR}$ Gate

The $\text{OR}$ gate as shown produces a $\text{TRUE}$ output $Y$, if either $A$ or $B$ (or both) are $\text{TRUE}$.

The Boolean equation for an $\text{OR}$ gate is written as $Y = A + B$ or $Y = A \cup B$.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%209.png)

## Other Two-Input Gates

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2010.png)

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2011.png)

## Multiple-Input Gates

Many Boolean functions of three or more inputs exist. The most common are $\text{AND}$, $\text{OR}$, $\text{XOR}$, $\text{NAND}$, $\text{NOR}$ and $\text{XNOR}$. An $N$-input $\text{AND}$ gate produces a $\text{TRUE}$ output when all $N$ inputs are $\text{TRUE}$. An $N$-input $\text{OR}$ gate produces a $\text{TRUE}$ output when at least one input is $\text{TRUE}$. An $N$-input $\text{XOR}$ gate is sometimes called a *parity* gate and produces a $\text{TRUE}$ output if an odd number of inputs are $\text{TRUE}$.

# Beneath the Digital Abstraction