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

A module is a good application of modularity. It has a well defined interface, consisting of its inputs and outputs, and it performs a specific function. The particular way in which it is coded is unimportant to others that might use the module, as long as it performs its function. 

## Language Origins

# Combinational Logic

# Structural Modeling

# Sequential Logic

# More Combinational Logic

# Finite State Machines

# Parameterized Modules

# Testbenches