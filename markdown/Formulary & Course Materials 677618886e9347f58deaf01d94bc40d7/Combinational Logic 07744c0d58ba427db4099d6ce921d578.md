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