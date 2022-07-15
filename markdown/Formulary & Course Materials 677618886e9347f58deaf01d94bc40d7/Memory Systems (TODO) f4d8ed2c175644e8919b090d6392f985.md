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

Computer memory is generally built from DRAM chips. In 2006, a typical PC had a *main memory* consisting of 256 MB to 1 GB of DRAM, and DRAM cost about 100 dollars per gigabyte. DRAM prices have declined at about 30% per year for the last three decades, and memory capacity has grown at the same rate, so the total cost of the memory in a PC has remained roughly constant. Unfortunately, DRAM speed has improved by only about 7% per year, whereas processor performance has improved at a rate of 30 to 50% per year, as shown in the figure.

The plot shows memory and processor speeds with the 1980 speeds as a baseline. In about 1980, processor and memory speeds were the same. But performance has diverged since then, with memories badly lagging.

DRAM could keep up with processors in the 1970s and early 1980s, but it is now woefully too slow. The DRAM access time is one to two orders of magnitude longer than the processor cycle time.

To counteract this trend, computers store the most commonly used instructions and data in a faster but smaller memory, called a *cache*. The cache is usually built out of SRAM on the same chip as the processor. The cache speed is comparable to the processor speed, because SRAM is inherently faster than DRAM, and because the on-chip memory eliminates lengthy delays caused by traveling to and from a separate chip. In 2006, on-chip SRAM costs were on the order of 10’000 dollars per gigabyte, but the cache is relatively small (kilobytes to a few megabytes), so the overall cost is low. Caches can store both instructions and data, but we will refer to their contents generically as “data”.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%201.png)

If the processor requests data that is available in the cache, it is returned quickly. This is called a cache *hit*. Otherwise, the processor retrieves the data from main memory. This is called a cache *miss*. If the cache hits most of the time, then the processor seldom has to wait for the slow memory, and the average access time is low.

The third level in the memory hierarchy is the *hard disk*, or *hard drive*. In the same way that a library uses the basement to store books that do not fit in the stacks, computer systems use the hard disk to store data that does not fit in main memory. In 2006, a hard disk cost less than a dollar per gigabyte and had an access time of about 10 ms. Hard disk costs have decreased at 60% per year, but access times scarcely improved. The hard disk provides an illusion of more capacity than actually exists in the main memory. It is thus called *virtual memory*. Like books in the basement, data in virtual memory takes a long time to access. Main memory, also called *physical memory*, holds a subset of the virtual memory. Hence, the main memory can be viewed a a cache for the most commonly used data from the hard disk.

The figure summarizes the memory hierarchy of the computer systems discussed in the rest of this page. 

The processor first seeks data in a small but fast cache that is usually located on the same chip. If the data is not available in the cache, the processor then looks in main memory. If the data is not there either, the processor fetches the data from virtual memory on the large but slow hard disk. 

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%202.png)

The figure illustrates this capacity and speed trade-off in the memory hierarchy and lists typical costs and access times in 2006 technology. As access time decreases, speed increases. 

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%203.png)

# Memory System Performance Analysis

Designers and computer buyers need quantitative ways to measure the performance of memory systems to evaluate the cost-benefit trade-offs of various alternatives. Memory system performance metrics are *miss rate* or *hit rate* and *average memory access time*. Miss and hit rates are calculated as: 

$$
\begin{align*}
\text{Miss rate} & = \frac{\text{Number of misses}}{\text{Number of total memory accesses}} & = & \ 1 - \text{Hit rate} \\
\text{Hit rate} & = \frac{\text{Number of hits}}{\text{Number of total memory accesses}} & = & \ 1 - \text{Miss rate}  
\end{align*}
$$

*Average memory access time (AMAT)* is the average time a processor must wait for memory per load or store instruction. In the typical computer system from the figure above, the processor first looks for the data in the cache. If the cache misses, the processor then looks in main memory. If the main memory misses, the processor accesses virtual memory on the hard disk. Thus, AMAT is calculated as: 

