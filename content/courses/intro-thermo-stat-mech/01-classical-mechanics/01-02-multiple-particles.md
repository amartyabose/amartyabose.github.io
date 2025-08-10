---
# Page title
title: "Description of Multiple-Particle Systems"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Multiple-Particle Systems

# Page summary for search engines.
summary:

date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 3
---

Till now the bulk of our discussion after the basic Newtonian laws was in terms
of a single particle system. Those are the simplest and often the most boring.
The real complexity and interesting phenomena relate to many-particle systems.
How do we understand such systems?

If the dimensionality of the space is $d$ and the number of particles are $N$, then the multiparticle position vector can be thought of as a $dN$-dimensional vector. If $\vec{r}_j$ is the position of the $j$th particle (for $j=1,2,\ldots,N$), then the total configuration can be obtained by concatenating each of the position vectors together. The $c$th coordinate for the $j$th particle becomes the $d(j-1) + c + 1$th element of the configuration space vector:
{{<math>}}
$$\vec{q}_{d(j-1)+c+1} = \vec{r}_{j, c}.$$
{{</math>}}

The velocity vector is the time-derivative of the configuration point, and the momentum vector is obtainedby multiplying by the diagonal mass matrix:
{{<math>}}
$$\vec{p} = M\frac{d\vec{q}}{dt}$$
{{</math>}}

## Definition of Phase-Space
When we come to the statistical mechanics part of the course, the molecular basis of thermodynamics will be developed in terms of energy as a function of the momenta and positions.

This multidimensional space obtained by a combination of the positions $\vec{q}$ and the momenta $\vec{p}$ is called the phase space. Every problem is, in addition to the Hamiltonian, specified by an initial position, $\vec{q}(0)$, and an initial momentum, $\vec{p}(0)$. Newton's second law can be rewritten as follows:
{{<math>}}
$$\frac{d\vec{q}(t)}{dt} = M^{-1}\vec{p}(t)$$
$$\frac{d\vec{p}(t)}{dt} = -\nabla V(\vec{q}(t)) = \vec{F}(\vec{q}(t))$$
{{</math>}}
It is well-known that a $o$th order differential equation solved with the
initial values of the first $o$ derivatives is equivalent to $o$ coupled
first-order differential equations. This is just the same decomposition of the
second-order Newton's law into two first-order differential equations.

The dynamical trajectories of a multiparticle system can be interpreted as a
single trajectory in the phase-space. Because of conservation of energy, all
points on this phase-space trajectory would have the same energy.