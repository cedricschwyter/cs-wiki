# Architecture

# Introduction

In this chapter we raise the level of abstraction to define the *architecture* of a computer. The architecture is the programmer’s view of a computer. It is defined by the instruction set (language) and operand locations (registers and memory). Many different architectures exist, such as IA-32, MIPS, SPARC, and PowerPC.

The first step in understanding any computer architecture is to learn its language. The words in a computer’s language are called *instructions*. The computer’s vocabulary is called the instruction set. All programs running on a computer use the same *instruction set*. Even complex software applications are eventually compiled into a series of simple instructions such as add, subtract, and jump. Computer instructions indicate both the operation to perform and the operands to use. The operands may come from memory, from registers, or from the instruction itself.

Computer hardware only understands 1’s and 0’s, so instructions are encoded as binary numbers in a format called *machine language*. Just as we use letters to encode human language, computers use binary numbers to encode machine language. Microprocessors are digital systems that read and execute machine language instructions. However, humans consider reading machine language to be tedious, so we prefer to represent the instructions in a symbolic format, called *assembly language*.

The instruction sets of different architectures are more like different dialects than different languages. Almost all architectures define basic instructions, such as add, subtract, and jump, that operate on memory or registers. 

A computer architecture does not define the underlying hardware implementation. Often, many different hardware implementations of a single architecture exist. For example, Intel and AMD sell various microprocessors belonging to the same IA-32 architecture. They all can run the same programs, but they use different underlying hardware and therefore offer trade-offs in performance, price, and power. Some microprocessors are optimized for high-performance servers, whereas others are optimized for long battery life in laptop computers. The specific arrangement of registers, memories, ALUs, and other building blocks to form a microprocessor is called the *microarchitecture*. Often, many different microarchitectures exist for a single architecture.

On this page we introduce the MIPS architecture that was first developed by John Hennesssy and his colleagues at Stanford in the 1980’s. MIPS processors are used by, among others, Silicon Graphics, Nintendo, and Cisco. We start by introducing the basic instructions, operand locations, and machine language formats. We then introduce more instructions used in common programming constructs, such as branches, loops, array manipulations, and procedure calls.

Throughout the page we motivate the design of the MIPS architecture using four principles articulated by Patterson and Hennessy:

1. simplicity favors regularity
2. make the common case fast
3. smaller is faster
4. good design demands good compromises

# Assembly Language

Assembly language is the human-readable representation of the computer’s native language. Each assembly language instruction specifies both the operation to perform and the operands on which to operate. We introduce simple arithmetic instructions and show how these operations are written in assembly language. We then define the MIPS instruction operands: registers, memory, and constants.

## Instructions

The most common operation computers perform is addition. The example shows code for adding variables `b` and `c` and writing the result to `a`. The program is shown first in a high-level language, and then rewritten on in MIPS assembly language.

```c
a = b + c;
```

```
add a, b, c
```

The first part of the assembly instruction, `add`, is called the *mnemonic* and indicates what operation to perform. The operation is performed on `b` and `c`, the *source operands*, and the result is written to `a`, the *destination operand*.

This example shows that subtraction is similar to addition. The instruction format is the same as the `add` instruction except for the operation specification, `sub`. This consistent instruction format is an example of the first design principle.

```c
a = b - c;
```

```
sub a, b, c
```

Instructions with a consistent number of operands - in this case, two sources and one destination - are easier to encode and handle in hardware. More complex high-level code translates into multiple MIPS instructions, as shown in this example.

```c
a = b + c - d; // single-line comment
               /* multiple-line
                  comment */
```

```
sub t, c, d # t = c - d
add a, b, t # a = b + t
```

In the high-level language examples, single-line comments begin with `//` and continue until the end of the line. Multiline comments begin with `/*` and end with `*/`. In assembly language, only single-line comments are used. They begin with `#` and continue until the end of the line. The assembly language program in the above example requires a temporary variable, `t`, to store the intermediate result. Using multiple assembly language instructions to perform more complex operations is an example of the second design principle of computer architecture.

The MIPS instruction set makes the common case fast by including only simple, commonly used instructions. The number of instructions is kept small so that the hardware required to decode the instruction and its operands can be simple, small, and fast. more elaborate operations that are less common are performed using sequences of multiple simple instructions. Thus, MIPS is a *reduced instruction set computer (RISC)* architecture. Architectures with many complex instructions, such as Intel’s IA-32 architecture, are *complex instruction set computers (CISC)*. For example, IA-32 defines a “string move” instruction that copies a string from one part of memory to another. Such an operation requires many, possibly even hundreds, of simple instructions in a RISC machine. However, the cost of implementing complex instructions in a CISC architecture is added hardware and overhead that slows down the simple instructions.

A RISC architecture minimizes the hardware complexity and the necessary instruction encoding by keeping the set of distinct instructions small. For example, an instruction set with 64 simple instructions would need $\log_264=6$ bits to encode the operation. An instruction set with 256 complex instructions would need $\log_2256=8$ bits of encoding per instruction. In a CISC machine, even though the complex instructions may be used only rarely, they add overhead to all instruction, even the simple ones.

## Operands: Registers, Memory, and Constants

# Machine Language

# Programming

# Addressing Modes

# Compiling, Assembling, and Loading

# Odds and Ends

# IA-32 Architecture