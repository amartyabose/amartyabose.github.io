---
# Page title
title: "Basic Quantum Mechanics"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Basic Quantum Mechanics

# Page summary for search engines.
summary: How do we solve for the eigenstates of simple quantum systems numerically?

# Date page published
date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 100
---

The goal is to find the eigenstates and the eigenenergies of any 1D Hamiltonian,
{{<math>}}
$$H = -\frac{\hbar^2}{2m}\frac{\partial^2}{\partial x^2} + V(x).$$
{{</math>}}
To do this, one needs to be able to represent the Hamiltonian operator as a matrix for a given basis. A variety of basis can be chosen. The more physically relevant the basis, the more efficient the computations. However as long as the basis can be systematically increased, one should be able to find the correct eigenstates. This procedure is called "convergence."

<!-- {{<highlight julia "linenos=inline">}}
for j = 1:N
@show j
end
{{</highlight>}} -->
