# Combinational Logic

# Introduction

A *circuit* in digital electronics is a network that processes discrete-valued variables. A circuit can be viewed as a black box, as shown, with 

- one or more discrete-valued *input terminals*
- one or more discrete-valued *output terminals*
- a *functional specification* describing the relationship between inputs and outputs
- a *timing specification* describing the delay between inputs changing and outputs responding

Inside the black box, circuits are composed of nodes and elements. An *element* is itself a circuit with inputs, outputs and a specification. A *node* is a wire, whose voltage conveys a discrete-valued variable. Nodes are classified as *input, output* or *internal*. Inputs receive values from the external world, outputs deliver values to the external world. Wires that are not input or outputs are called internal nodes.

The figure illustrates a circuit with three elements, E1, E2 and E3, and six nodes. Nodes $A$, $B$ and $C$ are inputs. $Y$ and $Z$ are outputs. n1 is an internal node between E1 and E3.

Digital circuits are classified as *combinational* or *sequential*. A combinational circuit’s outputs depend only on the current values of the inputs; in other words, it combines the current input values to compute the output. For example a logic gate is a combinational circuit. A sequential circuit’s outputs depend on both current and previous values of the inputs; in other words, it depends on the input sequence; a sequential circuit has *memory*, a combinational circuit does not.

The functional specification of a combinational circuit expresses the output values in terms of the current input values. The timing specification of a combinational circuit consists of lower and upper bounds on the delay from input to output.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled.png)

The figure shows a combinational circuit with two inputs $A$ and $B$ and one output $Y$. The symbol inside the box indicates that it is implemented using only combinational logic. In this example, the function, $F$, is specified to be $\text{OR}$: $Y = F(A,B) = A + B$.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%201.png)

The figure shows a combinational circuit with multiple outputs. This particular combinational circuit is called a *full adder*. The two equations specify the function of the outputs, $S$ and $C_{\text{out}}$, in terms of the inputs, $A$, $B$ and $C_{\text{in}}$.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%202.png)

To simplify drawings, we often use a single line with a slash through it and a number next to it to indicate a *bus*, a bundle of multiple signals. The number specifies how many signals are in the bus.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%203.png)

The rules of *combinational composition* tell us how we can build a large combinational circuit from smaller combinational circuit elements. A circuit is combinational if it consists of interconnected circuit elements such that 

- every circuit element is itself combinational
- every node of the circuit is either designated as an input to the circuit or connects to exactly one output terminal of a circuit element
- the circuit contains no cyclic paths: every path through the circuit visits each circuit node at most once.

Large circuits such as microprocessors can be very complicated, so we use the principles of abstraction and modularity to manage the complexity. Building the circuit out of smaller circuit elements is an application of hierarchy. The rules of combinational composition are an application of discipline.

The functional specification of a combinational circuit is usually expressed as a truth table or a Boolean equation. In the following, we describe how to derive a Boolean equation from any truth table and how to use Boolean algebra and Karnaugh maps to simplify equations.

# Boolean Equations

## Terminology

Refer to [Mathematical Reasoning, Proofs, and a First Approach to Logic](Mathematical%20Reasoning,%20Proofs,%20and%20a%20First%20Approa%20d1206e601cf04e00bef78613383232cc.md) as well.

The *complement* of a variable, $A$, is its inverse, $\overline{A}$. The variable or its complement is called a *literal*. We call $A$ the *true form*, and $\overline{A}$ the *complementary form* of the variable.

The $\text{AND}$ of one or more literals is called a *product* or an *implicant*. A *minterm* is a product involving all of the inputs to the function. Similarily, the $\text{OR}$ of one or more literals is called a *sum*. A *maxterm* is a sum involving all of the inputs to the function.

The *order of operations* is important when interpreting Boolean equations. In Boolean equations, $\text{NOT}$ has the highest *precedence*, followed by $\text{AND}$, then $\text{OR}$. As with ordinary arithmetic, products are computed before sums.

