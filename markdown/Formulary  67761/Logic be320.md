# Logic

# Proof Systems

## Definition

In a formal treatment of mathematics, all objects of study must be described in a well-defined syntax. Typically, syntactic objects are finite strings over some alphabet $\Sigma$, for example the symbols allowed by the syntax of a logic or simply the alphabet $\{0, 1\}$, in which case syntactic objects are bit-strings. Recall that $\Sigma^*$ denotes the set of finite strings of symbols from $\Sigma$.

In this section, the two types of mathematical objects we study are

- *mathematical statements* of a certain type and
- *proofs* for this type of statements.

By a statement type we mean for example the class of statements of the form that a given number $n$ is prime, or the class of statements of the form that a given graph $G$ has a Hamiltonian cycle, or the class of statements of the form that a given formula $F$ in propositional logic is satisfiable.

Consider a fixed type of statements. Let $\mathcal{S} \sube \Sigma^*$ be the set of (syntactic representations of) mathematical statements of this type, and let $\mathcal{P} \sube \Sigma^*$ be the set of (syntactic representations of) proof strings.

Every statement $s \in \mathcal{S}$ is either true or false. The *truth function*

$$
\tau : \mathcal{S} \longrightarrow \{0, 1\}
$$

assigns to each $s \in \mathcal{S}$ its truth value $\tau (s)$. This function $\tau$ defines the meaning, called the *semantics*, of objects in $\mathcal{S}$.

An element $p \in \mathcal{P}$ is either a (valid) proof for a statement $s \in \mathcal{S}$, or it is not. This can be defined via a *verification function*

$$
\phi: \mathcal{S} \times \mathcal{P} \longrightarrow \{0,1\},
$$

where $\phi (s, p)=1$ means that $p$ is a valid proof for statement $s$.

Without strong loss of generality we can in this section consider

$$
\mathcal{S} = \mathcal{P} = \{0,1\}^*,
$$

with the understanding that any string in $\{0, 1\}^*$ can be interpreted as a statement by defining syntactically wrong statements as being false statements.

<aside>
💡 A *proof system* is a quadruple $\Pi = (\mathcal{S}, \mathcal{P}, \tau, \phi)$, as above.

</aside>

<aside>
💡 A proof system $\Pi = (\mathcal{S}, \mathcal{P}, \tau, \phi)$ is *sound* if no false statement has a proof, i.e., if for all $s \in \mathcal{S}$ for which there exists $p \in \mathcal{P}$ with $\phi (s, p) = 1$, we have $\tau (s) = 1$.

</aside>

<aside>
💡 A proof system $\Pi = (\mathcal{S}, \mathcal{P}, \tau, \phi)$ is *complete* if every true statement has a proof, i.e., if for all $s \in \mathcal{S}$ with $\tau (s) = 1$, there exists $p \in \mathcal{P}$ with $\phi(s, p) = 1$.

</aside>

# Elementary General Concepts in Logic

<aside>
💡 A goal of logic is to provide a specific proof system $\Pi = (\mathcal{S}, \mathcal{P}, \tau, \phi)$ for which a very large class of mathematical statements can be expressed as an element of $\mathcal{S}$.

</aside>

However, such a proof system $\Pi = (\mathcal{S}, \mathcal{P}, \tau, \phi)$ can never capture *all* possible mathematical statements. For example, it usually does not allow to capture (self-referential) statements about $\Pi$, such as “$\Pi$ is complete”, as an element of $\mathcal{S}$. The use of common language is therefore unavoidable in mathematics and logic.

In logic, an element $s \in \mathcal{S}$ consist of one or more formulas (e.g. a formula, or a set of fomrulas, or a set of fomulas and a formula), and a proof consist of applying a certain sequence of syntactic steps, called a *derivation* or a *deduction*. Each step consists of applying one of a set of allowed syntactic rules, and the set of allowed rules is called a *calculus*. A rule generally has some place-holders that must be instantiated by concrete values.

