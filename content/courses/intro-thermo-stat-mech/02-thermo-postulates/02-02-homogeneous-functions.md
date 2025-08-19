---
# Page title
title: "Homogeneous Functions"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Homogeneous Functions

# Page summary for search engines.
summary:

date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 3
---

A multivariate function, $f(\vec{x})$, is said to be homogeneous of order $n$, if
{{<math>}}
$$f(\lambda\vec{x}) = \lambda^n f(\vec{x})$$
{{</math>}}

One of the most interesting and relevant properties of homogeneous functions is **Euler's theorem**.

## Euler's Theorem for Homegeneous Function

Differentiating the definition by $\lambda$ one gets:
{{<math>}}
$$n\lambda^{n-1}f(\vec{x}) = \sum_j\frac{\partial f(\lambda\vec{x})}{\partial(\lambda x_j)}\frac{d(\lambda x_j)}{d\lambda}$$
$$=\vec\nabla f(\lambda\vec{x}) \cdot \vec{x}$$
{{</math>}}
Putting $\lambda = 1$, we get Euler's theorem for homogeneous functions,
{{<math>}}
$$nf(\vec{x}) = \vec\nabla f(\vec{x})\cdot\vec{x},$$ 
{{</math>}}
which relates the value of the function at a points to the values of all the gradient of the function and the point itself.

## Consequence for Entropy and Energy
Given that entropy and energy are both first-order homogeneous functions, we can now write:
{{<math>}}
$$S(U, V, N_j) = \frac{\partial S}{\partial U} U + \frac{\partial S}{\partial V} V + \sum_j \frac{\partial S}{\partial N_j} N_j$$
$$U(S, V, N_j) = \frac{\partial U}{\partial S} S + \frac{\partial U}{\partial V} V + \sum_j \frac{\partial U}{\partial N_j} N_j$$
{{</math>}}

Now, what are these partial derivatives? We will talk more about them in next.