## Sum-of-Products Form

A truth table of $N$ inputs contains $2^N$ rows. Each row in a truth table is associated with a minterm that is TRUE for that row. We can write a Boolean equation for any truth table by summing each of the minterms for which the output is TRUE. 

This is called the *sum-of-products canonical form* of a function.

Please refer to disjunctive normal forms as discussed in [Logic](Logic%20be320d1ae5984d0b85fd2f8c7af71ee5.md).

## Product-of-Sums Form

Each row of a truth table corresponds to a maxterm that is FALSE for that row. We can write a Boolean equation for any truth table as the $\text{AND}$ of each of the maxterms for which the output is FALSE.

This is called the *product-of-sums canonical form*.

Please refer to conjunctive normal forms as discussed in [Logic](Logic%20be320d1ae5984d0b85fd2f8c7af71ee5.md).

# Boolean Algebra

## Axioms

We can use *Boolean algebra* to simplify Boolean equations.

Boolean algebra is based on a set of axioms that we assume are correct. From these axioms, we prove all the theorems of Boolean algebra. These theorems have great practical significance, because they teach us how to simplify logic to produce smaller and less costly circuits.

Axioms and theorems of Boolean algebra obey the principle of *duality*. If the symbols 0 and 1 and the operators $\bullet$ ($\text{AND}$) and $+$ ($\text{OR}$) are interchanged, the statement will still be correct. We use the prime (’) symbol to denote the *dual* of a statement.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%204.png)

## Theorems of One Variable

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%205.png)

## Theorems of Several Variables

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%206.png)

According to De Morgan’s theorem, a $\text{NAND}$ gate is equivalent to an $\text{OR}$ gate with inverted inputs. Similarly, a $\text{NOR}$ gate is equivalent to an $\text{AND}$ gate with inverted inputs, as shown. The two symbols shown for the functions are called *duals*. They are logically equivalent and can be used interchangeably.

The inversion circle is called a *bubble*. Intuitively, one can imagine that “pushing” a bubble through the gate causes it to come out at the other side and flips the body of the gate from $\text{AND}$ to $\text{OR}$ or vice versa. The rules for bubble pushing are:

- pushing bubbles backward (from the output) or forward (from the inputs) changes the body of the gate from $\text{AND}$ to $\text{OR}$ or vice versa
- pushing a bubble from the output back to the inputs puts bubbles on all gate inputs
- pushing bubbles on *all* gate inputs forward toward the output puts a bubble on the output.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%207.png)

 

## The Truth Behind It All

In Boolean algebra, proofs of theorems with a finite number of variables are easy: just show that the theorem holds for all possible values of these variables. This method is called *perfect induction* and can be done with a truth table.

## Simplifying Equations

The theorems of Boolean algebra can be used to simplify Boolean equations.

How far can an equation be simplified? We define an equation in sum-of-products form to be *minimized* if it uses the fewest possible implicants. If there are several equations with the same number of implicants, the minimal one is the one with the fewest literals.

An implicant is called a *prime implicant* if it cannot be combined with any other implicants to form a new implicant with fewer literals. The implicants in a minimal equation must all be prime implicants as otherwise, they could be combined to reduce the number of literals.

Although a bit counterintuitive, *expanding* an implicant is sometimes useful in minimizing equations. By doing this, one can repeat one of the expanded minterms to be combined with another minterm.

Simplifying a Boolean equation with the theorems of Boolean algebra can take some trial and error. Using Karnaugh maps we can find a more methodical technique to make the process easier.

# From Logic To Gates

A *schematic* is a diagram of a digital circuit showing the elements and the wires that connect them together. For example, the schematic shown describes a possible hardware implementation of the function $Y = \bar{A} \bar{B} \bar{C} + A \bar{B}\bar{C} + A \bar{B} C$.

The following guidelines apply: 

