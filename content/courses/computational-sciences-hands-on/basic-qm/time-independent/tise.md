---
# Page title
title: "Time-Independent Quantum Mechanics"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Time-Independent Quantum Mechanics

# Page summary for search engines.
summary: How do we solve for the eigenstates of simple quantum systems numerically?

# Date page published
date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 110
---

The goal is to model any 1D Hamiltonian,
{{<math>}}
$$\hat{H} = -\frac{\hbar^2}{2m}\frac{\partial^2}{\partial x^2} + V(\hat{x})$$
{{</math>}}
and find its eigenstates and eigenenergies,
{{<math>}}
$$\hat{H}|\psi_n\rangle = \epsilon_n|\psi_n\rangle.$$
{{</math>}}
To do this, one needs to be able to represent the Hamiltonian operator as a
matrix for a given computational basis, $|\phi_n\rangle$. We assume that the
computational basis forms an orthonormal set. We start by inserting a resolution
of identity in the eigenstate equation in terms of the computational basis

{{<math>}}
$$\sum_k \hat{H}|\phi_k\rangle\langle\phi_k|\psi_n\rangle = \epsilon_n\sum_k|\phi_k\rangle\langle\phi_k|\psi_n\rangle$$
{{</math>}}
Taking an overlap of the equation with with $|\phi_j\rangle$
{{<math>}}
$$\sum_k \langle\phi_j|\hat{H}|\phi_k\rangle\langle\phi_k|\psi_n\rangle = \epsilon_n\langle\phi_j|\psi_n\rangle$$
{{</math>}}
This gives rise to the matrix eigenvalue equation in the $|\phi_n\rangle$ basis.

A variety of basis can be chosen. The more physically relevant the basis, the
more efficient the computations. However as long as the basis can be
systematically increased, one should be able to find the correct eigenstates.
This procedure is called "convergence."

## Basis of Position Eigenstates
As our first example, we choose to work in the position eigenbasis. Of course,
the position eigenbasis forms an infinite dimensional vector space, which cannot
be handled in a simple manner on the computer. We truncate the space by
considering a subset of the real axis --- the domain considered is
$\mathbb{D}\subset\mathbb{R}$. However, that is not enough by itself because any
domain, closed or open, would still be an infinite set.

So, we consider a finite set defined by a lower limit, $L_\text{min}$, an upper
limit, $L_\text{max}$, and a grid spacing $\Delta x$. An arbitrary element of
the computational basis is therefore $x_j = L_\text{min} + (j-1)\Delta
x$, such that $\hat{x}|\phi_j\rangle = x_j|\phi_j\rangle$.

Next, we need to derive the matrix elements of the Hamiltonian.
{{<math>}}
$$\langle\phi_j|\hat{H}|\phi_k\rangle = -\frac{\hbar^2}{2m}\left\langle\phi_j\left|\frac{\partial^2}{\partial x^2}\right|\phi_k\right\rangle + \langle\phi_j|V(\hat{x})|\phi_k\rangle$$
$$= -\frac{\hbar^2}{2m}\left\langle\phi_j\left|\frac{\partial^2}{\partial x^2}\right|\phi_k\right\rangle + V(x_k)\delta_{j,k}$$
{{</math>}}

{{<highlight julia "linenos=inline">}}
function get_Hamiltonian_matrix_position_space(; V, Lmin::Float64, Lmax::Float64, dx::Float64, hbar=1.0, m=1.0)
    xgrid = Lmin : dx : Lmax
    Npoints = length(xgrid)
    H = zeros(Npoints, Npoints)
    for r = 2:Npoints-1, c = 1:Npoints
        if r == c
            H[r, c] = hbar^2 / (m * dx^2) + V(xgrid[r])
        elseif r == c-1 || r == c+1
            H[r, c] = -hbar^2 / (2 * m * dx^2)
        end
    end
    H[1, 1] = V(xgrid[1])
    H[end, end] = V(xgrid[end])
    xgrid, H
end
{{</highlight>}} 
