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

An instruction operates on *operands*. But computers operate on 1’s and 0’s, not variable names. The instructions need a physical location from which to retrieve the binary data. Operands can be stored in registers or memory, or they may be *constants* stored in the instruction itself. Computers use various locations to hold operands, to optimize for speed and data capacity. Operands stored as constants or in registers are accessed quickly, but they hold only a small amount of data. Additional data must be accessed from memory, which is large but slow. MIPS is called a 32-bit architecture because it operates on 32-bit data. The MIPS architecture has been extended to 64 bits in commercial products, but for our purposes we will stick to the 32-bit one.

### Registers

Instructions need to access operands quickly so that they can run fast. But operands stored in memory take a long time to retrieve. Therefore, most architectures specify a small number of registers that hold commonly used operands. The MIPS architecture uses 32 registers, called the *register set* or *register file*. The fewer the registers. the faster they can be accessed. This is an application of the third design principle.

Looking up information from a small number of relevant books on your desk is a lot faster than searching for the information in the stacks at a library. Likewise, reading data from a mall set of registers is faster than reading it from 10000 registers or a large memory. A small register file is typically built from a small SRAM array. The SRAM array uses a small decoder and bitlines connected to relatively few memory cells, so it has a shorter critical path than a large memory does.

The example shows the `add` instruction with register operands. MIPS register names are preceded by the `$` sign. The variables `a`, `b`, and `c` are arbitrarily placed in `$s0`, `$s1`, and `$s2`. The instruction adds the 32-bit values contained in `$s1` and `$s2` and writes the 32-bit result to `$s0`.

```c
a = b + c;
```

```
add $s0, $s1, $s2
```

MIPS generally stores variables in 18 of the 32 registers: `$s0 - $s7`, and `$t0 - $t9`. Register names beginning with `$s` are called *saved* registers. Following MIPS convention, these registers store variables such as `a`, `b`, and `c` above. Saved registers have special connotations when they are used with procedure calls. Register names beginning with `$t` are called *temporary* registers They are used for storing temporary variables. 

The example shows MIPS assembly code using a temporary register, `$t0`, to store the intermediate calculation of `c - d`. 

```c
a = b + c - d;
```

```
sub $t0, $s2, $s3
add $s0, $s1, $t0
```

### The Register Set

The MIPS architecture defines 32 registers. Each register has a name and a number ranging from 0 to 31. The table lists the name, number, and use for each register. `$0` always contains the value 0 because this constant is so frequently used in computer programs. 

![Untitled](Architecture%20e7b6c5364ca640708d9efe9eca1ba07e/Untitled.png)

### Memory

If registers were the only storage space for operands we would be confined to simple programs with no more than 32 variables. However, data can also be stored in memory. When compared to the register file, memory has many data locations, but accessing it takes a longer amount of time. Whereas the register file is small and fast, memory is large and slow. For this reason, commonly used variables are kept in registers. By using a combination of memory and registers, a program can access a large amount of data fairly quickly. As previously described, memories are organized as an array of data words. The MIPS architecture uses 32-bit memory addresses and 32-bit data words.

MIPS uses a byte-addressable memory. That is, each byte in memory has a unique address. However, for explanation purposes only, we first introduce a word-addressable memory and afterwards describe the MIPS byte-addressable memory.

The figure shows a memory array that is *word-addressable*. That is, each 32-bit data word has a unique 32-bit address. Both the 32-bit word address and the 32-bit data value are written in hexadecimal in the figure. By convention, memory is drawn with low memory addresses toward the bottom and high memory addresses toward the top.

![Untitled](Architecture%20e7b6c5364ca640708d9efe9eca1ba07e/Untitled%201.png)

MIPS uses the *load word* instruction, `lw`, to read a data word from memory into a register. The example loads memory word 1 into `$s3`. The `lw` instruction specifies the *effective address* in memory as the sum of a *base address* and an *offset*. The base address (written in parentheses in the instruction) is a register. The offset is a constant (written before the parentheses). In the example, the base address is `$0`, which holds the value 0, and the offset is 1, so the `lw` instruction reads from memory address `($0 + 1) = 1`. After the load word instruction is executed, `$s3` holds the value 0xF2F1AC07, which is the data value stored at memory address 1 in the above figure.

```
lw $s3, 1($0)
```

Similarly, MIPS uses the *store word* instruction, `sw`, to write a data word from a register into memory. The example writes the contents of register `$s7` into memory word 5. These examples have used `$0` as the base address, but remember that any register can be used to supply the base address.

```
sw $s7, 5($0)
```

The previous two code examples have shown a computer architecture with a word-addressable memory. The MIPS memory model, however, is byte-addressable, *not* word-addressable. Each data byte has a unique address. A 32-bit word consists of four 8-bit bytes. So each word address is a multiple of 4, as shown in the figure. Again, both the 32-bit word address and the data value are given in hexadecimal.

