# Hoare-Logic

# Motivation

A formal system for verification of a program’s correctness.

# Hoare Triples

The central feature of Hoare logic is the Hoare triple. It describes how the execution of a piece of code changes the state of the computation. It is of the form 

$$
\{P\} \space S \space \{Q\}
$$

where $P$ and $Q$ are assertions and $S$ is a command/piece of code. $P$ is called the *precondition* and $Q$ the *postcondition*. $P$ and $Q$ are formulae in predicate logic. When the precondition is met, executing the command establishes the postcondition.

The understanding of a Hoare triple is straightforward: Whenever $P$ holds of the state before execution of $S$, then either $S$ will not terminate or $Q$ will hold afterwards, i.e., 

$$
P \stackrel{S}{\implies}  Q.
$$

# Application

## Forward Conclusion

- Defines what can be concluded from original assumptions
- Very useful when an invariante is to hold
- Simulates the execution of the program
- Easy to understand, however many details must be stored
- Problem: changing the value of a variable can influence other assumptions/assertions. We need to change the name of the variable whose value is changed in the postcondition to be able to reference such a variable correctly.

## Backward Conclusion

- Identifies sufficient conditions to guarantee a given outcome
- If the outcome is desirable, then program correctness follows from those conditions
- If the outcome is undesirable, then the conditions suffice to generate a bug
- Often times of high practical use. One must understand what each and every command contributes to reaching a certain state

# Assignment

A variable is substituted by another variable. $Q'$ is valid if and only if $P \implies Q'.$

# Composition

A triple $\{P\} \space S_1;S_2\space \{Q\}$ is valid if there exists assertion $R$ such that

1. $\{P\} \space S_1 \space \{R\}$ is valid and
2. $\{R\} \space S_2 \space \{Q\}$ is valid

# Branching

A triple $\{P\} \space \text{if} \space (b) \space S_1 \space\text{else} \space S_2 \space \{Q\}$ is valid if there exist assertions $Q_1, Q_2$ such that

1. $\{P \land b\} \space S_1 \space \{Q_1\}$ is valid and
2. $\{P \land \lnot b\} \space S_2 \space \{Q_2\}$ is valid and
3. $Q_1 \lor Q_2 \implies Q$

# Looping

A triple $\{P\} \space \text{while} \space (b)\space  S;\space \{Q\}$ is valid if there exists an invariant $I$ such that

1. Invariant is valid before entering the loop, i.e., $P \implies I$
2. Invariant is valid after executing the loop body, i.e., $\{I \land b\} \space S \space \{I\}$ is a valid triple
3. Invariant implies postcondition, i.e., $(I \land \lnot b) \implies Q$

Note that this only holds if there are no non-local control transfers in the loop body (i.e., no continue; or break; statements). Invariants must be neither too strong nor too weak.

## Methodology for finding Invariants

1. Define an invariant first and let the other steps guide you. What brings us closer to the goal every iteration? What needs to hold after every iteration?
2. Write a body for the loop that makes the invariant valid
3. Write the loop condition such that it implies the postcondition if it is false
4. Write the initialisation such that the code ensures the invariant

## Partial Correctness vs. Total Correctness

Without proving that $S$ terminates we can only prove partial correctness of a Hoare triple $\{P\} \space S \space \{Q\}$. $S$ could run into system faults (out of memory, OS killing the process etc.) or enter an infinite loop. We can prove the latter. Idea: map the state after execution of the loop to a natural number such that that number decreases after every execution of the loop body. Then we can find proof that the loop test was $\text{false}$ if that number goes to zero in a finite amount of steps. Therefore we would have shown termination. Example: summation of 1 through $x$. Map to: $x - 1$. Positive at the start ($x \geq 0, i == 0$), decreases in every iteration ($x$ unchanged, $i = i + 1$), when $(x-i)==0$ then $x == i$ and the loop terminates.

# Weakest Precondition

For preconditions $P_1, P_2$, if $P_1 \implies P_2$ we say that $P_2$ is weaker than $P_1$. When concluding in the backwards direction one should always find the weakest preconditions as one can then also conclude the stronger ones. Without loops and methods there exists a unique weakest precondition for every program segment $S$, denoted $\text{wp}(S,Q)$. The weakest precondition is $\text{true}$.

# Further Resources

[Hoare logic - Wikipedia](https://en.wikipedia.org/wiki/Hoare_logic)