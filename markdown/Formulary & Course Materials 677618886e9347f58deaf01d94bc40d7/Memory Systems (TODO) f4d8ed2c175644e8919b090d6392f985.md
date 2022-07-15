# Memory Systems (TODO)

# Introduction

Computer system performance depends on the memory system as well as the processor microarchitecture. Previously, we always assumed an ideal memory system that could be accessed in a single clock cycle. However, this would be true only for a very small memory - or a very slow processor. Early processors were relatively slow, so memory was able to keep up. But processor speed has increased at a faster rate than memory speeds. DRAM memories are currently 10 to 100 times slower than processors. The increasing gap between processor and DRAM memory speeds demands increasingly ingenious memory systems to try to approximate a memory that is as fast as the processor.

The processor communicates with the memory system over a *memory interface*. The figure shows the simple memory interface used in our multicycle MIPS processor. The processor sends an address over the *Address* bus to the memory system. For a read, *MemWrite* is 0 and the memory returns the data on the *ReadData* bus. For a write, *MemWrite* is 1 and the processor sends data to memory on the *WriteData* bus.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled.png)

The major issues in memory system design can be broadly explained using a metaphor of books in a library. A library contains many books on the shelves. If one were to write a term paper on the meaning of dreams, one might go to the library and pull Freud’s *The Interpretation of Dreams* off the shelf and bring it to one’s cubicle. After skimming it, one might put it back and pull out Jung’s *The Psychology of the Unconscious*. One might then go back for another quote from *Interpretation of Dreams*, followed by yet another trip to the stacks for Freud’s *The Ego and the Id*. Pretty soon one would get tired of walking from the cubicle to the stacks. If one is clever, one would save time by keeping the books in one’s cubicle instead of schlepping them back and forth. Furthermore, when one pull a book by Freud, one could also pull several of his other books from the same shelf.

This metaphor emphasizes the principle of making the common case fast. By keeping books that one have recently used or might likely use in the future at one’s cubicle, the number of time-consuming trips to the stacks is reduced. In particular, one uses the principles of *temporal* and *spatial locality*. Temporal locality means that if you have used a book recently, you are likely to use it again soon. Spatial locality means that when you use a particular book, you are likely to be interested in other books on the same shelf.

The library itself makes the common case fast by using these principles of locality. The library has neither the shelf space nor the budget to accommodate all the books in the world. Instead, it keeps some of the lesser-used books in deep storage in the basement. Also, it may have an interlibrary loan agreement with nearby libraries so that it can offer more books than it physically carries.

In summary, you obtain the benefits of both a large collection and quick access to the most commonly used books through a hierarchy of storage. The most commonly used books are in your cubicle. A larger collections is on the shelves. And an even larger collection is available, with advanced notice, from the basement and other libraries. Similarly, memory systems use a hierarchy of storage to quickly access the most commonly used data while still having the capacity to store large amounts of data.

Memory subsystems used to build this hierarchy were already introduced. Computer memories are primarily built from dynamic RAM and static RAM. Ideally, the computer memory system is fast, large, and cheap. In practice, a single memory only has two of these three attributes; it is either slow, small, or expensive. But computer systems can approximate the ideal by combining a fast small cheap memory and a slow large cheap memory. The fast memory stores the most commonly used data and instructions, so on average the memory system appears fast. The large memory stores the remainder of the data and instructions, so the overall capacity is large. The combination of two cheap memories is much less expensive than a single large fast memory. these principles extend to using an entire hierarchy of memories of increasing capacity and decreasing speed.

Computer memory is generally built from DRAM chips. In 2006, a typical PC had a *main memory* consisting of 256 MB to 1 GB of DRAM, and DRAM cost about 100 dollars per gigabyte.

# Memory System Performance Analysis

# Caches

# Virtual Memory

# Memory-Mapped I/O

# IA-32 Memory and I/O Systems