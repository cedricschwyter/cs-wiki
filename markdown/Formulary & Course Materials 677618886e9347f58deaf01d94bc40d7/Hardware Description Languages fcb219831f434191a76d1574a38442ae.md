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

This example shows a 4:1 multiplexer based on the same principle as the 2:1 multiplexer in the previous example. 

The synthesized circuit’s multiplexer in the schematic has multiple data and one-hot enable inputs. When one of the enables is asserted, the associated data is passed to the output.

if `s[1]` is 1, then the multiplexer chooses the first expression, `(s[0] ? d3 : d2)`. This expression in turn chooses either `d3` or `d2` based on `s[0]` (`y = d3` if `s[0]` is 1 and `d2` if `s[0]` is 0). If `s[1]` is 0, then the multiplexer similarly chooses the second expression, which gives either `d1` or `d0` based on `s[0]`.

```verilog
module mux4 (input  [3:0] d0, d1, d2, d3,
						 input  [1:0] s,
						 output [3:0] y);
	assign y = s[1] ? (s[0] ? d3 : d2)
									: (s[0] ? d1 : d0);
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%206.png)

## Internal Variables

Often it is convenient to break a complex function into intermediate steps. 

A full adder for example is a circuit with three inputs and two outputs defined by the following equations: 

$$
\begin{align*}
S & = A \oplus B \oplus C_{\text{ín}} \\
C_{\text{out}} & = AB + AC_{\text{in}} + BC_{\text{in}}
\end{align*}
$$

If we define intermediate signals, $P$ and $G$,

$$
\begin{align*}
P &= A \oplus B \\
G &= AB
\end{align*}
$$

we can rewrite the full adder as follows: 

$$
\begin{align*}
S &= P \oplus C_{\text{in}} \\
C_{\text{out}} &= G + PC_{\text{in}}
\end{align*}
$$

$P$ and $G$ are called *internal variables*, because they are neither inputs nor outputs but are used only internal to the module. The example shows how they are used in HDLs.

HDL assignment statements take place concurrently. In an HDL, the order does not matter. Like hardware, HDL assignment statements are evaluated any time the inputs, signals on the right hand side, change their value, regardless of the order in which the assignment statements appear in a module.

In Verilog, *wires* are used to represent internal variables whose values are defined by `assign` statements such as `assign p = a ^ b;` Wires technically have to be declared only for multibit busses, but it is good practice to include them for all internal variables; their declaration could have been omitted in this example.

```verilog
module fulladder (input  a, b, cin,
									output s, cout);
	wire p, g;
	assign p  a  b;
	assign g  a & b;
	assign s  p  cin;
	assign cout  g | (p & cin);
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%207.png)

## Precedence

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%208.png)

## Numbers

Numbers can be specified in a variety of bases. Underscores in numbers are ignored and can be helpful in breaking long numbers into more readable chunks.

Verilog numbers can specify their base and size (the number of bits used to represent them). The format for declaring constants is `N'Bvalue`, where `N` is the size in bits, `B` is the base, and `value` gives the value. For example `9'h25` indicates a 9-bit number with a value of $25_{16} = 37_{10} = 000100101_2$. Verilog supports `'b` for binary, `'o` for octal, `'d` for decimal and `'h` for hexadecimal. If the base is omitted, the base defaults to decimal.

If the size is not given, the number is assumed to have as many bits as the expression in which it is being used. Zeros are automatically padded on the front of the number to bring it up to full size. For example, if `w` is a 6-bit bus, `assign w = 'b11` gives `w` the value 000011. It is better practice to explicitly give the size.

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%209.png)

## Z’s and X’s

HDLs use `z` to indicate a floating value. `z` is particularly useful for describing a tristate buffer, whose output floats when the enable is 0. The example shows the idiom for a tristate buffer. If the buffer is enabled, the output is the same as the input. If the buffer is disabled, the output is assigned a floating value. 

