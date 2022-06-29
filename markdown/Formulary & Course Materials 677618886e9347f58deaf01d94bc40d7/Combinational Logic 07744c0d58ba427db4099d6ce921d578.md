# Combinational Logic

# Introduction

A *circuit* in digital electronics is a network that processes discrete-valued variables. A circuit can be viewed as a black box, as shown, with 

- one or more discrete-valued *input terminals*
- one or more discrete-valued *output terminals*
- a *functional specification* describing the relationship between inputs and outputs
- a *timing specification* describing the delay between inputs changing and outputs responding

Inside the black box, circuits are composed of nodes and elements. An *element* is itself a circuit with inputs, outputs and a specification. A *node* is a wire, whose voltage conveys a discrete-valued variable. Nodes are classified as *input, output* or *internal*. Inputs receive values from the external world, outputs deliver values to the external world. Wires that are not input or outputs are called internal nodes.

The figure illustrates a circuit with three elements, E1, E2 and E3, and six nodes. Nodes $A$, $B$ and $C$ are inputs. $Y$ and $Z$ are outputs. n1 is an internal node between E1 and E3.

Digital circuits are classified as *combinational* or *sequential*. A combinational circuit’s outputs depend only on the current values of the inputs; in other words, it combines the current input values to compute the output. For example a logic gate is a combinational circuit. A sequential circuit’s outputs depend on both current and previous values of the inputs; in other words, it depends on the input sequence.

![Untitled](Combinational%20Logic%2007744c0d58ba427db4099d6ce921d578/Untitled.png)