- inputs are on the left (or top) side of a schematic
- outputs are on the right (or bottom) side of a schematic
- whenever possible, gates should flow from left to right
- straight wires are better to use than wires with multiple corners
- wires always connect at a T junction
- a dot where wires cross indicates a connection between the wires
- wires crossing *without* a dot make no connection

Any Boolean equation in sum-of-products form can be drawn as a schematic in a systematic way. First, draw columns for the inputs. Place inverters in adjacent columns to provide the complementary inputs if necessary. Draw rows of $\text{AND}$ gates for each of the minterms. Then, for each output, draw an $\text{OR}$ gate connected to the minterms related to that output. This style is called a *programmable logic array (PLA)* because the inverters, $\text{AND}$ gates and $\text{OR}$ gates are arrayed in a systematic fashion.

By taking advantage of inverting gates, sometimes the number of gates can be reduced even further. Depending on the implementation technology, it may be cheaper to use the fewest gates or to use certain types of gates in preference to others. For example, $\text{NAND}$s and $\text{NOR}$s are preferred over $\text{AND}$s and $\text{OR}$s in CMOS implementations.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%208.png)

# Multilevel Combinational Logic

Logic in sum-of-products form is called *two-level logic* because it consists of literals connected to a level of $\text{AND}$ gates connected to a level of $\text{OR}$ gates. Oftentimes, we build circuits with more than two levels of logic gates. These multilevel combinational circuits may use less hardware than their two-level counterparts. Bubble pushing is especially helpful in analyzing and designing multilevel circuits.

## Hardware Reduction

Some logic functions require an enormous amount of hardware when built using two-level logic. A notable example is the $\text{XOR}$ function of multiple variables.

An eight input $\text{XOR}$ would require 128 eight-input $\text{AND}$ and one 128-input $\text{OR}$ gate for a two-level sum-of-products implementation. A much better option is to use a tree of two-input $\text{XOR}$ gates, as shown.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%209.png)

Already, a three-input $\text{XOR}$ built with two-level logic would require more individual gates than the above 128-input variant, as shown.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2010.png)

Selecting the best multilevel implementation of a specific logic function is not a simple process. Moreover, “best” is dependent on design goals and requirements. For example, we have been using $\text{AND}$s and $\text{OR}$s, but in CMOS, $\text{NAND}$s and $\text{NOR}$s are more efficient.

## Bubble Pushing

Guidelines:

- begin at the output of the circuit and work towards the inputs
- push any bubbles on the final output back towards the inputs so that you can read an equation in terms of the output $Y$, instead of the complement $\bar{Y}$
- working backward, draw each gate in a form so that bubbles cancel. If the current gate has an input bubble, draw the preceding gate with an output bubble. If the current gate does not have an input bubble, draw the preceding gate without an output bubble.

An example is shown.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2011.png)

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2012.png)

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2013.png)

# X’s and Z’s

[https://www.notion.so](https://www.notion.so)

Boolean algebra is limited to 0’s and 1’s. However, real circuits can also have illegal and floating values, represented symbolically by X and Z.

## Illegal Value: X

The symbol X indicates that the circuit node has an *unknown* or *illegal* value. This commonly happens if it is being driven to both 0 and 1 at the same time. This situation, as shown, is called *contention* and is considered to be an error that must be avoided. The actual voltage on a node with contention may be somewhere between 0 and $V_{DD}$, depending on the relative strengths of the gates driving HIGH and LOW. Oftentimes, the value is in the forbidden zone. Contention can also cause large amounts of power to flow between the fighting gates, resulting in the circuit getting hot and possibly damaged.

X values are also sometimes used by circuit simulators to indicate an uninitialized value. Digital designers also use the symbol X to indicate “don’t care” values in truth tables.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2014.png)

## Floating Value: Z

The symbol Z indicates that a node is being driven neither HIGH nor LOW. The node is said to be *floating, high impedance*, or *high Z*. A floating node does not always mean there is an error in the circuit, so long as some other circuit element does drive the node to a valid logic level when the value of the node is relevant to circuit operation.