$$
\text{AMAT} = t_{\text{cache}}+ \text{MR}_{\text{cache}}(t_{\text{MM}}+\text{MR}_{\text{MM}}t_{\text{VM}})
$$

where $t_\text{cache}$, $t_{\text{MM}}$, and $t_{\text{VM}}$ are the access times of the cache, main memory, and virtual memory, and $\text{MR}_{\text{cache}}$ and $\text{MR}_{\text{MM}}$ are the cache and main memory miss rates, respectively.

As a word of caution, performance improvements might not always be as good as they sound. For example, making the memory system ten times faster will not necessarily make a computer program run ten times as fast. If 50% of a program’s instructions are loads and stores, a ten-fold memory system improvement only means a 1.82-fold improvement in program performance. This general principle is called *Amdahl’s Law*, which says that the effort spent on increasing the performance of a subsystem is worthwhile only if the subsystem affects a large percentage of the overall performance.

# Caches

A cache holds commonly used memory data. The number of data words that it can hold is called the *capacity*, $C$. Because the capacity of the cache is smaller than that of main memory, the computer system designer must choose what subset of the main memory is kept in the cache.

When the processor attempts to access data, it first checks the cache for the data. IF the cache hits, the data is available immediately. If the cache misses, the processor fetches the data from main memory and places it in the cache for future use. To accommodate the new data, the cache must *replace* old data. This section investigates these issues in cache design by answering the following questions:

- What data is held in the cache?
- How is the data found?
- What data is replaced to make room for new data when the cache is full?

Keep in mind that the driving force in answering these questions is the inherent spatial and temporal locality of data accesses in most applications. Caches use spatial and temporal locality to predict what data will be needed next. If a program accesses data in a random order, it would not benefit from a cache.

Caches are specified by their capacity ($C$), number of sets ($S$), block size ($b$), number of blocks ($B$), and degree of associativity ($N$).

Although we focus on data cache loads, the same principles apply for fetches from an instruction cache. Data cache store operations are similar and are discussed later.

## What Data Is Held In The Cache?

An ideal cache would anticipate all of the data needed by the processor and fetch it from memory ahead of time so that the cache has a zero miss rate. Because it is impossible to predict the future with perfect accuracy, the cache must guess what data will be needed based on the past pattern of memory accesses. In particular, the cache exploits temporal and spatial locality to achieve a low miss rate.

Recall that temporal locality means that the processor is likely to access a piece of data again soon if it has accessed that data recently. Therefore, when the processor loads or stores data that is not in the cache, the data is copied from main memory into the cache. Subsequent requests for that data hit in the cache.

Recall that spatial locality means that, when the processor accesses a piece of data, it is also likely to access data in nearby memory locations. Therefore, when the cache fetches one word from memory, it may also fetch several adjacent words. This group of words is called a *cache block*. The number of words in the cache block, $b$, is called the *block size*. A cache of capacity $C$ contains $B = \frac{C}{b}$ blocks.

The principles of temporal and spatial locality have been experimentally verified in real programs. If a variable is used in a program, the same variable is likely to be used again, creating temporal locality. If an element in an array is used, other elements in the same array are also likely to be used, creating spatial locality.

## How Is The Data Found?

A cache is organized into $S$ *sets*, each of which holds one or more blocks of data. The relationship between the address of data in main memory and the location of that data in the cache is called the *mapping*. Each memory address maps to exactly one set in the cache. Some of the address bits are used to determine which cache set contains the data. If the set contains more than one block, the data may be kept in any of the blocks in the set.

Caches are categorized based on the number of blocks in a set. In a *direct mapped* cache, each set contains exactly one block, so the cache has $S = B$ sets. Thus, a particular main memory address maps to a unique block in the cache. In an $N$-*way set associative* cache, each set contains $N$ blocks. The address still maps to a unique set, with $S = \frac{B}{N}$ sets. But the data from that address can go in any of the $N$ blocks in that set. A *fully associative* cache has only $S = 1$ set. Data can go in any of the $B$ blocks in the set. Hence, a fully associative cache is another name for a $B$-way associative cache.