In standard treatments of logic, the syntax of $\mathcal{S}$ and the semantics (the function $\tau$) are carefully defined. In contrast, the function $\phi$, which consists of verifying the correctness of each rule application step, is not completely explicitely defined. One only defines rules, but for example one generally does not define a syntax for expressing how the place-holders of the rules are instantiated.

<aside>
💡 The *syntax* of a logic defines an alphabet $\Lambda$ (of allowed symbols) and specifies which strings in $\Lambda^*$ are formulas (i.e., are syntactically correct).

</aside>

<aside>
💡 The *semantics* of a logic defines (among other things) a function $\text{free}$ which assigns to each formula $F = (f_1, f_2,..., f_k) \in \Lambda^*$ a subset $\text{free}(F) \sube \{1,...,k\}$ of the indices. If $i \in \text{free}(F)$, then the symbol $f_i$ is said to occur *free* in $F$.

</aside>

<aside>
💡 An *interpretation* consists of a set $\mathcal{Z} \sube \Lambda$ of symbols of $\Lambda$, a domain (a set of possible values) for each symbol in $\mathcal{Z}$, and a function that assigns to each symbol in $\mathcal{Z}$ a value in its associated domain.

</aside>

<aside>
💡 An interpretation is *suitable* for a formula $F$ if it assigns a value to all symbols $\beta \in \Lambda$ occurring free in $F$.

</aside>

<aside>
💡 The *semantics* of a logic also defines a function $\sigma$ assigning to each formula $F$, and each interpretation $\mathcal{A}$ suitable for $F$, a truth value $\sigma (\mathcal{F}, \mathcal{A})$ in $\{0, 1\}$. In treatments of logic one often writes $\mathcal{A}(F)$ instead of $\sigma (\mathcal{F}, \mathcal{A})$ and calls $\mathcal{A}(F)$ *the truth value of $F$ under interpretation $\mathcal{A}$.*

</aside>

<aside>
💡 A (suitable) interpretation $\mathcal{A}$ for which a formula $F$ is true, (i.e., $\mathcal{A}(F) = 1$) is called a *model* for $F$, and one also writes

$$
\mathcal{A} \vDash F.
$$

More generally, for a set $M$ of formulas, a (suitable) interpretation for which all formulas in $M$ are true is called a model for $M$, denoted as

$$
\mathcal{A} \vDash M.
$$

If $\mathcal{A}$ is not a model for $M$ one writes $\mathcal{A} \space \cancel \vDash \space M$.

</aside>

<aside>
💡 A formula $F$ (or a set $M$ of formulas) is called *satisfiable* if there exists a model for $F$ (or $M$), and *unsatisfiable* otherwise. The symbol $\bot$ is used for an unsatisfiable formula.

</aside>

<aside>
💡 A formula $F$ is called a *tautology* or *valid* if it is true for every suitable interpretation. The symbol $\top$ is used for a tautology.

</aside>

<aside>
💡 A formula $G$ is a *logical consequence* of a formula $F$ (or a set $M$ of formulas), denoted

$$
F \vDash G \space (\text{or} \space M \vDash G),
$$

if every interpretation suitable for both $F$ (or $M$) and $G$, which is a model for $F$ (for $M$), is also a model for $G$.

</aside>

<aside>
💡 Two formulas $F$ and $G$ are *equivalent*, denoted $F \equiv G$, if every interpretation suitable for both $F$ and $G$ yields the same truth value for $F$ and $G$, i.e., if each one is a logical consequence of the other:

$$
F \equiv G \stackrel{\mathrm{def}}{\iff} F \vDash G \space \text{and} \space G \vDash F.
$$

</aside>

<aside>
💡 If $F$ is a tautology, one also writes $\vDash F$.

</aside>

<aside>
💡 If $F$ and $G$ are formulas, then also $\neg F, (F \land G)$ and $(F \lor G)$ are formulas.

</aside>