The *tristate buffer*, as shown, has three possible output states: HIGH (1), LOW (0) and floating (Z). The tristate buffer has an input, $A$, an output, $Y$, and an *enable*, $E$. When the enable is TRUE, the tristate buffer acts as a simple buffer, transferring the input value to the output. When the enable is FALSE, the output is allowed to float ($Z$).

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2015.png)

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2016.png)

Tristate buffers are commonly used on *busses* that connect multiple chips. For example, a microprocessor, a video controller, and an Ethernet controller might all need to communicate with the memory system in a personal computer. Each chip can connect to a shared memory bus using tristate buffers, as shown.

Only one chip at a time is allowed to assert its enable signal to drive a value onto the bus. The other chips must produce floating outputs so that they do not cause contention with the chip talking to the memory. Any chip can read the information from the shared bus at any time. Such tristate busses were once common, nowadays however higher speeds are possible with *point-to-point links*, in which chips are connected to each other directly rather than over a shared bus.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2017.png)

# Karnaugh Maps

*Karnaugh maps (K-maps)* are a graphical method for simplifying Boolean equations. K-maps work well for problems with up to four variables. Recall that logic minimization involves combining terms. Two terms containing an implicant, $P$, and the true and complementary forms of some variable $A$ are combined to eliminate $A$: $PA + P\bar{A} = P$. Karnaugh maps make these combinable terms easy to see by putting them next to each other in a grid.

An example for a three-input function is shown. The top row of the K-map gives the four possible values for the $A$ and $B$ inputs. The left column gives the two possible values for the $C$ input. Each square in the K-map corresponds to a row in the truth table and contains the value of the output, $Y$, for that row. For example, the top left square corresponds to the first row in the truth table and indicates that the output value $Y = 1$ when $ABC = 000$. Just like each row in a truth table, each square in a K-map represents a single minterm, as seen in c).

Each square, or minterm, differs from an adjacent square by a change in a single variable. This means that adjacent squares share all the same literals except one, which appears in true form in one square and in complementary form in the other.

The $A$ and $B$ combinations in the top row are in Gray code order. More about Gray codes here: [Hamiltonian Cycle in a Hypercube: Gray-Code](Graphs%20(TODO)%20b149fa35dff041fb8a659592d3f9c6bd/Hamiltonian%20Cycle%20in%20a%20Hypercube%20Gray-Code%201e5ecb970a794ec7baa9a405b7023363.md). Gray code order differs from ordinary binary order in that adjacent entries differ only in a single variable. Hence, writing the combinations in binary order would not have produced our desired property of adjacent squares differing only in one variable.

The K-map also “wraps around”. The squares on the far right are effectively adjacent to the squares on the far left, in that they differ only in one variable. Same holds for top and bottom.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2018.png)

## Circular Thinking

In the above K-map, only two minterms are present in the equation as indicated by the 1’s in the left column. Reading the minterms from the K-map is exactly equivalent to reading equations in sum-of-products from directly from the truth table.

K-maps help us simplify Boolean equations in sum-of-products form. Let $Y = \bar{A}\bar{B}\bar{C} + \bar{A}\bar{B}C = \bar{A}\bar{B}(\bar{C}+C) = \bar{A}\bar{B}$. By *circling* 1’s in the adjacent squares, as shown, we can identify minterms that can be simplified. For each circle, we write the corresponding implicant. Variables whose true *and* complementary forms are both in the circle are excluded from the implicant. In this case, the variable $C$ has both its true form and its complementary form in the circle, so we do not include it in the implicant. So the implicant is $\bar{A}\bar{B}$. This K-map gives the same answer we reached using Boolean algebra.

## Logic Minimization with K-Maps

