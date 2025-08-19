---
# Page title
title: "Postulates of Thermodynamics"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Postulates

# Page summary for search engines.
summary:

date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 2
---

The fundamentals of thermodynamics can be encapsulated in four postulates. We list them all here, but in the class we will go in a stepwise manner.

### Postulates in Entropy Representation

### Postulate 1: Existence of Equilibrium States

There exist particular states (called **equilibrium states**) of simple systems that, macroscopically, are characterized completely by the internal energy $U$, the volume $V$, and the mole numbers $N_{1}$, $N_{2}$, ... , $N_{r}$, of the chemical components.

> Do you think this set of variables make sense from a physical angle?

### Postulate 2: Definition of Entropy

There exists a function (called the _entropy_, $S$) of the extensive parameters $(U, V, N_{1}, N_{2},\dots)$ of any composite system, defined for all equilibrium states such that the values assumed by the extensive parameters in the absence of an internal constraint are those that **maximize** $S$ over the manifold of constrained equilibrium states.

> Notice that unlike traditional developments, we are not starting with the internal energy or $U$ as a state function. We are defining the entropy as a state function instead. Think about why!

### Postulate 3: Properties of Entropy

The **entropy** of a composite system is additive over the constituent subsystems. $S$ is continuous and differentiable, and a monotonically increasing homogeneous function of the energy of the first order.
{{<math>}}
$$S = \sum_{j} S_{j}$$
$$S(\lambda U, \lambda V, \lambda N) = \lambda S(U,V,N)$$
$$\left( \frac{\partial S}{\partial U} \right)_{V, N} > 0$$
{{</math>}}

> We will deal with the details of [homogeneous functions]({{<relref "02-02-homogeneous-functions.md">}}) in a bit. Till then it is suffices to note that both entropy as a function of $(U, V, N_j...)$ and energy as a function of $(S, V, N_j...)$ are first-order homogeneous functions.

### Postulate 4: Nernst Postulate
The **entropy** of any system vanishes at $T=0K$, or when 
{{<math>}}
$$\left( \frac{\partial U}{\partial S} \right)_{V, N} = 0$$
{{</math>}}

This implies that the entropy has a unique zero.

## Energy Representation
All of thermodynamics can equivalently be expressed if a system is characterized by the entropy, $S$, volume, $V$, and number of particles, $N_j$. Then the state function of interest is the internal energy $U(S, V, N)$, which is a first-order homogeneous equation. This internal energy is **minimized** over all the constrained equilibrium states.

