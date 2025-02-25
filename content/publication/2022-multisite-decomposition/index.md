---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "A multisite decomposition of the tensor network path integrals"
authors: [amartya, Peter L. Walters]
author_notes: [Equal contribution, Equal contribution]
date: 2022-01-10
doi: "10.1063/5.0073234"

# Schedule page publish date (NOT publication's date).
publishDate: 

publication_types: ["article-journal"]

# Publication name and optional abbreviated publication name.
publication: "A. Bose and P. L. Walters, *A Multisite Decomposition of the Tensor Network Path Integrals*, J. Chem. Phys. **156**, 024101 (2022)."
publication_short: "J. Chem. Phys. **156**, 024101"

abstract: "Tensor network decompositions of path integrals for simulating open quantum systems have recently been proven to be useful. However, these methods scale exponentially with the system size. This makes it challenging to simulate the non-equilibrium dynamics of extended quantum systems coupled with local dissipative environments. In this work, we extend the tensor network path integral (TNPI) framework to efficiently simulate such extended systems. The Feynman-Vernon influence functional is a popular approach used to account for the effect of environments on the dynamics of the system. In order to facilitate the incorporation of the influence functional into a multisite framework (MS-TNPI), we combine a matrix product state (MPS) decomposition of the reduced density tensor of the system along the sites with a corresponding tensor network representation of the time axis to construct an efficient 2D tensor network. The 2D MS-TNPI network, when contracted, yields the time-dependent reduced density tensor of the extended system as an MPS. The algorithm presented is independent of the system Hamiltonian. We outline an iteration scheme to take the simulation beyond the non-Markovian memory introduced by solvents. Applications to spin chains coupled to local harmonic baths are presented; we consider the Ising, XXZ, and Heisenberg models, demonstrating that the presence of local environments can often dissipate the entanglement between the sites. We discuss three factors causing the system to transition from a coherent oscillatory dynamics to a fully incoherent dynamics. The MS-TNPI method is useful for studying a variety of extended quantum systems coupled with solvents."

# Summary. An optional shortened abstract.
summary: "The dimensionality of the Hilbert space required to describe an extended system grows exponentially with the size of the system. We present a method that utilizes tensor networks with Feynman-Vernon influence functional to account for the dynamics of extended systems in presence of local dissipative media. Read in full detail..."

tags: []
categories: [real-time-pi]
featured: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_pdf: "https://arxiv.org/pdf/2206.15421.pdf"
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
projects: [mstnpi]

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
