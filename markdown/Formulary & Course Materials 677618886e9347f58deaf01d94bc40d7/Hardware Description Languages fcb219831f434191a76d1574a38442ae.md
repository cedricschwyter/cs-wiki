# Hardware Description Languages

# Introduction

Thus far we have focused on designing combinational and sequential digital circuits at the schematic level. The process of finding an efficient set of logic gates to perform a given function is labor intensive and error prone, requiring manual simplification of truth tables or Boolean equations and manual translation of finite state machines (FSMs) into gates. In the 1990’s, designers discovered that they were far more productive if they worked at a higher level of abstraction, specifying just the logical function and allowing a *computer-aided design (CAD)* tool to produce the optimized gates. The specifications are generally given in a *hardware description language (HDL)*. The two leading hardware description languages are *Verilog* and *VHDL*. We will focus on Verilog only.

## Modules

A block of hardware with inputs and outputs is called a *module*. An $\text{AND}$ gate, a multiplexer, and a priority circuit are all examples of hardware modules. The two general styles for describing module functionality are *behavioral* and *structural*. Behavioral models describe what a module does. Structural models describe how a module is built from simpler pieces; it is an application of hierarchy. The Verilog code in the example illustrates behavioral descriptions of a module that computes the Boolean function $Y = \bar{A}\bar{B}\bar{C}+A\bar{B}\bar{C}+A\bar{B}C$. The module is named `sillyfunction` and has three inputs `a`, `b` and `c`, and one output, `y`.

A Verilog module begins with the module name and a listing of the inputs and outputs. The `assign` statement describes combinational logic. `~` indicates $\text{NOT}$, `&` indicates $\text{AND}$ and `|` indicates $\text{OR}$.

Verilog signals such as the inputs and outputs are Boolean variables. They may also have floating and undefined values.  

```verilog
module sillyfunction (input a, b, c, 
											output y);
	assign y = ~a & ~b & ~c |
							a & ~b & ~c |
							a & ~b &  c;
endmodule
```

A module is a good application of modularity. It has a well defined interface, consisting of its inputs and outputs, and it performs a specific function. The particular way in which it is coded is unimportant to others that might use the module,by as long as it performs its function. 

## Language Origins

Verilog was developed by Gateway Design Automation as a proprietary language for logic simulation in 1984. Gateway was acquired by Cadence in 1989 and Verilog was made an open standard in 1990 under the control of Open Verilog International. The language became an IEEE standard in 1995 (IEEE STD 1364) and was updated in 2001.

## Simulation and Synthesis

The two major purposes of HDLs are logic *simulation* and *synthesis*. During simulation, inputs are applied to a module, and the outputs are checked to verify that the module operates correctly. During synthesis, the textual description of a module is transformed into logic gates.

### Simulation

Humans routinely make mistakes. Such errors in hardware design are called *bugs*. Eliminating bugs from a digital system is obviously important, especially when customers are paying money and lives depend on the correct operation. Testing a system in the laboratory is time-consuming. Discovering the cause of errors in the lab can be extremely difficult, because only signals routed to the chip pins can be observed. There is no way to directly observe what is happening inside a chip. Correcting errors after the system is built can be devastatingly expensive. For example, correcting a mistake in cutting-edge integrated circuits costs more than a million dollars and takes several months. Intel’s famous FDIV (floating point division) bug in the Pentium processor forced the company to recall chips after they had shipped, at a total cost of $475 million. Logic simulation is essential to test a system before it is built.

The figure shows waveforms from a simulation of the previous `sillyfunction` module demonstrating that the module works correctly. `y` is TRUE when `a`, `b` and `c` are 000, 100, or 101, as specified by the Boolean equation.

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled.png)

### Synthesis

Logic synthesis transforms HDL code into a *netlist* describing the hardware (e.g., the logic gates and the wires connecting them). The logic synthesizer might perform optimizations to reduce the amount of hardware required. The netlist may be a text file, or it may be drawn as a schematic to help visualize the circuit. The figure shows the results of synthesizing the `sillyfunction` module. Notice how the three three-input $\text{AND}$ gates are simplified into two two-input $\text{AND}$ gates using Boolean algebra.

CIrcuit descriptions in HDL resemble code in a programming language. However, one must remember that the code is intended to represent hardware. Verilog is a rich language with many commands. Not all of these commands can be synthesized into hardware. For example, a command to print results on the screen during simulation does not translate into hardware. Because our primary interest is to build hardware, we will emphasize a *synthesizable subset* of the language. Specifically, we will divide HDL code into *synthesizable* modules and a *testbench*. The synthesizable modules describe the hardware. The testbench contains code to apply inputs to a module, check whether the output results are correct, and print discrepancies between expected and actual outputs. Testbench code is intended only for simulation and cannot be synthesized.