```verilog
module tristate (input  [3:0] a,
								 input        en,
                 output [3:0] y),
	assign y = en ? a : 4'bz;
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2010.png)

Similarly, HDLs use `x` to indicate an invalid logic level. If a bus is simultaneously driven to 0 and 1 by two enabled tristate buffers (or other gates), the result is `x`, indicating contention. If all the tristate buffers driving a bus are simultaneously OFF, the bus will float, indicated by `z`. 

At the start of simulation, state nodes such as flip-flop outputs are initialized to an unknown state. This is helpful to track errors caused by forgetting to reset a flip-flop before its output is used.

If a gate receives a floating input, it may produce an `x` output when it can’t determine the correct output value. Similarly, if it receives an illegal or uninitialized input, it may produce an `x` output. The example shows how Verilog combines these different signal values in logic gates.

Verilog signal values are `0`, `1`, `z` and `x`. Verilog constants starting with `z` or `x` are padded with leading `z`'s or `x`'s (instead of 0’s) to reach their full length when necessary.

The table shows a truth table for an $\text{AND}$ gate using all four possible signal values. Note that the gate can sometimes determine the output despite some inputs being unknown. For example `0 & z` returns `0` because the output of an $\text{AND}$ gate is always 0 if either input is 0. Otherwise, floating or invalid inputs cause invalid outputs.

Seeing `x` values in a simulation is almost always an indication of a bug or bad coding practice. In the synthesized circuit, this corresponds to a floating gate input, uninitialized state, or contention. The `x` may be interpreted randomly by the circuit as 0 or 1, leading to unpredictable behavior.

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2011.png)

## Bit Swizzling

Often it is necessary to operate on a subset of a bus or to concatenate (join together) signals to form busses. These operations are collectively known as *bit swizzling*. In the example, `y` is given the 9-bit value $c_2c_1d_0d_0d_0c_0101$ using bit swizzling operations.

The `{}` operator is used to concatenate busses. `{3{d[0]}}` indicates three copies of `d[0]`.

don’t confuse the 3-bit binary constant `3'b101` with a bus named `b`. Note that it was critical to specify the length of 3 bits in the constant; otherwise, it would have had an unknown number of leading zeros that might appear in the middle of `y`.

if `y` were wider than 9 bits, zeros would be placed in the most significant bits.

```verilog
assign y = {c[2:1], {3{d[0]}}, c[0], 3'b101};
```

## Delays

HDL statements may be associated with delays specified in arbitrary units. They are helpful during simulation to predict how fast a circuit will work (if one specify meaningful delays) and also for debugging purposes to understand cause and effect (deducing the source of a bad output is tricky if all signals change simultaneously in the simulation results). These delays are ignored during synthesis; the delay of a gate produced by the synthesizer depends on its $t_{pd}$ and $t_{cd}$ specifications, not on numbers in HDL code.

The example adds delays to the original function from the first example, $Y = \bar{A}\bar{B}\bar{C}+A\bar{B}\bar{C}+A\bar{B}C$. It assumes that inverters have a delay of 1 ns, three-input $\text{AND}$ gates have a delay of 2 ns, and three-input $\text{OR}$ gates have a delay of 4 ns. The figure shows the simulation waveforms, with `y` lagging 7 ns after the inputs. Note that `y` is initially unknown at the beginning of a simulation.

Verilog files can include a timescale directive that indicates the value of each time unit. The statement is of the form `'timescale unit/precision`. In this file, each unit is 1 ns, and the simulation has 1 ps precision. If no timescale directive is given in the file, a default unit and precision (usually 1 ns for both) is used. In Verilog, a `#` symbol is used to indicate the number of units of delay. It can be placed in `assign` statements, as well as non-blocking (`<=`) and blocking (`=`) assignments, which will be discussed.

```verilog
‘timescale 1ns/1ps

module example (input  a, b, c,
								output y);
	wire ab, bb, cb, n1, n2, n3;
	assign #1 {ab, bb, cb} = ~{a, b, c};
	assign #2 n1 = ab & bb & cb;
	assign #2 n2 = a  & bb & cb;
	assign #2 n3 = a  & bb & c;
	assign #4 y = n1 | n2 | n3;
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2012.png)

# Structural Modeling

The previous section discussed *behavioral* modeling, describing a module in terms of the relationships between inputs and outputs. This section examines *structural* modeling, describing a module in terms of how it is composed of simple modules.

This example shows how to assemble a 4.1 multiplexer from three 2:1 multiplexers. Each copy of the 2:1 multiplexer is called an *instance*. Multiple instances of the same module are distinguished by distinct names, in this case `lowmux`, `highmux` and `finalmux`. This is an example of regularity, in which the 2:1 multiplexer is reused many times. 

The `mux2` module must be defined elsewhere in the Verilog source.

```verilog
module mux4 (input  [3:0] d0, d1, d2, d3,
						 input  [1:0] s,
						 output [3:0] y);
	wire [3:0] low, high,
	mux2 lowmux (d0, d1, s[0], low);
	mux2 highmux (d2, d3, s[0], high);
	mux2 finalmux (low, high, s[1], y);
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2013.png)

This example uses structural modeling to construct a 2:1 multiplexer from a pair of tristate buffers.

