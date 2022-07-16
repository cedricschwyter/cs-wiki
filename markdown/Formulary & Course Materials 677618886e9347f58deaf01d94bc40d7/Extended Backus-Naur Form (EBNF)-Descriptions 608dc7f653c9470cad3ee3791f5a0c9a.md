# Extended Backus-Naur Form (EBNF)-Descriptions

# EBNF Rules

An EBNF rule is of the form

$$
\textit{LHS} \Longleftarrow \text{RHS}
$$

where LHS stands for left-hand side and RHS for right-hand side. Usually the LHS is denoted in lowercase, cursive font. Since cursive can be hard to differentiate in handwriting, names appearing on the RHS can also be wrapped in < and > to denote a reference to another EBNF rule. The LHS is the name of an EBNF rule, whereas the RHS describes it. The RHS can contain names of other EBNF rules, characters, or combinations of the four control forms.
EBNF descriptions only allow for statements about the *syntax* of the symbols of a language, not however about the *semantics*, i.e., the meaning of those symbols.

# Control Forms

- Sequence
    - order is relevant, example: $\textit{myrule} \Longleftarrow \textit{form\_1} \space \textit{form\_2} \space \textit{form\_3}$ , where $\textit{form\_1}$, $\textit{form\_2}$, $\textit{form\_3}$ are other EBNF rules defined previously in the description
- Decision
    - a set of alternatives, order irrelevant. Denoted by a vertical bar. Example: $\textit{room} \Longleftarrow \textit{room\_1} \space | \space \textit{room\_2} \space | \space \textit{room\_3}$. Sequence preceeds decision, however in order to prevent misunderstandings use parentheses when using |
    - Option: elements wrapped in square brackets, can be chosen, can also be omitted. Example: $\textit{initials} \Longleftarrow T \space [ \space R \space ] \space G$. If the option is omitted it is denoted $\epsilon$, which represents the empty character
- Repetition
    - denoted by curly braces, signifying its contents can be repeated $0, 1,...$ times, where 0 times represents a choice of $\epsilon$. Example:
    
    $$
    \begin{align*}
    \textit{digit} & \Longleftarrow 1 \space | \space 2 \space | \space 3 \space | \space 4 \space | \space 5 \space | \space 6 \space | \space 7 \space | \space 8 \space | \space 9 \space | \space 0 \\
    \textit{sequence} & \Longleftarrow \textit{digit} \space \{ \textit{digit} \space \} \\
    \textit{integer} & \Longleftarrow [\space + \space | \space - \space] \space \textit{digit} \space \{ \textit{digit} \space\} \space 
    \end{align*}
    $$
    
- Recursion
    - an EBNF rule that is defined in term of itself, i.e., the name of the rule appears on the RHS of the rule (directly or indirectly, where indirectly means first having to substitute the definition(s) of other EBNF rules to see that the name of the rule appears on the RHS). For such a rule to be legal according to the rules for EBNF rules there must exist a way to remove the name of the rule from the RHS of the rule, i.e., by substituting appropriately. For example, there are no legal symbols for the rule $\textit{pos\_integer} \Longleftarrow \textit{digit} \space \{ \space \textit{pos\_integer} \space \}$}, as whenever we substitute $\textit{pos\_integer}$ on the RHS we still have $\textit{pos \_integer}$ on the RHS:
        
        $$
        \begin{align*}
        & \textit{pos\_integer} \\
        & \textit{digit} \space \{ \space \textit{pos\_integer} \space \} \\
        & \textit{digit} \space \textit{digit} \space \{ \space \textit{pos\_integer} \space \} \\
        & \textit{digit} \space \textit{digit} \space \textit{digit} \space \{ \space \textit{pos\_integer} \space \} \\
        &...
        \end{align*}
        $$
        
        The following rule however does allow for legal symbols: $\textit{pos\_integer} \Longleftarrow \textit{digit} \space \{ \space \textit{pos\_integer} \space \} \space | \space \textit{digit}$
        
        $$
        \begin{align*}
        & \textit{pos\_integer} \\
        & \textit{digit} \space \{ \space \textit{pos\_integer} \space \} \\
        & \textit{digit} \space \textit{digit} \space \{ \space \textit{pos\_integer} \space \} \\
        & \textit{digit} \space \textit{digit} \space \textit{digit}
        \end{align*}
        $$
        

# Formal Proof of Validity of a Symbol according to a given EBNF Description/Rule

Build a step-by-step derivation table or a derivation tree. Example for the above EBNF description of an integer:

$$
\begin{align*}
& \textit{integer} \\
& [\space + \space | \space - \space ] & \space \textit{digit} &\space \{\space \textit{digit} \space \} \\
& [\space + \space] & \space \textit{digit} & \space \{ \space\textit{digit} \space\} \\
& + & \textit{digit} & \space \{\space \textit{digit} \space\} \\
&& 1 & \space \{\space \textit{digit} \space\} \\
&&& \textit{digit} & \space \{\space \textit{digit} \space\} \\
&&& 2 \space &\{\space \textit{digit} \space\}\\
&&&& \textit{digit} \\
&&&& 8
\end{align*}
$$

An EBNF description can also be depicted as a graph, and a symbol is valid if there exists a path from start to finish through that graph:

![2022-01-25_23-50.png](Extended%20Backus-Naur%20Form%20(EBNF)-Descriptions%20608dc7f653c9470cad3ee3791f5a0c9a/2022-01-25_23-50.png)

# Equivalence of EBNF Descriptions

Two EBNF descriptions are equivalent if they recognize the same set of symbols as legal.