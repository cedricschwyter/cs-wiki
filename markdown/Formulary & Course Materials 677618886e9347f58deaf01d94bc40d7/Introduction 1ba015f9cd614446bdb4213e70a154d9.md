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

A digital system uses discrete-valued variables. However, the variables are represented by continuous physical quantities such as the voltage on a wire, the position of a gear, or the level of fluid in a cylinder. hence, the designer must choose a way to relate the continuous variable to the discrete variable.

For example, consider representing a binary signal $A$ with a voltage on a wire. Let 0 volts (V) indicate $A = 0$ and 5 V indicate $A=1$. Any real system must tolerate some noise, so 4.97 V probably ought to be interpreted as $A=1$ as well. But what about 4.3 V? or 2.8 V?

## Supply Voltage

Suppose the lowest voltage in the system is 0 V, also called *ground* or GND. The highest voltage in the system comes from the power supply and is usually called $V_{DD}$. In 1970’s and 1980’s technology, $V_{DD}$ was generally 5 V. As chips have progressed to smaller transistors, $V_{DD}$ has dropped to 3.3 V, 2.5 V, 1.8 V, 1.5 V, 1.2 V or even lower to save power and avoid overloading the transistors.

## Logic Levels

The mapping of a continuous variable onto a discrete binary variable is done by defining *logic levels*, as shown.

The first gate is called the *driver* and the second gate is called the *receiver*. The output of the driver is connected to the input of the receiver. The driver produces a $\text{LOW}$ (0) output in the range of 0 to $V_{OL}$ or a $\text{HIGH}$ (1) output in the range of $V_{OH}$ to $V_{DD}$.

If the receiver gets an input in the range of 0 to $V_{IL}$, it will consider the input to be $\text{LOW}$. If the receiver gets an input in the range of $V_{IH}$ to $V_{DD}$, it will consider the input to be $\text{HIGH}$. If for some reason such as noise or faulty components, the receiver’s input should fall in the *forbidden zone* between $V_{IL}$ and $V_{IH}$, the behavior of the gate is unpredictable. $V_{OH}, V_{OL}, V_{IH}$ and $V_{IL}$ are called the output and input high and low logic levels.

## Noise Margins

Of course, the input and output levels must be chosen such that $V_{OL} \lt V_{IL}$ and $V_{OH} \gt V_{IH}$, otherwise the input of the receiver can not possibly be interpreted in a correct way. Thus, even if the output of the driver is contaminated by some noise, the input of the receiver will still detect the correct logic level. The *noise margin* is the amount of noise that could be added to a worst-case output such that the signal can still be interpreted as a valid input: 

$$
\begin{align*}
NM_L & = V_{IL}-V_{OL} \\
NM_H & = V_{OH} - V_{IL}
\end{align*}
$$

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2012.png)

## DC Transfer Characteristics

The *DC transfer characteristics* of a gate describe the output voltage as a function of the input voltage when the input is changed slowly enough that the output can keep up. They are called transfer characteristics because they describe the relationship between input and output voltages.

An ideal inverter would have an abrupt switching threshold at $\frac{V_{DD}}{2}$ as shown on the left.

A real inverter changes more gradually between the extremes, as shown on the right. When the input voltage $V(A)$ is 0, the output voltage $V(Y) = V_{DD}$. When $V(A) = V_{DD}$, $V(Y)=0$. However, the transition between these endpoints is smooth and may not be centered at exactly $\frac{V_{DD}}{2}$. This raises the question of how to define the logic levels.

A reasonable place to choose the logic levels is where the slope of the transfer characteristic $\frac{dV(Y)}{dV(A)}$ is -1. These two points are called the *unity gain points*. Choosing logic levels at unity gain points usually maximizes the noise margins. If $V_{IL}$ were reduced, $V_{OH}$ would only increase by a small amount. But if $V_{IL}$ were increased, $V_{OH}$ would drop precipitously.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2013.png)

## The Static Discipline

To avoid inputs falling into the forbidden zone, digital logic gates are designed to conform to the *static discipline*. The static discipline requires that, given logically valid inputs, every circuit element will produce logically valid outputs. By conforming to the static discipline, digital designers sacrifice the freedom of using arbitrary analog circuit elements in return for the simplicity and robustness of digital circuits. They raise the level of abstraction from analog to digital, increasing design productivity by hiding needless detail.

The choice of $V_{DD}$ and logic levels is arbitrary, but all gates that communicate must have compatible logic levels. Therefore, gates are grouped into *logic families* such that all gates in a logic family obey the static discipline when used with other gates in the family.