In Verilog, expressions such as `~s` are permitted in the port list for an instance. Arbitrarily complicated expressions are legal but discouraged because they make the code difficult to read.

```verilog
module mux2 (input  [3.0] d0, d1,
						 input        s,
						 output [3:0] y);
	tristate t0 (d0, ~s, y);
	tristate t1 (d1, s, y);
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2014.png)

This example shows how modules can access part of a bus. An 8-bit wide 2:1 multiplexer is built using two of the 4-bit 2:1 multiplexers already defined, operating on the low and high nibbles of the byte. 

```verilog
module mux2_8 (input  [7:0] d0, d1,
							 input        s,
							 output [7:0] y);
	mux2 lsbmux (d0[3:0], d1[3:0], s, y[3:0]);
	mux2 msbmux (d0[7:4], d1[7:4], s, y[7:4]);
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2015.png)

In general, complex systems are designed *hierarchically*. The overall system is described structurally by instantiating its major components. Each of these components is described structurally from its building blocks, and so forth recursively until the pieces are simple enough to describe behaviorally. It is good style to avoud (or at least to minimize) mixing structural and behavioral descriptions within a single module.

# Sequential Logic

## Registers

The vast majority of modern commercial systems are built with registers using positive edge-triggered D flip-flops. The example shows the idiom for such flip-flops.

In Verilog `always` statements, signals keep their old value until an event in the sensitivity list takes place that explicitly causes them to change. Hence, such code, with appropriate sensitivity lists, can be used to describe sequential circuits with memory. For example, the flip-flop includes only `clk` in the sensitivity list. It remembers its old value of `q` until the next rising edge of the `clk`, even if `d` changes in the interim.

In contrast, Verilog continuous assignment statements (`assign`) are reevaluated anytime any of the inputs on the right hand side changes. Therefore, such code necessarily describes combinational logic.

A Verilog `always` statement is written in the form 

```verilog
always @ (sensitivity list)
	statement;
```

The `statement` is executed only when the event specified in the `sensitivity list` occurs. In this example, the statement is `q <= d`. Hence, the flip-flop copies `d` to `q` on the positive edge of the clock and otherwise remembers the old state of `q`.

`<=` is called a *nonblocking assignment*. Think of it as a regular `=` for the moment, we’ll discuss the details later. Note that `<=` is used instead of `assign` inside an `always` statement.

All signals on the left hand side of `<=` or `=` in an `always` statement must be declared as `reg`. In this example, `q` is both an output and a `reg`, so it is declared as `output reg [3:0] q`. Declaring a signal as `reg` does not mean the signal is actually the output of a register. All it means is that the signal appears on the left hand side of an assignment in an `always` statement. 

```verilog
module flop (input            clk,
						 input      [3:0] d,
						 output reg [3:0] q);
	always @ (posedge clk)
		q <= d;
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2016.png)

## Resettable Registers

When simulation begins or power is first applied to a circuit, the output of a flop or register is unknown. This is indicated with `x` in Verilog. Generally, it is good practice to use resettable registers so that on powerup one can put the system into a known state. The reset may be either asynchronous or synchronous. Recall that asynchronous reset occurs immediately, whereas synchronous reset clears the output only on the next rising edge of the clock. The example demonstrates the idioms for flip-flops with asynchronous and synchronous resets. Note that distinguishing synchronous and asynchronous reset in a schematic can be difficult. Our schematics place asynchronous reset at the bottom of a flip-flop and synchronous reset on the left side. 

Multiple signals in an `always` statement sensitivity list are separated with a comma or the word `or`. Notice that `posedge reset` is in the sensitivity list on the asynchronously resettable flop, but not on the synchronously resettable flop. Thus, the asynchronously resettable flop immediately responds to a rising edge on `reset`, but the synchronously resettable flop responds to `reset` only on the rising edge of the clock.

```verilog
module flopr (input            clk,
						  input            reset,
							input      [3:0] d,
							output reg [3:0] q);
	// asynchronous reset
	always @ (posedge clk, posedge reset)
		if (reset) q <= 4'b0;
		else       q <= d:
endmodule

module flopr (input            clk,
						  input            reset,
							input      [3:0] d,
							output reg [3:0] q);
	// synchronous reset
	always @ (posedge clk)
		if (reset) q <= 4'b0;
		else       q <= d:
endmodule
```

![Untitled](Hardware%20Description%20Languages%20fcb219831f434191a76d1574a38442ae/Untitled%2017.png)

## Enabled Registers

# More Combinational Logic

# Finite State Machines

# Parameterized Modules

# Testbenches