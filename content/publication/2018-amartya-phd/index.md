---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Phase Space and Path Integral Approaches to Quantum Dynamics"
authors: [amartya]
date: 2018-05-01
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: 

publication_types: ["thesis"]

# Publication name and optional abbreviated publication name.
publication: "PhD Thesis. University of Illinois Urbana-Champaign"
publication_short: ""

abstract: "Exact quantum dynamical simulation of processes in highly coupled condensed phase reactions is extremely challenging. The work reported in this dissertation builds on top of two different approaches. First, we present methods for calculating the multidimensional Wigner function. We start with a simple and approximate method which utilizes classical trajectories. This fits well with the subsequent classical propagation involved in a quasiclassical simulation. We use this method to study molecular Hamiltonians in both normal mode and Cartesian coordinates. Despite the simplicity of this method, there can be systems which are extremely anharmonic, where the method can be extremely slow to converge when there is no obviously good starting point. To overcome this problem, we propose a numerically exact path integral based method which can be systematically converged to any desired level of accuracy at increasing computational cost. Both these methods can be used with quantum classical simulation frameworks. Second, we present developments of rate theory methods. We extend the existing reactive flux rate methods to exact quantum classical methods. Two different initial conditions are proposed. If the transients are important, we show that the so-called “non-equilibrium” initial condition can help us unify the fast timescales as well as the long timescale dynamics governed by the rate. On the other hand, if the transients are of less importance, we propose a “near equilibrium” initial condition that can very effectively get rid of most of the transients. This initial condition captures the system-solvent interaction without increasing the complexity of the algorithm. Finally, we present a method of incorporating the concept of blip summation into the quantum-classical path integral (QCPI) method. This gives additional speedup on top of all the other advancements that make QCPI a very attractive method for doing exact quantum dynamics in condensed phase."

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

url_pdf: uploads/amartya_thesis.pdf
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
projects: []

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
