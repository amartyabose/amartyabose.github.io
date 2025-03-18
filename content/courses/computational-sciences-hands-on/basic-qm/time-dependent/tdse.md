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
then the time-evolution of the wave function satisfies the Time-Dependent Schr\"odinger equation,
{{<math>}}
$$i\hbar\frac{\partial}{\partial t}|\psi(t)\rangle = \hat{H}|\psi(t)\rangle.$$
{{</math>}}