<aside>
💡 $\mathcal{A}((F \land G)) = 1$ if and only if $\mathcal{A}(F) = 1$ and $\mathcal{A}(G) = 1$.
$\mathcal{A}((F \lor G)) = 1$ if and only if $\mathcal{A}(F) = 1$ or $\mathcal{A}(G) = 1$.
$\mathcal{A}(\neg F) = 1$          if and only if $\mathcal{A}(F) = 0$

</aside>

<aside>
📌 *For any formulas $F$, $G$ and $H$ we have*

1. $*F \land F \equiv F$ and $F \lor F \equiv F$ (idempotence)*
2. $*F \land G \equiv G \land F$ and $F \lor G \equiv G \lor F$ (commutativity)*
3. $*(F \land G) \land H \equiv F \land (G \land H)$ and $(F \lor G) \lor H \equiv F \lor (G \lor H)$ (associativity)*
4. $*F \land (F \lor G) \equiv F$ and $F \lor (F \land G) \equiv F$ (absorption)*
5. $*F \land (G \lor H) \equiv (F \land G) \lor (F \land H)$ (distributive law)*
6. $*F \lor (G \land H) \equiv (F \lor G) \land (F \lor H)$ (distributive law)*
7. $\neg\neg F \equiv F$ *(double negation)*
8. $*\neg (F \land G) \equiv \neg F \lor \neg G$ and $\neg (F \lor G) \equiv \neg F \land \neg G$ (de Morgan’s rules)*
9. $*F \lor \top \equiv \top$ and $F \land T \equiv F$ (tautology rules)*
10. $*F \lor \bot \equiv F$ and $F \land \bot \equiv \bot$ (unsatisfiability rules)*
11. $F \lor \neg F \equiv \top$ and $F \land \neg F \equiv \bot$.
</aside>

<aside>
📌 *A formula $F$ is a tautology if and only if $\neg F$ is unsatisfiable.*

</aside>

<aside>
📌 *The following three statements are equivalent:*

1. $\{F_1, F_2, ..., F_k\} \vDash G$
2. $*\{F_1 \land F_2 \land ... \land F_k\} \rightarrow G$ is a tautology*
3. $*\{F_1, F_2, ..., F_k, \neg G\}$ is unsatisfiable*
</aside>

# Logical Calculi

<aside>
💡 A *derivation rule* is a rule for deriving a formula from a set of formulas (called the precondition). We write

$$
\{F_1, ..., F_k\} \vdash_R G
$$

if G can be derived from the set $\{F_1, ..., F_k\}$ by rule $R$.

</aside>

<aside>
💡 (Informal.) The *application of a derivation rule* $R$ to a set $M$ of formulas means

1. Select a subset $N$ of $M$.
2. For the place-holders in $R$: specify formulas that appear in $N$ such that $N \vdash _R G$ for a formula $G$.
3. Add $G$ to the set $M$ (i.e., replace $M$ by $M \cup \{G\}$).
</aside>

<aside>
💡 A (logical) *calculus $K$* is a finite set of derivation rules: $K = \{R_1,...,R_m\}$.

</aside>

<aside>
💡 A *derivation* of a formula $G$ from a set $M$ of formulas in a calculus $K$ is a finite sequence (of some length $n$) of applications of rules in $K$, leading to $G$. More precisely, we have

- $M_0 := M$
- $M_i := M_{i - 1} \cup \{G_i\}$ for $1 \leq i \leq n$, where $N \vdash_{R_i} G_i$ for some $N \sube M_{i - 1}$ and for some $R_j \in K$, and where
- $G_n = G$

We write

$$
M \vdash_K G
$$

if there is a derivation of $G$ from $M$ in the calculus $K$.

</aside>

<aside>
💡 A derivation rule $R$ is *correct* if for every set $M$ of formulas and every formula $F$, $M \vdash_R F$ implies $M \vDash F$:

$$
M \vdash _R F \implies M \vDash F.
$$

</aside>

<aside>
💡 A calculus $K$ is *sound* or *correct* if for every set $M$ of formulas and every formula $F$, if $F$ can be derived from $M$ then $F$ is also a logical consequence of $M$:

