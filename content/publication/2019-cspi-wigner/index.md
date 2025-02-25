---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Coherent State-Based Path Integral Methodology for Computing the Wigner Phase Space Distribution"
authors: [amartya, Nancy Makri]
author_notes: ["", Corresponding author]
date: 2019-04-15
doi: "10.1021/acs.jpca.9b00758"

# Schedule page publish date (NOT publication's date).
publishDate:

publication_types: ["article-journal"]

# Publication name and optional abbreviated publication name.
publication: "A. Bose and N. Makri, *Coherent State-Based Path Integral Methodology for Computing the Wigner Phase Space Distribution*, J. Phys. Chem. A **123**, 4284 (2019)."
publication_short: "J. Phys. Chem. A **123**, 4284"

abstract: "The accurate evaluation of the Wigner phase space density for multidimensional system remains a challenging task. Path integral Monte Carlo methods offer a numerically exact approach for obtaining the Boltzmann density in coordinate space, but the Fourier-type integral required to construct the Wigner distribution generally leads to poor convergence. This paper describes a path integral method for constructing the Wigner density which substantially mitigates the Monte Carlo sign problem and thus is applicable to systems with many degrees of freedom. The starting point is the path integral representation of the coherent state density, which does not involve a Fourier integral and thus converges rapidly. We then use the relation between the coherent state and Wigner densities to construct the Wigner function, taking advantage of destructive phase cancellation to truncate the infinite series and thus confine the integrand, avoiding highly oscillatory regions. We also describe the use of information-guided noise reduction (IGNoR) to improve the Monte Carlo statistics in the most challenging regimes. The method is applied to strongly anharmonic one-dimensional models, a system-bath Hamiltonian, as well as the formamide molecule within an ab initio quartic potential, and the results are compared to those obtained by various approximate methods. These calculations suggest that the coherent state-based path integral method described in this paper offers an efficient, numerically exact approach for constructing the Wigner phase space density in systems of many degrees of freedom, and thus will be useful for quantizing the initial condition in classical trajectory-based simulations of dynamical properties."

# Summary. An optional shortened abstract.
summary: ""

tags: []
categories: []
featured: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_pdf:
url_code:
url_dataset:
url_poster:
url_project:
url_slides:
url_source:
url_video:

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects: [wigner-distribution]

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