To illustrate these cache organizations, we will consider a MIPS memory system with 32-bit addresses and 32-bit words. The memory is byte-addressable, and each word is four bytes, so the memory consists of $2^{30}$ words aligned on word boundaries. We analyze caches with an eight-word capacity ($C$) for the sake of simplicity. We begin with a one-word block size ($b$), then generalize later to larger blocks.

### Direct Mapped Cache

A *direct mapped* cache has one block in each set, so it is organized into $S = B$ sets. To understand the mapping of memory addresses onto cache blocks, imagine main memory as being mapped into $b$-word blocks, just as the cache is. An address in block 0 of main memory maps to set 0 of the cache. An address in block 1 of main memory maps to set 1 of the cache, and so forth until an address in block $B-1$ of main memory maps to block $B-1$ of the cache. There are no more blocks of the cache, so the mapping wraps around, such that block $B$ of main memory maps to set 0 of the cache.What Data Is Replaced?

This mapping is illustrated in the figure for a direct mapped cache with a capacity of eight words and a block size of one word. The cache has eight sets, each of which contains a one-word block. The bottom two bits of the address are always 00, because they are word aligned. The next $\log_28=3$ bits indicate the set onto which the memory address maps. Thus, the data at addresses 0x00000004, 0x00000024,…,0xFFFFFFE4 all map to set 1, as shown in blue. Likewise, data at addresses 0x00000010,…,0xFFFFFFF0 all map to set 4, and so forth. Each main memory address maps to exactly one set in the cache.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%204.png)

Because many addresses map to a single set, the cache must also keep track of the address of the data actually contained in each set. The least significant bits of the address specify which set holds the data. The remaining most significant bits are called the *tag* and indicate which of the many possible addresses is held in that set.

In the previous example, the two least significant bits of the 32-bit address are called the *byte offset*, because they indicate the byte withing the word. The next three bits are called the *set bits*, because they indicate the set to which the address maps (in general, the number of set bits is $\log_2S$). The remaining 27 tag bits indicate the memory address of the data stored in a given cache set. The figure shows the cache fields for address 0xFFFFFFE4. It maps to set 1 and its tag is all 1’s.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%205.png)

Sometimes, such as when the computer first starts up, the cache sets contain no data at all. The cache uses a *valid bit* for each set to indicate whether the set holds meaningful data. If the valid bit is 0, the contents are meaningless.

The figure shows the hardware for the direct mapped cache from above. The cache is constructed as an eight-entry SRAM. Each entry, or set, contains one line consisting of 32 bits of data, 27 bits of tag, and 1 valid bit. The cache is accessed using the 32-bit address. The two least significant bits, the byte offset bits, are ignored for word accesses. The next three bits, the set bits, specify the entry or set in the cache. A load instruction reads the specified entry from the cache and checks the tag and valid bits. If the tag matches the most significant 27 bits of the address and the valid bit is 1, the cache hits and the data is returned to the processor. Otherwise, the cache misses and the memory system must fetch the data from main memory.

When two recently accessed addresses map to the same cache block, a *conflict* occurs, and the most recently accessed address *evicts* the previous one from the block. Direct mapped caches have only one block in each set, so two addresses that map to the same set always cause a conflict.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%206.png)

### Multi-way Set Associative Cache

An $N$-*way set associative* cache reduces conflicts by providing $N$ blocks in each set where data mapping to that set might be found. Each memory address still maps to a specific set, but it can map to any one of the $N$ blocks in the set. Hence, a direct mapped cache is another name for a one-way set associative cache. $N$ is also called the *degree of associativity* of the cache.

The figure shows the hardware for a $C=8$-word, $N=2$-way set associative cache. The cache now has only $S=4$ sets rather than 8. Thus, only $\log_24=2$ set bits rather than 3 are used to select the set. the tag increases from 27 to 28 bits. Each set contains two *ways* or degrees of associativity. Each way consists of a data block and the valid and tag bits. The cache reads blocks from both ways in the selected set and checks the tags and valid bits for a hit. If a hit occurs in one of the ways, a multiplexer selects data from that way.