HDLs have specific ways of describing various classes of logic; these ways are called *idioms*.

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%201.png)

# Combinational Logic

## Bitwise Operators

*Bitwise* operators act on single-bit signals or on multi-bit busses. For example, the `inv` module shown describes four inverters connected to 4-bit busses.

`a[3:0]` represents a 4-bit bus. The bits, from most significant to least significant, are `a[3]`, `a[2]`, `a[1]`, `a[0]`. This is called *little-endian* order because the least significant byte has the smallest bit number. 

We could also have used `a[0:3]`, in which case the bits, from most significant to least significant, would be `a[0]`, `a[1]`, `a[2]` and `a[3]`. This is called *big-endian* order.

The endianness of a bus is purely arbitrary. Indeed, endianness is also irrelevant to this example, because a bank of inverters doesn’t care what the order of the bits are. Endianness matters only for operators, such as addition, where the sum of one column carries over into the next. Either ordering is acceptable, as long as it is used consistently. We will consistently use the little-endian order, `[N-1:0]` in Verilog for an $N$-bit bus.

```verilog
module inv (input  [3:0] a,
						output [3:0] y);
	assign y = ~a;
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%202.png)

The `gates` module in this example demonstrates bitwise operations acting on 4-bit busses for other basic logic functions. 

`~`, `^`, and `|` are examples of Verilog *operators*, whereas `a`, `b`, and `y1` are *operands*. A combination of operators and operands, such as `a & b`, or `~(a | b)`, is called an *expression*. A complete command such as `assign y4 = ~(a & b);` is called a *statement*. 

`assign out = in1 op in2;` is called a *continuous assignment statement*. Continuous assignment statements end with a semicolon. Anytime the inputs on the right side of the `=` in a continuous assignment statement change, the output on the left side is recomputed. Thus, continuous assignment statements describe combinational logic.

```verilog
module gates (input  [3:0] a, b,
							output [3:0] y1, y2,
													 y3, y4, y5);
	assign y1 = a & b; // AND
	assign y2 = a | b; // OR
	assign y3 = a ^ b; // XOR
	assign y4 = ~(a & b); // NAND
	assign y5 = ~(a | b); // NOR
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%203.png)

## Comments and White Space

The `gates` example showed how to format comments. Verilog is not picky about the use of white space. Nevertheless, proper indenting and use of blank lines is helpful to make nontrivial designs readable. Be consistent in your use of capitalization and underscores in signal and module names. Module and signal names must not begin with a digit.

Verilog comments are just like those in C or Java. Comments beginning with `/*` continue, possibly across multiple lines, to the next `*/`. Comments beginning with `//` continue to the end of the line.

Verilog is case-sensitive. `y1` and `Y1` are different signals in Verilog.

## Reduction Operators

Reduction operators imply a multiple-input gate acting on a single bus. The example describes an eight-input $\text{AND}$ gate with inputs `a_7, a_6,...,a_0`. 

As one would expect, `|`, `^`, `~&`, and `~|` reduction operators are available for $\text{OR}$, $\text{XOR}$, $\text{NAND}$, and $\text{NOR}$ as well. Recall that a multi-input $\text{XOR}$ performs parity, returning TRUE if an odd number of inputs are TRUE.

```verilog
module and8 (input  [7:0] a,
						 output       y);
	assign y = &a;
	// &a is much easier to write than
	// assign y = a[7] & a[6] & a[5] & a[4] &
	//            a[3] & a[2] & a[1] & a[0];
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%204.png)

## Conditional Assignment

*Conditional assignments* select the output from among alternatives based on an input called the *condition*. The example illustrates a 2:1 multiplexer using conditional assignment.

The *conditional operator* `?:` chooses, based on a first expression, between a second and third expression. The first expression is called the *condition*. If the condition is 1, the operator chooses the second expression. If the condition is 0, the operator chooses the third expression.

`?:` is especially useful for describing a multiplexer because, based on the first input, it selects between two others. The example code demonstrates the idiom for a 2:1 multiplexer with 4-bit inputs and outputs using the conditional operator.

```verilog
module mux2 (input  [3:0] d0, d1,
						 input        s,
						 output [3:0] y);
	assign y = s ? d1 : d0;
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%205.png)

# Structural Modeling

# Sequential Logic

# More Combinational Logic

# Finite State Machines

# Parameterized Modules

# Testbenches