$$
M \vdash _K F \implies M \vDash F,
$$

and $K$ is *complete* if for every $M$ and $F$, if $F$ is a logical consequence of $M$, then $F$ can also be derived from $M$:

$$
M \vDash F \implies M \vdash_K F.
$$

A calculus $K$ is hence sound and complete if

$$
M \vdash_K F \iff M \vDash F
$$

i.e., if logical consequence and derivability are identical. Clearly, a calculus is sound if and only if every derivation rule is correct. One writes $\vdash_K F$ if $F$ can be derived in $K$ from the empty set of formulas. Note that if $\vdash_K F$ for a sound calculus, then $\vDash F$, i.e., $F$ is a tautology.

</aside>

<aside>
📌 *If $\{F_1, ..., F_k\} \vdash_K G$ holds for a sound calculus, then*

$$
\vDash ((F_1 \land ... \land F_k) \rightarrow G).
$$

</aside>

# Propositional Logic

<aside>
💡 (Syntax.) An *atomic formula* is of the form $A_i$ with $i \in \mathbb{N}$. A *formula* is defined as follows:

- An atomic fomula is a formula.
- If $F$ and $G$ are formulas, then also $\neg F, (F \land G)$ and $(F \lor G)$ are formulas.
</aside>

<aside>
💡 (Semantics.) For a set $Z$ of atomic formulas, an interpretation $\mathcal{A}$, called *truth assignment*, is a function $\mathcal{A} : Z \longrightarrow \{0,1\}$. A truth assignment $\mathcal{A}$ is suitable for a formula $F$ if $Z$ contains all atomic formulas appearing in $F$. The semantics (i.e., the truth value $\mathcal{A}(F)$ of a formula $F$ under interpretation $\mathcal{A}$) is defined by $\mathcal{A}(F) = \mathcal{A}(A_i)$ for any atomic formula $F = A_i$,

</aside>

<aside>
💡 A *literal* is an atomic formula or the negation of an atomic formula.

</aside>

<aside>
💡 A formula $F$ is in *conjunctive normal form (CNF)* if it is a conjunction of disjunctions of literals, i.e., if it is of the form

$$
F = (L_{11} \lor ... \lor L_{1m_1}) \land ... \land (L_{n1} \lor ... \lor L_{nm_n})
$$

for some literals $L_{ij}$.

</aside>

<aside>
💡 A formula $F$ is in *disjunctive normal form (DNF)* if it is a disjunction of conjunctions of literals, i.e., if it is of the form

$$
F = (L_{11} \land ... \land L_{1m_1}) \lor ... \lor (L_{n1} \land ... \land L_{nm_n})
$$

for some literals $L_{ij}$.

</aside>

<aside>
📖 *Every formula is equivalent to a formula in CNF and also to a formula in DNF.*

</aside>

<aside>
💡 A *clause* is a set of literals.

</aside>

<aside>
💡 The set of clauses associated to a formula

$$
F = (L_{11} \land ... \land L_{1m_1}) \lor ... \lor (L_{n1} \land ... \land L_{nm_n})
$$

in CNF, denoted as $\mathcal{K}(F)$, is the set

$$
\mathcal{K}(F) \stackrel{\mathrm{def}}{=} \{\{L_{11},...,L_{1m_1}\},...,\{L_{n1},...,L_{nm_n}\}\}.
$$

The set of clauses associated with a set $M = \{F_1,...F_k\}$ of formulas is the union of their clause sets:

$$
\mathcal{K}(M) \stackrel{\mathrm{def}}{=} \bigcup_{i=1}^k \mathcal{K}(F_i).
$$

</aside>

<aside>
💡 A clause $K$ is a *resolvent* of clauses $K_1$ and $K_2$ if there is a literal $L$ such that $L \in K_1$, $\neg L \in K_2$, and

$$
K = (K_1 \setminus \{L\}) \cup (K_2 \setminus \{\neg L\}).
$$

</aside>

