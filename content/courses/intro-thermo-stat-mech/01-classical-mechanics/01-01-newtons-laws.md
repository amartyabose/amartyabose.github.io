---
# Page title
title: "Newton's Laws of Motion"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Newton's Laws

# Page summary for search engines.
summary:

date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 2
---

To develop the Newton's formulation of classical equation, first we need to
discuss the essential description of a physical system. At an elementary level,
one can think of a macro-system as a collection of $N$ point particles, the
$j$th one located at $\vec{r}_j(t)$ at time $t$, with a velocity given by
{{<math>}}
$$\vec{v}_j = \frac{d\vec{r}_j}{dt}.$$
{{</math>}}
The momentum of the $j$th particle is defined as $\vec{p}_j = m_j\vec{v}_j$.

First, we list the three laws of classical mechanics formulated by Newton:
1. In absence of external forces, a body would either be at rest or execute motion in a straight line with a constant velocity $\vec{v}$.
1. The action of an external force on a body is to induce a change in momentum, $\vec{p}$. More precisely, $\vec{F}_\text{ext} = \frac{\text{d}\vec{p}}{\text{d}t}$.
1. The force exerted by body $B$ on body $A$ is equal in magnitude and opposite in direction to the force exerted by body $A$ on body $B$.

Note, that of the three Newtonian laws, only the second law has all the physics.
The other two laws can be seen to be applications of this law.

> Can you derive Newton's first and third laws starting from the second law?

Before moving to a further discussion of multiple particles, let us discuss a few properties at the one particle level. These properties would also go through for multiple particles.
## Work Done by External Force
Work done by an external force which moves a particle from point 1 to 2 along a path $\vec{s}$ is given by
{{<math>}}
$$W = \int_1^2 \vec{F}\cdot d\vec{s}$$
$$=m\int_{t_1}^{t_2} \frac{d\vec{v}}{dt}\cdot \vec{v}\,dt$$
$$=m\int_{t_1}^{t_2} \frac{d}{dt}\left(\frac{\vec{v}\cdot\vec{v}}{2}\right)\,dt$$
$$=\frac{1}{2}m\vec{v}(t_2)\cdot\vec{v}(t_2) - \frac{1}{2}m\vec{v}(t_1)\cdot\vec{v}(t_1)$$
{{</math>}}

This quantity is called the kinetic energy, $T=\frac{1}{2}m\vec{v}\cdot\vec{v}$.

This also tells us that the work done along a closed path is 0. By elementary
vector calculus, the force is the gradient of a scalar function. This scalar function is called the potential, $V\left(\vec{r}\right)$, and $\vec{F} = -\vec{\nabla} V\left(\vec{r}\right)$.

## Conservation of Energy
Consider the quantity $H(\vec{r}, \vec{p}) = T(\vec{p}) + V(\vec{r})$, which we shall call the total energy. We derive the time-evolution of this quantity,
{{<math>}}
$$\frac{dH}{dt} = \nabla_{\vec{p}} T(\vec{p})\cdot \frac{d\vec{p}_j}{dt}+ \nabla_{\vec{r}} V(\vec{r})\cdot\frac{d\vec{r}}{dt}$$
$$= \frac{\vec{p}}{m}\cdot \frac{d\vec{p}}{dt}+ \nabla_{\vec{r}} V(\vec{r})\cdot\frac{d\vec{r}}{dt}$$
$$= \vec{v}\cdot \vec{F} - \vec{F}\cdot\frac{d\vec{r}}{dt}$$
$$= 0$$
{{</math>}}

Thus, we see that the total energy is a constant of motion.