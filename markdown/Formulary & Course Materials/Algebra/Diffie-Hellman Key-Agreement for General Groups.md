# Diffie-Hellman Key-Agreement for General Groups

(Copied/paraphrased/annotated from the script on Discrete Mathematics HS21 by Prof. Ueli Maurer)

The Diffie-Hellman protocol was described earlier ([Diffie-Hellman Key-Agreement](../Number%20Theory/Diffie-Hellman%20Key-Agreement.md))  for the group $\mathbb{Z}^*_p$. As an application of general cyclic groups we mention that the Diffie-Hellman protocol works just as well in any cyclic group $G = \langle g \rangle$ for which computing $x$ from $g^x$ (i.e., the *discrete logarithm problem*) is computationally infeasible. Of course, one needs to apply a suitable mapping from $G$ to a reasonable key space.

Elliptic curves (not discussed here) are an important class of cyclic groups used in cryptography.