<aside>
📌 *The resolution calculus is sound, i.e., if $\mathcal{K} \vdash_{\text{Res}} K$ then $\mathcal{K} \vDash K$.*

</aside>

<aside>
📖 *A set $M$ of formulas is unsatisfiable if and only if $\mathcal{K}(M) \vdash_{\text{Res}} \varnothing$.*

</aside>

# Predicate Logic (First-order Logic)

<aside>
💡 (Syntax of predicate logic.)

- A *variable symbol* is of the form $x_i$ with $i \in \mathbb{N}$.
- A *function symbol* is of the form $f_i^{(k)}$ with $i, k \in \mathbb{N}$, where $k$ denotes the number of arguments of the function. Function symbols for $k = 0$ are called *constants*.
- A *predicate symbol* is of the form $P_i^{(k)}$ with $i, k \in \mathbb{N}$, where $k$ denotes the number of arguments of the predicate.
- A *term* is defined inductively: A variable is a term, and if $t_1, ..., t_k$ are terms, then $f_i^{(k)} (t_1,...,t_k)$ is a term. For $k = 0$ one writes no parentheses.
- A *formula* is defined inductively:
    - For any $i$ and $k$, if $t_1,...,t_k$ are terms, then $P_i^{(k)}(t_1,...,t_k)$ is a formula, called an *atomic* formula
    - If $F$ and $G$ are formulas, then $\neg F$, $(F \land G)$, and $(F \lor G)$ are formulas.
    - If $F$ is a formula, then, for any $i$, $\forall x_i \space F$ and $\exists x_i \space F$ are formulas.
</aside>

<aside>
💡 Every occurrence of a variable in a formula is either *bound* or *free*. If a variable $x$ occurs in a (sub-) formula of the form $\forall x \space G$ or $\exists x \space G$, then it is bound, otherwise it is free. A formula is *closed* if it contains no free variables.

</aside>

<aside>
💡 For a formula $F$, a variable $x$ and a term $t$, $F[x/t]$ denotes the formula obtained from $F$ by substituting every free occurrence of $x$ by $t$.

</aside>

<aside>
💡 An *interpretation* or *structure* is a tuple $\mathcal{A} = (U, \phi, \psi, \xi)$ where

- $U$ is a non-empty set, the so-called *universe*
- $\phi$ is a function assigning to each function symbol (in a certain subset of all function symbols) a function, where for $k$-ary function symbol $f$. $\phi(f)$ is a function
- $\psi$ is a function assigning to each predicate symbol (in a certain subset of all predicate symbols) a function, where for a $k$-ary predicate symbol $P$, $\psi(P)$ is a function $U^k \longrightarrow \{0,1\}$
- $\xi$ is a function assigning to each variable symbol (in a certain subset of all variable symbols) a value in $U$.
</aside>

<aside>
💡 An interpretation (structure) $\mathcal{A}$ is *suitable* for a formula $F$ if it defines all function symbols, predicate symbols, and freely occurring variables of $F$.

</aside>

<aside>
💡 (Semantics.) For an interpretation (structure) $\mathcal{A} = (U, \phi, \psi, \xi)$, we define the value (in $U$) of terms and the truth value of formulas under that structure.

- The value $\mathcal{A}(t)$ of a term $t$ is defined recursively as follows:
    - If $t$ is a variable, i.e., $t = x_i$, then $\mathcal{A}(t) = \xi (x_i)$.
    - If $t$ is of the form $f(t_1, ..., t_k)$ for terms $t_1,...,t_k$ and a $k$-ary function symbol $f$, then $\mathcal{A}(t) = \phi(f)(\mathcal{A}(t_1),...,\mathcal{A}(t_k))$.
- The truth value of a formula $F$ is defined recursively by

and

