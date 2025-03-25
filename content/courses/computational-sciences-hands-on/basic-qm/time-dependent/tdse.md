---
# Page title
title: "Time-Dependent Quantum Mechanics"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Time-Dependent Quantum Mechanics

# Page summary for search engines.
summary: Can we simulate the time-evolution of simple quantum systems numerically?

# Date page published
date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 120
---

How do we simulate the dynamics of a quantum system? Suppose we know that the initial state of the system is given by a particular wave function $|\psi(0)\rangle$ and the system is described by a Hamiltonian,
{{<math>}}
$$\hat{H} = -\frac{\hbar^2}{2m}\frac{\partial^2}{\partial x^2} + V(x),$$
{{</math>}}
then the time-evolution of the wave function satisfies the Time-Dependent Schrödinger equation,
{{<math>}}
$$i\hbar\frac{\partial}{\partial t}|\psi(t)\rangle = \hat{H}|\psi(t)\rangle.$$
{{</math>}}

The initial wave packet is given in position space as $\psi(x, 0)$ and we want
to propagate it out to obtain $\psi(x, t)$. The direct way of solving this problem is to solve for the short-time propagator defined as
{{<math>}}
$$\hat{U} = \exp\left(-\frac{i \hat{H} \Delta t}{\hbar}\right).$$
{{</math>}}
If this can be represented in position space, then we can propagate the wave function as follows:
{{<math>}}
$$\psi(x, t+\Delta t) = \hat{U}\psi(x, t)$$
{{</math>}}

In the previous chapter, we have defined a function which creates the Hamiltonian in position space. We can easily exponentiate this to obtain the propagator in Julia, and use that to propagate for all times as shown below:
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-dependent/tdse.jl" id="propagate-accurate">}}

Imagine we are working with a harmonic potential:
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-dependent/tdse.jl" id="potential">}}
Let us check the dynamics of an initial state obtained by shifting the ground
state of the harmonic potential to be centered on $x=-3$.
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-dependent/tdse.jl" id="shifted-ground-dynamics">}}
where the function for dot product is defined as follows:
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-dependent/tdse.jl" id="dot-product">}}

The evolution of the probability density is shown below in the gif:
{{<figure src="computational-sciences/basic-qm/time-dependent/shifted_ground_state_harmonic.gif" caption="Time evolution of the probability for an initial state defined by the ground state wave function shifted from the mean position under a harmonic potential" class="ma0w-75">}}