![Untitled](Architecture%20e7b6c5364ca640708d9efe9eca1ba07e/Untitled%202.png)

The example shows how to read and write words in the MIPS byte-addressable memory. The word address is four times the word number. The MIPS assembly code reads words 0, 2, and 3 and writes words 1, 8, and 100. 

```
1w $s0, 0($0) # read data word 0 (0xABCDEF78) into $s0
1w $s1, 8($0) # read data word 2 (0x01EE2842) into $s1
1w $s2, 0xC($0) # read data word 3 (0x40F30788) into $s2
sw $s3, 4($0) # write $s3 to data word 1
sw $s4, 0x20($0) # write $s4 to data word 8
sw $s5, 400($0) # write $s5 to data word 100
```

Byte-addressable memories are organized in a *big-endian* or *little-endian* fashion, as shown in the figure. In both formats, the *most significant byte (MSB)* is on the left and the *least significant byte (LSB)* is on the right. In big-endian machines, bytes are numbered starting with 0 at the big (most significant) end. In little-endian machines, bytes are numbered starting with 0 at the little (least significant) end. Word addresses are the same in both formats and refer to the same four bytes. Only the addresses of bytes within a word differ.

IBMs PowerPC (formerly found in Macintosh computers) uses big-endian addressing. Intel’s IA-32 architecture (found in PCs) uses little-endian addressing. Some MIPS processors are little-endian, and some are big-endian. The choice of endianness is completely arbitrary, but it leads to hassles when sharing data between big-endian and little-endian computers. In examples in this wiki we will use little-endian format whenever byte ordering matters.

In the MIPS architecture, word addresses for `lw` and `sw` must be *word aligned*. That is, the address must be divisible by 4. Thus, the instruction `lw $s0, 7($0)` is an illegal instruction. Some architectures, like IA-32 for example, allow non-word-aligned data reads and writes, but MIPS requires strict alignment for simplicity. Of course, byte addresses for load byte and store byte, `lb` and `sb` need not be word aligned.

![Untitled](Architecture%20e7b6c5364ca640708d9efe9eca1ba07e/Untitled%203.png)

### Constants/Immediates

Load word and store word, `lw` and `sw`, also illustrate the use of *constants* in MIPS instructions. These constants are called *immediates*, because their values are immediately available from the instruction and do not require a register or memory access. Add immediate, `addi`, is another common MIPS instruction that uses an immediate operand. `addi` adds the immediate specified in the instruction to a value in a register, as shown in the example.

```c
a = a + 4;
b = a - 12;
```

```
addi $s0, $s0, 4
addi $s1, $s0, -12
```

The immediate specified in an instruction is a 16-bit two’s complement number in the range $[-32768, 32767]$. Subtraction is equivalent to adding a negative number, so, in the interest of simplicity, there is no `subi` instruction in the MIPS architecture.

Recall that the `add` and `sub` instructions use three register operands. But the `lw`, `sw`, and `addi` instructions use two register operands and a constant. Because the instruction formats differ, `lw` and `sw` instructions violate design principle 1. However, this issue allows us to introduce the last design principle.

A single instruction format would be simple but not flexible. The MIPS instruction set makes the compromise of supporting three instruction formats. One format, used for instructions such as `add` and `sub`, has three register operands. Another, used for instructions such as `lw` and `addi`, has two register operands and a 16-bit immediate. A third, to be discussed later, has a 26-bit immediate and no registers.

# Machine Language

Assembly language is convenient for humans to read. However, digital circuits understand only 1’s and 0’s. Therefore, a program written in assembly language is translated from mnemonics to a representation using only 1’s and 0’s, called *machine language*.

MIPS uses 32-bit instructions. Again, simplicity favors regularity, and the most regular choice is to encode all instructions as words that can be stored in memory. Even though some instructions may not require all 32 bits of encoding, variable-length instructions would add too much complexity. Simplicity would also encourage a single instruction format, but, as already mentioned, that is too restrictive. MIPS makes the compromise of defining three instruction formats: R-type, I-type, and J-type. This small number of formats allows for some regularity among all the types, and thus simpler hardware while also accommodating different instruction needs, such as the need to encode large constants in the instruction. *R-type* instructions operate on three registers. *I-type* instructions operate on two registers and a 16-bit immediate. *J-type* instructions (jump) operate on one 26-bit immediate.

## R-type Instructions

The name R-type is short for *register-type*. R-type instructions use three registers as operands: two as sources, and one 

# Programming

# Addressing Modes

# Compiling, Assembling, and Loading

# Odds and Ends

# IA-32 Architecture