Four major logic families that predominated from the 1970’s through the 1990’s are *Transistor-Transistor Logic (TTL), Complementary Metal-Oxide-Semiconductor Logic (CMOS), Low Voltage TTL Logic (LVTTL)*, and *Low Voltage CMOS Logic (LVCMOS)*. Since then, logic families have balkanized with a profliferation of even lower power supply voltages.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2014.png)

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2015.png)

# CMOS Transistors

Modern computers use transistors because they are reliable, small and cheap.. *Transistors* are electrically controlled switches that turn ON or OFF when a voltage or current is applied to a control terminal. The two main types of transistors are *bipolar transistors* and *metal-oxide-semiconductor field effect transistors (MOSFETs)*.

MOSFETs are now the building blocks of almost all digital systems.

## Semiconductors

MOSFETs are built from silicon, the predominant atom in rock and sand. Silicon (Si) is a group IV element, so it has four electrons in its valence shell and forms bonds with four adjacent atoms, resulting in a crystalline lattice.

By itself, silicone is a poor conductor because all the electrons are tied up in covalent bonds. However, it becomes a better conductor when small amounts of impurities, called *dopant* atoms, are carefully added. If a group V dopant such as arsenic (As) is added, the dopant atoms have an extra electron that is not involved in the bonds and can therefore move about the lattice freely, leaving an ionized dopant atom (As+) behind. The electron carries a negative charse, so we call arsenic an *n-type* dopant. On the other hand, if a group III dopant such as boron (B) is addedm the dopant atoms are missing an electron. This missing electron is called a *hole*. An electron from a neighboring silicon atom may mmove over to fill the missing bond, forming an ionized dopant atom (B-) and leaving a hole at the neighboring silicon atom. In a similar fashion, the hole can migrate around the lattice. The hole is a lack of negative charge, so it acts like a positively charged particle. Hence, we call boron a *p-type* dopant. Because the conductivity of silicon changes over many orders of magnitude depending on the concentration of dopants, silicon is called a *semiconductor*.

## Diodes

The junction between p-type and n-type silicon is called a *diode*. The p-type region is called the *anode* and the n-type region is called the *cathode*.

When the voltage on the anode rises above the voltage on the cathode, the diode is *forward biased*, and current flows through the diode from the anode to the cathode. But when the anode voltage is lower than the voltage on the cathode, the diode is *reverse biased*, and no current flows.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2016.png)

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2017.png)

## Capacitors

A *capacitor* consists of two conductors separated by an insulator. When a voltage $V$ is applied to one of the conductors, the conductor accumulates electric *charge* $Q$ and the other conductor accumulates the opposite charge $-Q$, The *capacitance* $C$ of the capacitor is the ratio of charge to voltage: $C = \frac{Q}{V}$. The capacitance is proportional to the size of the conductors and inversely proportional to the distance between them. 

Capacitance is important, because charging or discharging a conductor takes time and energy. More capacitance means that a circuit will be slower and require more energy to operate.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2018.png)

## nMOS and pMOS Transistors

A MOSFET is a sandwich of several layers of conducting and insulating materials. MOSFETs are built on thin flat *wafers* of silicon of about 15 to 30 cm in diameter. The manufacturing process begins with a bare wafer.The process involves a sequence of steps in which dopants are implanted into the silicon, thin films of silicon dioxide and silicon are grown, and metal is deposited. Between each step, the wafer is *patterned* so that the materials only appear where they are desired. 

Because transistors are a fraction of a micron in length and the entire wafer is processed at once, it is inexpensive to manufacture billions of transistors at a time. Once processing is complete, the wafer is cut into rectangles called chips or dice that contain thousands, millions, or even billions of transistors. The chip is tested, then placed in a plastic or ceramic package with metal pins to connect it to a circuit board.

The MOSFET sandwich consists of a conducting layer called the *gate* on top of an insulating layer of *silicone dioxide* (SiO2) on top of the silicon wafer, called the *substrate*. Historically, the gate was constructed from metal, hence the name metal-oxide-semiconductor. modern manufacturing processes use polycrystalline silicon for the gate, because it does not melt during subsequent high-temperature processing steps. Silicon dioxide is better known as glass and is often simply called *oxide* in the semiconductor industry. The metal-oxide-semiconductor sandwich forms a capacitor, in which a thin layer of insulating oxide called a *dielectric* separates the metal and semiconductor plates.

