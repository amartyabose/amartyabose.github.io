---
# Page title
title: "Derivatives of the State Functions: Intensive Variables"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Intensive Quantities

# Page summary for search engines.
summary:

date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 4
---

Consider an isolated system of $N$ particles in a box of volume $V$ with a total internal energy, $U$. This box has a partition through it which divides the system into two parts --- one with $N_1, V_1, U_1$ and the second with $N_2, V_2, U_2$, such that 
{{<math>}}
$$N_1 + N_2 = N$$
$$V_1 + V_2 = V$$
$$U_1 + U_2 = U$$
{{</math>}}

This common setup will allow us to define a variety of ``experiments'' and consequently understand the various intensive thermodynamic quantities.

## Temperature
First consider an experiment where the partition allows for transfer of energy
but not of particle or changing of volume. How do we define the new equilibrium
on allowing exchange of energy? Now, though $N_1, V_1$ and $N_2, V_2$ are
constants, $U_1$ and $U_2$ are not. They are, however, still constrained by
$U_1 + U_2 = U$. We have to change the energy of the two compartments until
entropy is maximized. Notice that $dU_1 = -dU_2$. So there is only a single
independent variable.

{{<math>}}
$$S = S_1(U_1, V_1, N_1) + S_2(U_2, V_2, N_2)$$
$$\frac{\partial S}{\partial U_1} = \frac{\partial S_1}{\partial U_1} - \frac{\partial S_2}{\partial U_2} = 0$$
$$\frac{\partial S_1}{\partial U_1} = \frac{\partial S_2}{\partial U_2}$$
{{</math>}}

So, energy flows from one compartment to the other till these two partial
derivatives become equal. Physical intuition tells us that this partial
derivative, therefore, must have something to do with the temperature. Let us
assume that $\frac{\partial S}{\partial U} = f(T)$ for some function $f$.

Now, let us think about the route to establishment of equilibrium. Over time,
the total entropy $S = S_1 + S_2$ must increase.
{{<math>}}
$$\frac{dS}{dt} = \frac{dS_1}{dt} + \frac{dS_2}{dt} > 0$$
$$\left(\frac{\partial S_1}{\partial U_1} - \frac{\partial S_2}{\partial U_2}\right)\frac{dU_1}{dt} > 0$$
{{</math>}}

This shows us that if $\frac{\partial S_1}{\partial U_1}=f(T_1)>\frac{\partial
S_2}{\partial U_2} = f(T_2)$ at the initial time, then $\frac{dU_1}{dt}>0$. This means
that the energy is flowing from the second compartment to the first compartment.
So, we define $f(T) = \frac{1}{T}$, which satisfies this direction of energy flow.

