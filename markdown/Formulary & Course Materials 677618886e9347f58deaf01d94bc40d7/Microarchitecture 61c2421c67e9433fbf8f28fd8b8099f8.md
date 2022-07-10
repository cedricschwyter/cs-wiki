# Microarchitecture

# Introduction

This chapter covers *microarchitecture*, which is the connection between logic and architecture. Microarchitecture is the specific arrangement of registers, ALUs, finite state machines, memories and other logic building blocks needed to implement an architecture. A particular architecture, such as MIPS, may have many different microarchitectures, each with different trade-offs of performance, cost, and complexity. They all run the same programs, but their internal designs vary widely. We will design three different microarchitectures in this chapter to illustrate the trade-offs.

## Architectural State and Instruction Set

Recall that a computer architecture is defined by its instruction set and *architectural state*. The architectural state for the MIPS processor consists of the program counter and the 32 registers. Any MIPS microarchitecture must contain all of this state. based on the current architectural state, the processor executes a particular instruction with a particular set of data to produce a new architectural state. Some microarchitectures contain additional *nonarchitectural state* to either simplify the logic or improve performance.

To keep the microarchitectures easy to understand, we consider only a subset of the MIPS instruction set. Specifically, we handle the following instructions:

- R-type arithmetic/logic instructions: `add`, `sub`, `and`, `or`, `slt`
- Memory instructions: `lw`, `sw`
- Branches: `beq`

After building the microarchitectures with these instructions, we extend them to handle `addi` and `j`. These particular instructions were chosen because they are sufficient to write many interesting programs. One one understands how to implement these instructions, one can expand the hardware to handle others.

## Design Process

We will divide our microarchitectures into two interacting parts: the *datapath* and the *control*. The datapath operates on words of data. It contains structures such as memories, registers, ALUs, and multiplexers. MIPS is a 32-bit architecture, so we will use a 32-bit datapath. The control unit receives the current instruction from the datapath and tells the datapath how to execute that instruction. Specifically, the control unit produces multiplexer select, register enable, and memory write signals to control the operation of the datapath.

A good way to design a complex system is to start with hardware containing the state elements. These elements include the memories and the architectural state (program counter and registers). Then, add blocks of combinational logic between the state elements to compute the new state based on the current state. The instruction is read from part of memory; load and store instructions then read or write data from another part of memory. Hence, it is often convenient to partition the overall memory into two smaller memories, one containing instructions and the other containing data. The figure shows a block diagram with the four state elements: the program counter, register file, and instruction and data memories.

State elements usually have a reset input to put them into a known state at start-up. This reset is usually not shown.

The *program counter* is an ordinary 32-bit register. Its output, $\text{PC}$, points to the current instruction. Its input, $\text{PC}'$, indicates the address of the next instruction.

The *instruction memory* has a single read port. It takes a 32-bit instruction address input, $A$, and reads the 32-bit data (i.e., instruction) from that address onto the read data output, $\text{RD}$.

The 32-element $\times$ 32-bit *register file* has two read ports and one write port. The read ports take 5-bit address inputs, $A1$ and $A2$, each specifying one of $2^5=32$ registers as source operands. They read the 32-bit register values onto read data outputs $\text{RD}1$ and $\text{RD}2$ respectively. The write port takes a 5-bit address input, $A3$; a 32-bit write data input, $\text{WD}$; a write enable input, $\text{WE}3$; and a clock. If the write enable is 1, the register file writes the data into the specified register on the rising edge of the clock.

The *data memory* has a single read/write port. If the write enable, $\text{WE}$, is 1, it writes data $\text{WD}$ into address $A$ on the rising edge of the clock. If the write enable is 0, it reads address $A$  onto $\text{RD}$.

The instruction memory, register file, and data memory are all read *combinationally*. In other words, if the address changes, the new data appears at $\text{RD}$ after some propagation delay; no clock is involved. They are written only on the rising edge of the clock. In this fashion, the state of the system is changed only at the clock edge. The address, data, and write enable must be setup sometime before the clock edge and must remain stable until a hold time after the clock edge.Because the state elements change their state only on the rising edge of the clock, they are synchronous sequential circuits. The microprocessor is built of clocked state elements and combinational logic, so it too is a synchronous sequential circuit. Indeed, the processor can be viewed as a giant finite state machine, or as a collection of simpler interacting state machines.

![Untitled](Microarchitecture%2061c2421c67e9433fbf8f28fd8b8099f8/Untitled.png)

## MIPS Microarchitectures

In this chapter, we develop three microarchitectures for the MIPS processor architecture: single-cycle, multi-cycle, and pipelined. They differ in the way that the state elements are connected together and in the amount of nonarchitectural state.

The *single-cycle microarchitecture* executes an entire instruction in one cycle. it is easy to explain and has a simple control unit. Because it completes the operation in one cycle, it does not require any nonarchitectural state. However, the cycle time is limited by the slowest instruction.

The *multicycle microarchitecture* executes instructions in a series of shorter cycles. Simpler instructions execute in fewer cycles than complicated ones. Moreover, the multicycle microarchitecture reduces the hardware cost by reusing expensive hardware blocks such as adders and memories. For example, the adder may be used on several different cycles for several purposes while carrying out a single instruction. The multicycle processor accomplishes this by adding several nonarchitectural registers to hold intermediate results. The multicycle processor executes only one instruction at a time, but each instruction takes multiple clock cycles.

The *pipelined microarchitecture* applies to pipelining to the single-cycle microarchitecture. It therefore can execute several instructions simultaneously, improving the throughput significantly. Pipelining must add logic to handle dependencies between simultaneously executing instructions. It also requires nonarchitectural pipeline registers. The added logic and registers are worthwhile; all commercial high-performance processors use pipelining today.

# Performance Analysis

# Single-Cycle Processor

# Multicycle Processor

# Pipelined Processor

# HDL Representation

# Exceptions

# Advanced Microarchitecture

# IA-32 Microarchitecture