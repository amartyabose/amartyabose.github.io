---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Multisite Tensor Network Path Integral"
summary: "How does one handle the dynamics of extended quantum systems interacting with local dissipative media? MS-TNPI provides an answer to this problem by introducing a 2D tensor network decomposition of the path integral expressions."
authors: [amartya]
tags: [extended-systems, path-integrals]
categories: []
date: 2022-11-04T20:27:50+05:30

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "2D MS-TNPI network that is simultaneously decomposed along the temporal and spatial axes."
  focal_point: ""
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

Simulating the dynamics of a quantum system coupled to a dissipative environment gets challenging because of the non-Markovian memory that needs to be accounted for. While iterative propagation and basic [**tensor network path integral (TNPI)**](/project/tensor-network-path-integral) enable simulation of longer memory times, the dimensionalities of systems that can be simulated are still very limited. For extended systems the dimensionality grows exponentially with the number of *sites* or *monomers*, making these techniques untenable. Consider $50$ monomers described by two levels each. That implies that the Hilbert space has a dimensionality of $2^{50}$. This exponential growth of the dimensionality of the Hilbert space may be controlled if the dynamics can be restricted to a significantly smaller subspace. This is the case when considering the single particle subspace in a Frenkel-like process which conserves the number of particles. However, solving the 50-dimensional problem, while more feasible than the $2^{50}$ dimensional problem, is still a significant challenge.

The standard [TNPI](/project/tensor-network-path-integral) decomposes the path integral expression only along the temporal dimension. However, to account for these extended systems, one needs to decompose it also along a spatial dimension, separating out the individual sites. Thus a two-dimensional tensor network decomposition is achieved. Contraction of this 2D tensor network after incorporation of the influence functional yields the time-dependent reduced density operator corresponding to the extended system in the presence of a dissipative environment. The simulations happen in the full Hilbert space allowing for a transparent inclusion of more involved effects like multi-photon process, multi-dimensional spectra, etc. 