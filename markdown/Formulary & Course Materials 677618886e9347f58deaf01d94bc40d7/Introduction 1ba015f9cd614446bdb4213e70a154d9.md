# Introduction

# The Art of Managing Complexity

An important characteristic that separates an engineer or computer scientist from a normal programmer/developer is a systematic approach to managing complexity. Digital systems these days are built from billions of transistors, we would never be able to understand them by writing equations that describe the movement of electrons in a transistor and solving all of these equations simultaneously. The keyword here is abstraction.

## Abstraction

A system can be viewed from many levels of abstraction. Specifically in electronic computing systems we typically distinguish the following levels of abstraction:

In this course we focus on the levels of abstraction from digital circuits through computer architecture. When working on a level of abstraction it is always recommended to have knowledge of the levels just below and above. A computer scientist can not fully optimize code without understanding the architecture for which the program is written.

## Discipline

Discipline is the act of intentionally restricting design choices such that one can work more productively at a higher level of abstraction. Using interchangeable parts is a familiar application of discipline. By limiting our choices to digital circuits we can easily combine components into sophisticated systems that ultimately outperform equivalent systems built using analog components in many applications.

## The three Y’s

Additionally, designers use the three “y’s” to manage complexity:

- *hierarchy*: involves dividing a system into modules, then further subdividing each of these modules until the pieces are easy to understand.
- *modularity*: states that the modules have well-defined functions and interfaces, so that they connect together easily without unanticipated side effects.
- *regularity*: seeks uniformity among the modules. Common modules are reused many times, reducing the number of distinct modules that must be designed.

# The Digital Abstraction

Most physical variables are continuous, especially in the realm of electrical engineering. Digital systems however represent information with *discrete-valued variables*, that is, variables with a finite number of distinct values.

The *amount of information* $D$ in a discrete valued variable with $N$ distinct states is measured in units of *bits* as 

$$
D = \log_2N \space \text{bits}.
$$

A binary variable conveys $\log_22=1$ bit of information. Of course, the word bit is short for binary digit. A continuous signal theoretically contains an infinite amount of information because it can take on an infinite number of values. In practice however, noise and measurement errors limit the information to only 10 to 16 bits for most continuous signals.

# Number Systems

In digital systems, binary or hexadecimal numbers are often more convenient than the base-10 number system.

## Decimal Numbers

Decimal digits are joined together to form longer decimal numbers. Each column of a decimal number has ten times the weight of the previous column. From right to left, the column weight are 1, 10, 100, 1000 and so on. Decimal numbers are referred to as *base* 10. The base is indicated by a subscript after the number to prevent conf

![Untitled](Introduction%201ba015f9cd614446bdb4213e70a154d9/Untitled.png)