K-maps provide an easy visual way to minimize logic. Simply circle all the rectangular blocks of 1’s in the map, using the fewest possible number of circles. Each circle should be as large as possible. Then read off the implicants that were circled. More formally, recall that a Boolean equation is minimized when it is written as a sum of the fewest number of prime implicants. Each circle on the K-map represents an implicant. The largest possible circles are prime implicants.

For example, in the figure shown, $\bar{A}\bar{B}\bar{C}$ and $\bar{A}\bar{B}C$ are implicants, but *not* prime implicants. Only $\bar{A}\bar{B}$ us a prime implicant in that K-map. Rules for finding a minimized equation from a K-map are as follows:

- use the fewest circles necessary to cover all the 1’s
- all the squares in each circle must contain 1’s
- each circle must span a rectangular block that is a power of 2 squares in each direction
- each circle should be as large as possible
- a circle may wrap around the edges of the K-map
- a 1 in a K-map may be circled multiple times if doing so allows fewer circles to be used.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2019.png)

## Don’t Cares

Recall that “don’t care” entries for truth table inputs were introduced to reduce the number of rows in the table when some variables do not affect the output. They are indicated by the symbol X, which means that the entry can be either 0 or 1.

Don’t cares also appear in truth table outputs where the output value is unimportant or the corresponding input combination can never happen, such outputs can be treated as either 0’s or 1’s at the designer’s discretion.

In a K-map, X’s allow for even more logic minimization. They can be circled if they help cover the 1’s with fewer or larger circles, but they do not have to be circled if they are not helpful.

## The Big Picture

Boolean algebra and Karnaugh maps are two methods for logic simplification. Ultimately, the goal is to find a low-cost method of implementing a particular logic function.

In modern engineering practice, computer programs called *logic synthesizers* produce simplified circuits from a description of the logic function. For large problems, logic synthesizers are much more efficient than humans. For small problems, a human with a bit of experience can find a good solution by inspection.

# Combinational Building Blocks

Combinational logic is often grouped into larger building blocks to build more complex systems. This is an application of the principle of abstraction, hiding the unnecessary gate-level details to emphasize the function of the building block.

## Multiplexers

*Multiplexers* are among the most commonly used combinational circuits. They choose an output from among several possible inputs based on the value of a *select* signal. A multiplexer is sometimes affectionately called a *mux*.

### 2:1 Multiplexer

A schematic and truth table for a 2:1 multiplexer with two data inputs, $D_0$ and $D_1$, a select input, $S$, and one output, $Y$, is shown. The multiplexer chooses between the two data inputs based on the select: if $S = 0$, $Y = D_0$ and if $S = 1$, $Y = D_1$. $S$ is also called a *control signal* because it controls what the multiplexer does.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2020.png)

A 2:1 multiplexer can be built from sum-of-products logic as shown. The Boolean equation for the multiplexer may be derived with a Karnaugh map or read off by inspection.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2021.png)

Alternatively, multiplexers can be built from tristate buffers, as shown. The tristate enables are arranged such that, at all times, exactly one tristate buffer is active.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2022.png)

### Wider Multiplexers

A 4:1 multiplexer has four data inputs and one output, as shown. Two select signals are needed to choose among the four data inputs. The 4:1 multiplexer can be built using sum-of-products logic, tristates, or multiple 2:1 multiplexers, as shown.

The product terms enabling the tristates can be formed using $\text{AND}$ gates and inverters. They can also be formed using a decoder, which will be introduced later.

Wider multiplexers, such as 8:1 and 16:1 multiplexers, can be built by expanding the methods shown on the right. In general, an $N$:1 multiplexer needs $\log_2N$ select lines. Again, the best implementation choice depends on the target technology.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2023.png)

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2024.png)

### Multiplexer Logic

Multiplexers can be used as *lookup tables* to perform logic functions. We show a 4:1 multiplexer used to implement a two-input $\text{AND}$ gate. The inputs, $A$ and $B$, serve as select lines. The multiplexer data inputs are connected to 0 or 1 according to the corresponding row of the truth table. In general, a $2^N$-input multiplexer can be programmed to perform any $N$-input logic function by applying 0’s and 1’s to the appropriate data inputs. Indeed, by changing the data inputs, the multiplexer can be reprogrammed to perform a different function.

