# Mathematical Reasoning, Proofs, and a First Approach to Logic

# Mathematical Statements

<aside>
💡 A mathematical statement that is either *true* or *false* is also called a *proposition*.

</aside>

<aside>
💡 A true proposition is often called a *theorem*, a *lemma*, or a *corollary*. A proposition not known to be true or false is often called a *conjecture* or an *assumption*.

</aside>

# The Concept of a Proof

<aside>
💡 (Informal.) A *proof* of a statement $S$ is a sequence of simple, easily verifiable, consecutive steps. The proof starts from a set of axioms (things postulated to be true) and known (previously proved) facts. Each step corresponds to the application of a derivation rule to a few already proven statements, resulting in a newly proved statement, until the final step results in $S$.

</aside>

# A First Introduction to Propositional Logic

<aside>
💡 The logical values (constants) “true” and “false” are usually denoted as 1 and 0, respectively.

</aside>

<aside>
💡 Logical operators:

1. The *negation* (logical NOT) of a proposition $A$, denoted as $\neg A$, is true if and only if $A$ is false.
2. The *conjunction* (logical AND) of two propositions $A$ and $B$, denoted $A \land B$, is true if and only if both $A$ and $B$ are true.
3. The *disjunction* (logical OR) of two propositions $A$ and $B$, denoted $A \lor B$, is true if and only if $A$ or $B$ (or both) are true.
</aside>

<aside>
💡 (Informal.) The *implication* of two propositions $A$ and $B$, denoted as $A \rightarrow B$, is equivalent to $\neg A \lor B$.

</aside>

<aside>
💡 (Informal.) The two-sided implication of two propositions $A$ and $B$, denoted as $A \leftrightarrow B$, is equivalent to $(A \rightarrow B) \land (B \rightarrow A)$.

</aside>

<aside>
💡 A correctly formed expression involving the propositional symbols $A$, $B$, $C$,... and logical operators is called a *formula* (of propositional logic).

</aside>

<aside>
💡 Two formulas $F$ and $G$ (in propositional logic) are called *equivalent*, denoted as $F \equiv G$, if they correspond to the same function, i.e., if the truth values are equal for all truth assignments to the propositional symbols appearing in $F$ or $G$
.

</aside>

<aside>
📌 *1) $A \land A \equiv A$ and $A \lor A \equiv A$ (idempotence)*

*2) $A \land B \equiv B \land A$ and $A \lor B \equiv B \lor A$ (commutativity of $\land$ and $\lor$)*

*3) $(A \land B) \land C \equiv A \land (B \land C)$ and $(A \lor B) \lor C \equiv A \lor (B \lor C)$ (associativity)*

*4) $A \land (A \lor B) \equiv A$ and $A \lor (A \land B) \equiv A$ (absorption)*

*5) $A \land (B \lor C) \equiv (A \land B) \lor (A \land C)$ (first distributive law)*

*6) $A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)$ (second distributive law)*

*7) $\neg \neg A \equiv A$ (double negation)*

*8) $\neg (A \land B) \equiv \neg A \lor \neg B$ and $\neg(A \lor B) \equiv \neg A \land \neg B$ (de Morgan’s rules).*

</aside>

<aside>
💡 A formula $G$ is a *logical consequence* of a formula $F$, denoted

$$
F \vDash G,
$$

if for all truth assignments to the propositional symbols appearing in $F$ or $G$, the truth value of $G$ is 1 if the truth value of $F$ is 1.

</aside>

<aside>
💡 Two formulas $F$ and $G$ are equivalent if and only if each one is a logical consequence of the other, i.e.,

$$
F \equiv G \iff F \vDash G \text{ and } G \vDash F.
$$

</aside>

<aside>
💡 A formula $F$ (in propositional logic) is called a *tautology* or *valid* if it is true for all truth assignments of the involved propositional symbols. One often writes $\vDash F$ to say that $F$ is a tautology.

</aside>

<aside>
💡 A formula $F$ (in propositional logic) is called *satisfiable* if it is true for at least one truth assignment of the involved propositional symbols, and it is called *unsatisfiable* otherwise.

</aside>

<aside>
💡 The symbol $\top$ is sometimes used to denote a tautology, and the symbol $\bot$ is sometimes used to denote an unsatisfiable formula. One sometimes writes $F \equiv \top$ to say that $F$ is a tautology, and $F \equiv \bot$ to say that $F$ is unsatisfiable. For any formula $F$ we have

$$
F \lor \neg F \equiv \top \text{ and } F \land \neg F \equiv \bot .
$$

</aside>

<aside>
📌 *A formula $F$ is a tautology if and only if $\neg F$ is unsatisfiable.*

</aside>

<aside>
📌 *For any formulas $F$ and $G$, $F \rightarrow G$ is a tautology if and only if $F \vDash G$.*

</aside>

# A First Introduction to Predicate Logic

<aside>
💡 A $k$-ary predicate $P$ on $U$ is a function $U ^{k} \longrightarrow \{0, 1\}.$

</aside>