Set associative caches generally have lower miss rates than direct mapped caches of the same capacity, because they have fewer conflicts. However, set associative caches are usually slower and somewhat more expensive to build because of the output multiplexer and additional comparators. They also raise the question of which way to replace when both ways are full. Most commercial systems use set associative caches.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%207.png)

### Fully Associative Cache

A *fully associative* cache contains a single set with $B$ ways, where $B$ is the number of blocks. A memory address can map to a block in any of these ways. A fully associative cache is another name for a $B$-way set associative cache with one set.

The figure shows the SRAM array of a fully associative cache with eight blocks. Upon a data request, eight tag comparisons must be made, because the data could be in any block. Similarly, an 8:1 multiplexer chooses the proper data if a hit occurs. Fully associative caches tend to have the fewest conflict misses for a given cache capacity, but they require more hardware for additional tag comparisons. They are best suited to relatively small caches because of the large number of comparators.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%208.png)

### Block Size

The previous examples were able to take advantage only of temporal locality, because the block size was one word. To exploit spatial locality, a cache uses larger blocks to hold several consecutive words.

The advantage of a block size greater than one is that when a miss occurs and the word is fetched into the cache, the adjacent words in the block are also fetched. Therefore, subsequent accesses are more likely to hit because of spatial locality. However, a large block size means that a fixed-size cache will have fewer blocks. This may lead to more conflicts, increasing the miss rate. Moreover, it takes more time to fetch the missing cache block after a miss, because more than one data word is fetched from main memory. The time required to load the missing block into the cache is called the *miss penalty*. If the adjacent words in the block are not accessed later, the effort of fetching them is waster. Nevertheless, most real programs benefit from larger block sizes.

The figure shows the hardware for a $C=8$-word direct mapped cache with a $b=4$-word block size. The cache now has only $B=\frac{C}{b}=2$ blocks. A direct mapped cache has one block in each set, so this cache is organized as two sets. Thus, only $\log_22=1$ bit is used to select the set. A multiplexer is now needed to select the word within the block. The multiplexer is controlled by the $\log_24=2$ *block offset bits* of the address. The most significant 27 address bits form the tag. Only one tag is needed for the entire block, because the words in the block are at consecutive addresses.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%209.png)

The figure shows the cache fields for address 0x8000009C when it maps to the direct mapped cache above. The byte offset bits are always 0 for word accesses. The next $\log_2b=2$ block offset bits indicate the word within the block. And the next bit indicates the set. The remaining 27 bits are the tag. Therefore, word 0x8000009C maps to set 1, word 3 in the cache. The principle of using larger block sizes to exploit spatial locality also applies to associative caches.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%2010.png)

### Putting It All Together

Caches are organized as two-dimensional arrays. The rows are called sets, and the columns are called ways. Each entry in the array consists of a data block and its associated valid and tag bits. Caches are characterized by 

- capacity $C$
- block size $b$ (and number of blocks $B = \frac{C}{b}$)
- number of blocks in a set ($N$)

The table summarizes the various cache organizations. Each address in memory maps to only one set but can be stored in any of the ways.

Cache capacity, associativity, set size, and block size are typically powers of 2. This makes the cache fields (tag, set, and block offset bits) subsets of the address bits.

Increasing the associativity, $N$, usually reduces the miss rate caused by conflicts. But higher associativity requires more tag comparators. Increasing the block size, $b$, takes advantage of spatial locality to reduce the miss rate. However, it decreases the number of sets in a fixed sized cache and therefore could lead to more conflicts. It also increases the miss penalty.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%2011.png)

## What Data Is Replaced?

In a direct mapped cache, each address maps to a unique block and set. If a set is full when new data must be loaded, the block in that set is replaced with the new data. In set associative and fully associative caches, the cache must choose which block to evict when a cache set is full. The principle of temporal locality suggests that the best choice is to evict the least recently used block, because it is least likely to be used again soon. Hence, most associative caches have a *least recently used (LRU)* replacement policy.

