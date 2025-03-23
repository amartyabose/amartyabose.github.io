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
$\mathbb{D} = [L_\text{min}, L_\text{max}] \subset\mathbb{R}$. However, that is
not enough by itself because any domain, closed or open, would still be an
infinite set.

So, we consider a finite set defined by a lower limit, $L_\text{min}$, an upper
limit, $L_\text{max}$, and a grid spacing $\Delta x$. An arbitrary element of
the computational basis is therefore $x_j = L_\text{min} + (j-1)\Delta
x$, such that $\hat{x}|\phi_j\rangle = x_j|\phi_j\rangle$.

Next, we need to derive the matrix elements of the Hamiltonian.
{{<math>}}
$$\langle\phi_j|\hat{H}|\phi_k\rangle = -\frac{\hbar^2}{2m}\left\langle\phi_j\left|\frac{\partial^2}{\partial x^2}\right|\phi_k\right\rangle + \langle\phi_j|V(\hat{x})|\phi_k\rangle$$
$$= -\frac{\hbar^2}{2m}\left\langle\phi_j\left|\frac{\partial^2}{\partial x^2}\right|\phi_k\right\rangle + V(x_k)\delta_{j,k}$$
{{</math>}}
Instead of directly calculating the matrix element of the second derivative
operator, we start by exploring the action of the Hamiltonian matrix on an
arbitrary wave function written in the position basis.
{{<math>}}
$$H|\psi\rangle = -\frac{\hbar^2}{2m}\frac{\partial^2}{\partial x^2}|\psi\rangle + \hat{V}|\psi\rangle$$
{{</math>}}
So, we need to find how to write the second derivative of the wave function
$|\psi\rangle$ as a function of the its values on the grid. Expanding the
function in its Taylor series, we can show that
{{<math>}}
$$\left.\frac{\partial^2}{\partial x^2}\psi(x)\right|_{x=x_n} (\Delta x)^2 = \psi(x_{n+1}) -2\psi(x_n) + \psi(x_{n-1})$$
$$-\frac{\hbar^2}{2m}\left.\frac{\partial^2}{\partial x^2}\psi(x)\right|_{x=x_n} = -\frac{\hbar^2}{2m(\Delta x)^2}\left(\psi(x_{n+1}) -2\psi(x_n) + \psi(x_{n-1})\right)$$
{{</math>}}
for $\Delta x\to 0$.

Now, we can put everything together. The matrix element of the Hamiltonian turns out to be:
{{<math>}}
$$\langle\phi_j|\hat{H}|\phi_k\rangle = -\frac{\hbar^2}{2m(\Delta x)^2}\left(\delta_{j,k+1}-2\delta_{j,k}+\delta_{j,k-1}\right) + V(x_k)\delta_{j,k}$$
{{</math>}}

Below is the code which defines the tridiagonal Hamiltonian for a given
potential on a position eigenstate basis given by the variable `xgrid` in Julia:
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-independent/Hamiltonian_position_space.jl" id="get-Hamiltonian">}}
The Hamiltonian matrix obtained from this code can be diagonalized to get the
energies and the eigenstates.

### Harmonic Oscillator Eigenstates
Let us test the code by using a harmonic oscillator as an example. Consider the
following potential:
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-independent/Hamiltonian_position_space.jl" id="potential">}}

To use the potential, first we need to decide on the grid. This will of course
be converged. Because this potential is symmetric, we will choose a symmetric
grid with $L_\text{min}=-L_\text{max}$.

Let us take the following grid:
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-independent/Hamiltonian_position_space.jl" id="grid1">}}
Then we diagonalize the matrix as follows
{{<code language="julia" source="courses/computational-sciences-hands-on/basic-qm/time-independent/Hamiltonian_position_space.jl" id="diagonalize">}}

Take a look at the values that you get. Do they match what you know from basic
quantum mechanics?

Probably not! On running the code, the lowest eigenvalue that I got is 3.43. Where are we going wrong then?

Notice that the Hamiltonian matrix elements that we derived in the previous
section requires $\Delta x\to 0$. That is not being satisfied. However, what
does "tending to 0" mean in a computational setting? To understand this, let us
plot the energy of the lowest eigenstate as a function of $\Delta x$ keeping the
$L_\text{min}$ and $L_\text{max}$ fixed. We are just trying to make the
second derivative Taylor expansion correct. Notice that as $\Delta x$ decreases
the value of $E_0$ seems to be hitting a constant value. This is the converged
value with respect to $\Delta x$.

{{<figure src="computational-sciences/basic-qm/time-independent/dx_convergence.png" caption="Convergence of grid spacing" class="ma0 w-75" target="dx-convergence">}}

If we stopped at this level, does this value match the analytical value for the
harmonic oscillator? The zero-point energy should actually be 0.5, whereas the
value we are getting by diagonalizing is close to 5.0. That terribly incorrect.

The next step would be to check for convergence with respect to the box size,
$L_\text{max}$. Since the Taylor series error seems to be relatively well
converged with $\Delta x=0.001$, that is kept fixed. Notice how the energies of
the first 5 eigenstates converge to the correct values around $L_\text{max} =
5.0$. This is convergence with respect to the box size.

{{<figure src="computational-sciences/basic-qm/time-independent/Lmax_convergence.png" caption="Convergence of box size" class="ma0 w-75">}}


> Write the programs to obtain the $\Delta x$ and the $L_\text{max}$ convergence curves.

> Converge the harmonic oscillator energies corresponding to the ground state and the 10th excited state. What box-sizes are required for the two cases? Are they the same or different and why?

> Can you use the same technique to converge the eigenstates of a Morse oscillator.