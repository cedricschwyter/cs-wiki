# Complex Numbers (TODO)

# Definition of Complex Numbers

<aside>
💡 We define a new number, namely $i$, that solves the equation $x^2 + 1=0$. We will call this number the *imaginary unit* and assign the value $i = \sqrt{-1}$.

</aside>

<aside>
💡 A *complex number* $z$ is a number of the form $z = x + iy$, where $x$ and $y$ are real numbers and $i$ the imaginary unit.
$x$ is called the *real part* and is denoted $x = \text{Re}(z)$
$y$ is called the *imaginary part* and is denoted $y = \text{Im}(z)$

</aside>

<aside>
💡 The set of all complex numbers is called $\mathbb{C} = \{z=x+iy \space | \space x, y \in \mathbb{R}\}$.

</aside>

<aside>
💡 Numbers of the form $iy$ are called *purely imaginary*.

![ComplexNumber.png](Complex%20Nu%2019ce2/ComplexNumber.png)

</aside>

# Operations using Complex Numbers

<aside>
💡 Addition of two complex numbers $z = x+iy$ and $w = u+iv$:

$$
z + w := (x+u) + i(y+v).
$$

![AdditionOfComplexNumbers_ManimCE_v0.14.0.png](Complex%20Nu%2019ce2/AdditionOfComplexNumbers_ManimCE_v0.14.0.png)

</aside>

<aside>
💡 Multiplication of a complex number $z = x + iy$ with a real number $\alpha$:

$$
\alpha z := \alpha x + i \alpha y.
$$

![MultiplicationWithRealNumber.png](Complex%20Nu%2019ce2/MultiplicationWithRealNumber.png)

</aside>

<aside>
💡 Multiplication of two complex numbers $z = x+iy$ and $w = u + iv$:

$$
wz :=(u+iv)(x+iy) = ux+iuy+ivx+i^2vy = (ux-vy)+i(uy+vx).
$$

</aside>

<aside>
💡 Let $z=x+iy$ be a complex number. The *conjugate* to $z$ is $\bar{z} := x-iy$. Then:

$$
z \bar{z} = x^2 + y^2 \geq 0
$$

</aside>

<aside>
💡 The non-negative real number  $\lvert z \rvert := \sqrt{z \bar{z}}$ is called the *absolute value* or the *modulus* of the complex number $z$.

</aside>

<aside>
💡 Division of two complex number $z$ and $w$:

$$
\frac{z}{w} := \frac{z \bar{w}}{w \bar{w}} = \frac{z \bar{w}}{\lvert w\rvert^2}
$$

</aside>

<aside>
💡 Some useful rules

- $\overline{zw} = \bar{z} \cdot \bar{w}$
- $\overline{(\frac{z}{w})} = \frac{\bar{z}}{\bar{w}}$
- $\bar{\bar{z}} = z$
- $\lvert zw \rvert = \lvert z \rvert \lvert w \rvert$
- $\lvert \frac{z}{w} \rvert = \frac{\lvert z \rvert}{\lvert w \rvert}$
</aside>

# Triangle Inequality

<aside>
💡 Triangle Inequality:

$$
\lvert z + w \rvert \leq \lvert z \rvert + \lvert w \rvert
$$

</aside>

# Polar Form, Trigonometric Form, Exponential Form

<aside>
💡 Polar Form:

[https://www.notion.so](https://www.notion.so)

where $r = \lvert z \rvert = \sqrt{x^2 + y^2}$ is the distance to the origin and $\theta$ is the angle between the $x$-axis and the position vector to $z$. The latter is also described as the *argument, angle* or *phase of $z$.*

Since $\theta$ has a period of $2 \pi$, i.e., $\theta = \theta + 2\pi = \theta - 2 \pi = ...$ the polar form representation of a complex number is not unique. For this reason $\theta$ is bound to the interval $[0, 2 \pi)$, the so-called *principal value of the argument*.

</aside>

<aside>
💡 Trigonometric Form:

$$
z = x + iy = r (\cos \theta + i \sin \theta) = r \cdot \text{cis} \space \theta
$$

</aside>

<aside>
💡 Trigonometry Recap:

- $\cos \theta = \frac{x}{\lvert z \rvert}$
- $\sin \theta = \frac{y}{\lvert z \rvert}$
- $\tan \theta = \frac{y}{x}$
</aside>

<aside>
💡 Euler’s Formula:

$$
e^{i \theta} = \cos \theta + i \sin \theta
$$

This formula let’s us write a complex number $z$ in exponential form:

$$
z = x + i y = r \cdot \text{cis} \space \theta = r e^{i \theta}
$$

For $z = 0$, it holds that $r = \lvert z \rvert = 0$ and the argument can be chosen freely.

</aside>

<aside>
💡 Useful rules for exponential form:

- $e^{i \theta} \cdot e^{i \alpha} = e^{i(\theta + \alpha)}$
- $\frac{e^{i \theta}}{e^{i \alpha}} = e^{i(\theta - \alpha)}$
- Let $z = r \cdot e^{i \theta}$ and $w = s \cdot e^{i \alpha}$. Then $zw = rse^{i(\theta + \alpha)}$ and $\frac{z}{w} = \frac{r}{s} e^{i(\theta - \alpha)}$, $w \neq 0$
- $e^{2 \pi i} = \cos 2 \pi + i \sin 2 \pi = 1$
- Let $z = r \cdot e^{i \theta}$. Then $z^n = r^n e^{i \theta n}$
</aside>

<aside>
💡 Euler’s Identity:

$$
\begin{align*}
& e^{i \pi} = \cos \pi + i \sin \pi = -1 \\
\implies & e^{\pi i} + 1 = 0
\end{align*}
$$

</aside>

<aside>
💡 Switching from polar to normal form:
Let $z = r \cdot e^{i \theta} = x + iy$. Then $x = r \cdot \cos \theta$ and $y = r \cdot \sin \theta$.

</aside>

<aside>
💡 Switching from normal to polar form:
Let $z = x + iy = r\cdot e^{i \theta}$. Then $r = \lvert z \rvert = \sqrt{x^2 + y^2}$. To determine the argument $\theta$ we need to differentiate the following cases:

$$

$$

</aside>