There are two flavors of MOSFETs: nMOS and pMOS. The n-type transistors, called nMOS, have regions of n-type dopants adjacent to the gate called the *source* and the *drain* and are built on a p-type semiconductor substrate. The pMOS transistory are just the opposite, consisting of p-type source and drain regions in an n-type substrate.

A MOSFET behaves as a voltage-controlled switch in which the gate voltage creates an electric field that turns ON or OFF a connection between the source and drain. The term *field effect transistor* comes from this principle of operation.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2019.png)

The substrate of an nMOS transistor is normally tied to GND. Consider the situation when the gate is also at 0 V, as shown. The diodes between the source or drain and the substrate are reverse biased because the source or drain voltage is nonnegative. Hence, there is no path for current to flow between the source and drain, so the transistor is OFF. Consider the situation when the gate is tied to $V_{DD}$. as shown. When a positive voltage is applied to the top plate of a capacitor, it establishes an electric field that attracts positive charge on the top plate and negative charge to the bottom plate. If the voltage is sufficiently large, so much negative charge is attracted to the underside of the gate that the region *inverts* from p-type to effectively become n-type. This inverted region is called the *channel*. Now the transistor has a continuous path from the n-type source through the n-type channel to the n-type drain, so electrons can flow from source to drain. The transistor is ON. The gate voltage required to turn on a transistor is called the *threshold voltage*, $V_t$, and is typically 0.3 to 0.7 V.

pMOS transistors work just the opposite way. The substrate is tied to $V_{DD}$. When the gate is also at $V_{DD}$, the pMOS transistor is OFF. When the gate is at GND, the channel inverts to p-type and the pMOS transistor is ON.

However, MOSFETs are not perfect switches. nMOS transistors are excellent at passing 0’s, but very poor at passing 1’s. Specifically, when the gate of an nMOS transistor is at $V_{DD}$, the drain will only swing between 0 and $V_{DD} - V_t$. Similarily, pMOS transistory pass 1’s well, but 0’s poorly.

Considering both types of MOSFETs require both types of substrate, manufacturing processes typically start with a p-type wafer, then implant n-type regions called *wells* where the pMOS transistory will go. These processes that provide both flavors of transistors are called Complementary MOS, or CMOS. CMOS processes are used to build the vast majority of all transistors fabricated today.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2020.png)

To summarize, CMOS processes give us two types of electrically controlled switches, as shown. The voltage at the gate (g) regulates the flow of current between the source (s) and drain (d). nMOS transistors are OFF when the gate is 0 and ON when the gate is 1. pMOS transistors are ON when the gate is 0 and OFF when the gate is 1.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2021.png)

## CMOS $\text{NOT}$ Gate

The triangle indicates GND, the flat bar indicates $V_{DD}$. The nMOS transistor, $N1$, is conneected between GND and the $Y$ output. The pMOS transistor, $P1$, is connected between $V_{DD}$ and the $Y$ output. Both transistor gates are controlled by the input, $A$.

If $A = 0$, $N1$ is OFF and $P1$ is ON. Hence, $Y$ is connected to $V_{DD}$ but not to GND, and is pulled up to a logic 1. $P1$ passes a good 1. If $A = 1$, $N1$ is ON and $P1$ is OFF, and $Y$ is pulled down to a logic 0. $N1$ passes a good 0.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2022.png)

## Other CMOS Logic Gates

A two-input $\text{NAND}$ gate is displayed. In schematic diagrams, wires are always joined at three-way junctions. They are joined at four-way junctions only if a dot is shown. The nMOS transistors $N1$ and $N2$ are connected in series; both nMOS transistors must be ON to pull the output down to GND. The pMOS transistors $P1$ and $P2$ are in parallel; only one pMOS transistor must be ON to pull the output up to $V_{DD}$.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2023.png)

The figure shows a general form to construct any inverting logic gate, such as $\text{NOT}$, $\text{NAND}$ or $\text{NOR}$. nMOS transistors are good at passing 0’s, so a pull-down network of nMOS transistors is places between the output and GND to pull the output down to 0. pMOS transistors are good at passing 1’s, so a pull-up network of pMOS transistors is placed between the output and $V_{DD}$ to pull the output up to 1. The networks may consist of transistors in series or in parallel. When transistors are in parallel, the network is ON if either transistor is ON. When transistors are in series, the network is ON only if both transistors are ON. The slash across the input wire indicates that the gate may receive multiple inputs.

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled%2024.png)