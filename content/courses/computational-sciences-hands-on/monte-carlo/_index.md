---
# Page title
title: "Multidimensional Integrals using the Monte Carlo Technique"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Monte Carlo

# Page summary for search engines.
summary: 

# Date page published
date: 2025-04-07

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 200
---

Metropolis Monte Carlo is a statistical technique which can be used to evaluate integrals of the following form:
{{<math>}}
$$\int_{-\infty}^\infty P(\vec{x})\,g(\vec{x})\,d\vec{x},$$
{{</math>}}
where both $P(\vec{x})$ is a probability density $\mathbb{R}^d\to\mathbb{R}^+$
that satisfies $\int_{-\infty}^\infty P(\vec{x})d\vec{x} = 1$, and
$g(\vec{x})$ is a function $\mathbb{R}^d\to\mathbb{R}$.

To start with let us implement the MC routine for a 1D case. A new point has to be generated at every step. The maximum amount by which this point can differ from the previous point is input as `xmax` in the following function.
{{<code language="julia" source="courses/computational-sciences-hands-on/monte-carlo/mcmc.jl" id="single-MC">}}

> Write a function to calculate the error bar by dividing the `nsteps` MC steps into `nblocks` blocks and looking at the standard deviation between the simulations.

Now this function can be used to calculate the value of $\int_{-\infty}^\infty \frac{\exp(-x^2)}{\sqrt{\pi}} x^2 dx$
{{<figure src="computational-sciences/MC/MC_1.png" caption="Integral as a function of number of MC trials with error bar." class="ma0w-75">}}
{{<figure src="computational-sciences/MC/MC_1_error.png" caption="Statistical error as a function of number of MC trials." class="ma0w-75">}}

> Extend the 1D MC function to account for multiple dimensions.