With a little cleverness, we can cut the multiplexer size in half, using only a $2^{N-1}$ input multiplexer to perform any $N$-input logic function.The strategy is to provide one of the literals, as well as 0’s, and 1’s, to the multiplexer data inputs.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2025.png)

To illustrate, we show two-input $\text{AND}$ and $\text{XOR}$ functions implemented with 2:1 multiplexers.  We start with an ordinary truth table, and then combine pairs of rows to eliminate the rightmost input variable by expressing the output in terms of this variable. We then use the multiplexer as a lookup table according to the new, smaller truth table.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2026.png)

## Decoders

A decoder has $N$ inputs and $2^N$ outputs. It asserts exactly one of its outputs depending on the input combination. We show a 2:4 decoder. The outputs are called *one-hot,* because exactly one is “hot” (HIGH) at a given time.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2027.png)

### Decoder Logic

Decoders can be combined with $\text{OR}$ gates to build logic functions. We show the two-input $\text{XNOR}$ function using a 2:4 decoder and a single $\text{OR}$ gate. Because each output of a decoder represents a single minterm, the function is built as the $\text{OR}$ of all the minterms in the function. In the example, $Y = \bar{A}\bar{B} + AB = \overline{A \oplus B}$.

When using decoders to build logic, it is easiest to express functions as a truth table or in canonical sum-of-products from. An $N$-input function with $M$ 1’s in the truth table can be built with an $N$:$2^N$ decoder and an $M$-input $\text{OR}$ gate attached to all of the minterms containing 1’s in the truth table. This concept will later be applied to the buildig of Read Only Memories (ROMs).

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2028.png)

# Timing

One of the most challenging issues in circuit design is *timing*; making a circuit run fast*.*

An output takes time to change in response to an input change. We show the *delay* between an input change and the subsequent output change for a buffer. The figure is called a *timing diagram*; it portrays the *transient response* of the buffer circuit when an input changes. The transition from LOW to HIGH is called the *rising edge*. Similarly, the transition from HIGH to LOW is called the *falling edge*. The blue arrow indicates that the rising edge of $Y$ is caused by the rising edge of $A$. We measure delay from the *50% point* of the input signal, $A$, to the 50% point of the output signal, $Y$. The 50% point is the point at which the signal is half-way between its LOW and HIGH values as it transitions.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2029.png)

## Propagation and Contamination Delay

Combinational logic is characterized by its *propagation delay* and *contamination delay*. The propagation delay, $t_{pd}$, is the maximum time from when an input changes until the output or outputs reach their final value. The contamination delay, $t_{cd}$, is the minimum time from when an input changes until any output starts to change its value.

We illustrate a buffer’s propagation delay and contamination delay in blue and gray, respectively. The figure shows that $A$ is initially either HIGH or LOW and changes to the other state at a particular time; we are interested only in the fact that it changes, not what value it has. In response, $Y$ changes some time later. The arcs indicate that $Y$ may start to change $t_{cd}$ after $A$ transitions and that $Y$ definitely settles to its new value within $t_{pd}$.

The underlying causes of delay in circuits include the time required to charge the capacitance in a circuit and the speed of light. $t_{pd}$ and $t_{cd}$ may be different for many reasons, including

- different rising and falling delays
- multiple inputs and outputs, some of which are faster than others
- circuits slowing down when hot and speeding up when cold.

Calculating $t_{pd}$ and $t_{cd}$ requires delving into the lower levels of abstraction. However, manufacturers normally supply data sheets specifying these delays for each gate.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled%2030.png)

Along with the factors already listed, propagation and contamination delays are also determined by the *path* a signal takes from input to output. We show a four-input logic circuit. The *critical path*, shown in blue, is the path from input