In a two-way set associative cache, a *use bit*, $U$, indicates which way within a set was least recently used. Each time one of the ways is used, $U$ is adjusted to indicate the other way. For set associative caches with more than two ways, tracking the least recently used way becomes complicated. To simplify the problem,the ways are often divided into two groups and $U$ indicates which *group* of ways was least recently used. Upon replacement, the new block replaces a random block within the least recently used group. Such a policy is called *pseudo-LRU* and is good enough in practice.

## Advanced Cache Design

Modern systems use multiple levels of caches to decrease memory access time. This section explores the performance of a two-level caching system and examines how block size, associativity, and cache capacity affect miss rate. The section also describes how caches handle stores, or writes, by using a write-through or write-back policy.

### Multiple-Level Caches

Large caches are beneficial because they are more likely to hold data of interest and therefore have lower miss rates. However, large caches tend to be slower than small ones. Modern systems often use two levels of caches, as shown. The first-level cache (L1) is small enough to provide a  one- or two-cycle access time. The second-level cache (L2) is also built from SRAM but is larger, and therefore slower, than the L1 cache. The processor first looks for the data in the L1 cache. If the L1 cache misses, the processor looks in the L2 cache. If the L2 cache misses, the processor fetches the data from main memory. Some modern systems add even more levels of cache to the memory hierarchy, because accessing main memory is so slow.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%2012.png)

### Reducing Miss Rate

Cache misses can be reduced by changing capacity, block size, and/or associativity. The first step to reducing the miss rate is to understand the causes of the misses. The misses can be classified as compulsory, capacity, and conflict. The first request to a cache block is called a *compulsory miss*, because the block must be read from memory regardless of the cache design. *Capacity misses* occur when the cache is too small to hold all concurrently used data. *Conflict misses* are caused when several addresses map to the same set and evict blocks that are still needed.

Changing cache parameters can affect one or more type of cache miss. For example, increasing cache capacity can reduce conflict and capacity misses, but it does not affect compulsory misses. On the other hand, increasing block size could reduce compulsory misses (due to spatial locality) but might actually *increase* conflict misses (because more addresses would map to the same set and could conflict).

Memory systems are complicated enough that the best way to evaluate their performance is by running benchmarks while varying cache parameters. the figure plots miss rate versus cache size and degree of associativity for the SPEC2000 benchmark. This benchmark has a small number of compulsory misses, shown by the dark region near the x-axis. As expected, when cache size increases, capacity misses decrease. Increased associativity, especially for small caches, decreases the number of conflict misses shown along the top of the curve. Increasing associativity beyond four or eight ways provides only small decreases in miss rate.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%2013.png)

As mentioned, miss rate can also be decreased by using larger block sizes that take advantage of spatial locality. But as block size increases, the number of sets in a fixed size cache decreases, increasing the probability of conflicts. The figure plots miss rate versus block size (in number of bytes) for caches of varying capacity. For small caches, such as the 4-KB cache, increasing the block size beyond 64 bytes *increases* the miss rate because of conflicts. For larger caches, increasing the block size does not change the miss rate. However, large block sizes might still increase execution time because of the larger miss penalty.

![Untitled](Memory%20Systems%20(TODO)%20f4d8ed2c175644e8919b090d6392f985/Untitled%2014.png)

### Write Policy

Memory stores follow a similar procedure as loads. Upon a memory store, the processor checks the cache. If the cache misses, the cache block is fetched from main memory into the cache, and then the appropriate word in the cache block is written. If the cache hits, the word is simply written to the cache block.

Caches are classified as either write-through or write-back. In a *write-through* cache, the data written to a cache block is simultaneously written to main memory. In a *write-back* cache, a *dirty bit* ($D$) is associated with each cache block. $D$ is 1 when the cache block has been written and 0 otherwise. Dirty cache blocks are written back to main memory only when they are evicted from the cache. A write-through cache requires no dirty bit but usually requires more main memory writes than a write-back cache. Modern caches are usually write-back, because main memory access time is so large.

# Virtual Memory

# Memory-Mapped I/O

# IA-32 Memory and I/O Systems