<aside>
💡 For a universe $U$ and a predicate $P(x)$ we define the following logical statements:

- $\forall x \space P(x)$ stands for: $P(x)$ is true *for all* $x$ in $U$.
- $\exists x \space P(x)$ stands for: $P(x)$ is true for *some* $x$ in $U$, i.e., there *exists* an $x \in U$ for which $P(x)$ is true.

More generally, for a formula $F$ with a variable $x$, which for each value $x \in U$ is either true or false, the formula $\forall x \space F$ is true if and only if $F$ is true for all $x$ in $U$, and the formula $\exists x \space F$ is true if and only if $F$ is true for some $x$ in $U$.

</aside>

<aside>
💡 Some useful rules:

- $\forall x \space P(x) \vDash \exists x \space P(x)$
- $\forall x \space P(x) \land \forall x \space Q(x) \equiv \forall x \space (P(x) \land Q(x))$
- $\exists x \space (P(x) \land Q(x)) \vDash \exists x \space P(x) \land \exists x \space Q(x)$
- $\neg \forall x \space P(x) \equiv \exists x \space \neg P(x)$
- $\neg \exists x \space P(x) \equiv \forall x \space \neg P(x)$
- $\exists y \space \forall x \space P(x, y) \vDash \forall x \space \exists y \space P(x, y)$
</aside>

# Logical Formulas vs. Mathematical Statements

<aside>
📌 *For any two formulas $F$ and $G$, if $F \vDash G$, then*

$$
F \text{ is valid} \implies G \text{ is valid}
$$

*is true.*

</aside>

# Some Proof Patterns

<aside>
💡 The proof step of *composing implications* is as follows: If $S \implies T$ and $T \implies U$ are both true, then one concludes that $S \implies U$ is also true.

</aside>

<aside>
📌 $*(A \rightarrow B) \land (B \rightarrow C) \vDash A \rightarrow C.$ (transitivity of $\rightarrow$)*

</aside>

<aside>
💡 A *direct proof* of an implication $S \implies T$ works by *assuming* $S$ and then proving $T$ under this assumption.

</aside>

<aside>
💡 An *indirect proof* of an implication $S \implies T$ proceeds by assuming that $T$ is false and proving that $S$ is false, under this assumption.

</aside>

<aside>
📌 $\neg B \rightarrow \neg A \vDash A \rightarrow B.$

</aside>

<aside>
💡 A proof of a statement $S$ by use of the so-called *modus ponens* proceeds in three steps:

1. Find a suitable mathematical statement $R$.
2. Prove $R$.
3. Prove $R \implies S$.
</aside>

<aside>
📌 $A \land (A \rightarrow B) \vDash B$.

</aside>

<aside>
💡 A proof of a statement $S$ by *case distinction* proceeds in three steps:

1. Find a finite list $R_1,..., R_k$ of mathematical statements (the *cases*).
2. Prove that one of the $R_i$ is true (one case occurs).
3. Prove $R_i \implies S$ for $i = 1,..., k$.
</aside>

<aside>
📌 *For every $k$ we have*

$$
(A_1 \lor ... \lor A_k) \land (A_1 \rightarrow B) \land ... \land (A_k \rightarrow B) \vDash B.
$$

</aside>

<aside>
💡 A *proof by contradiction* of a statement $S$ proceeds in three steps:

1. Find a suitable mathematical statement $T$.
2. Prove that $T$ is false.
3. Assume that $S$ is false and prove (from this assumption) that $T$ is true (a contradiction).
</aside>

<aside>
📌 $(\neg A \rightarrow B) \land \neg B \vDash A$.

</aside>

<aside>
💡 Consider a set $\mathcal{X}$ of parameters and for each $x \in \mathcal{X}$ a statement, denoted $S_x$. An *existence proof* is a proof of the statement that $S_x$ is true for at least one $x \in \mathcal{X}$. An existence proof is *constructive* if it exhibits an $a$ for which $S_a$ is true, and otherwise it is *non-constructive*.

</aside>

<aside>
📖 *The Pigeonhole Principle:
If a set of $n$ objects is partitioned into $k < n$ sets, then at least one of these sets contains at least $\left\lceil \frac{n}{k} \right\rceil$ objects.*

</aside>

<aside>
💡 Consider a set $\mathcal{X}$ of parameters and for each $x \in \mathcal{X}$ a statement, denoted $S_x$. A *proof by counterexample* is a proof of the statement that $S_x$ is not true for all $x \in \mathcal{X}$, by exhibiting an $a$ (called *counterexample*) such that $S_a$ is false. This corresponds to an existence proof.

</aside>

<aside>
💡 *Proof by induction*:

1. *Basis step*. Prove $P(0)$.
2. *Induction step*. Prove that for any arbitrary $n$ we have $P(n) \implies P(n + 1)$.
</aside>

<aside>
📖 *For the universe $\mathbb{N}$ and an arbitrary unary predicate $P$ we have*

$$
P(0) \land \forall n \space (P(n) \rightarrow P(n + 1)) \implies \forall n \space P(n).
$$

</aside>