- If $F$ is of the form $F = P(t_1,...,t_k)$ for terms $t_1,...,t_k$ and a $k$-ary predicate symbol $P$, then $\mathcal{A}(F) = \psi(P)(\mathcal{A}(t_1),...,\mathcal{A}(t_k))$.
- If $F$ is of the form $\forall x \space G$ or $\exists x \space G$, then let $\mathcal{A}_{[x \to u]}$ for $u \in U$ be the same structure as $\mathcal{A}$ except that $\xi (x)$ is overwritten by $u$ (i.e., $\xi (x) = u$):

$$
\begin{align*}
\mathcal{A}(\forall x \space G) & = \begin{cases} 1 & \text{if $\mathcal{A}_{[x \to u]}(G) = 1$ for all $u \in U$}\\
      0 & \text{else}
\end{cases} \\
\mathcal{A}(\exists x \space G) & = \begin{cases} 1 & \text{if $\mathcal{A}_{[x \to u]}(G) = 1$ for some $u \in U$}\\
      0 & \text{else}
\end{cases}
\end{align*}
$$

</aside>

<aside>
📌 *For any formulas $F$, $G$ and $H$, where $x$ does not occur free in $H$, we have*

1. $\neg (\forall x \space F) \equiv \exists x \space \neg F$
2. $\neg (\exists x \space F) \equiv \forall x \space \neg F$
3. $(\forall x \space F) \land (\forall x \space G) \equiv \forall x \space (F \land G)$
4. $(\exists x \space F) \lor (\exists x \space G) \equiv \exists x \space  (F \lor G)$
5. $\forall x \space \forall y \space F \equiv \forall y \space \forall x \space F$
6. $\exists x \space \exists y \space F \equiv \exists y \space \exists x \space F$
7. $(\forall x \space F) \land H \equiv \forall x \space (F \land H)$
8. $(\forall x \space F) \lor H \equiv \forall x \space (F \lor H)$
9. $(\exists x \space F) \land H \equiv \exists x \space (F \land H)$
10. $(\exists x \space F) \lor H \equiv \exists x \space (F \lor H)$
</aside>

<aside>
📌 *If one replaces a sub-formula $G$ of a formula $F$ by an equivalent (to $G$) formula $H$, then the resulting formula is equivalent to $F$.*

</aside>

<aside>
📌 *For a formula $G$ in which $y$ does not occur, we have*

- $\forall x \space G \equiv \forall y \space G[x/y]$
- $\exists x \space G \equiv \exists y \space G [x/y]$
</aside>

<aside>
💡 A formula in which no variable occurs both as a bound and as a free variable and in which all variables appearing after the quantifiers are distinct is said to be in *rectified* form.

</aside>

<aside>
📌 *For any formula $F$ and any term $t$ we have*

$$
\forall x \space F \vDash F[x/t].
$$

</aside>

<aside>
💡 A formula of the form

$$
Q_1x_1\space Q_2x_2 \space ... \space Q_nx_n \space G
$$

where the $Q_i$ are arbitrary quantifiers ($\forall$ or $\exists$) and $G$ is a formula free of quantifiers, is said to be in *prenex form.*

</aside>

<aside>
💡 In order to transform a formula into prenex form one first transforms the formula into an equivalent formula in rectified from and then applies the following equivalences

to move up all quantifiers in the formula tree, resulting in a prenex form of the formula.

</aside>

<aside>
📖 *For every formula there is an equivalent formula in prenex form.*

</aside>

<aside>
📖 $\neg \exists x \space \forall y \space (P(y, x) \leftrightarrow \neg P(y ,y))$

</aside>

<aside>
📎 *There exists no set that contains all sets $S$ that do not contain themselves, i.e., $\{S \space | \space S \notin S\}$ is not a set.*

</aside>

<aside>
📎 *The set $\{0, 1\}^\infty$ is uncountable.*

</aside>

<aside>
📎 *There are uncomputable functions $\mathbb{N} \longrightarrow \{0, 1\}.$*

</aside>

<aside>
📎 *The function $\mathbb{N} \longrightarrow \{0,1\}$ assigning to each $y \in \mathbb{N}$ the complement of what program $y$ outputs on input $y$, is uncomputable.*

</aside>