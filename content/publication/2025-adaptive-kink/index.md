---
# Documentation: https://docs.hugoblox.com/managing-content/

title: "Adaptive Kink Filtration: Achieving Asymptotic Size-Independence of Path Integral Simulations Utilizing the Locality of Interactions"
short_title: "Adaptive Kink Filtration"
authors:
  - amartya
date: 2025-02-26T12:38:53+05:30
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: 2025-02-26T12:38:53+05:30

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["article-journal"]

# Publication name and optional abbreviated publication name.
publication: "A. Bose, *Adaptive Kink Filtration: Achieving Asymptotic Size-Independence of Path Integral Simulations Utilizing the Locality of Interactions*, J. Chem. Phys. **in press** (2025)."
publication_short: "J. Chem. Phys. **in press**"

abstract: "Recent method developments involving path integral simulations have come a long way in making these techniques practical for studying condensed phase non-equilibrium phenomena. One of the main difficulties that still needs to be surmounted is the scaling of the algorithms with the system dimensionality. The majority of recent techniques have only changed the order of this scaling (going from exponential to possibly a very high ordered polynomial) and not eased the dependence on the system size. In this current work, we introduce an adaptive kink filtration technique for path generation approach that leverages the locality of the interactions present in the system and the consequent sparsity of the propagator matrix to remove the asymptotic size dependence of the simulations for the propagation of reduced density matrices. This enables the simulation of larger systems at a significantly reduced cost. This technique can be used both for simulation of non-equilibrium dynamics and for equilibrium correlation functions, and is demonstrated here using examples from both. We show that the cost becomes constant with the dimensionality of the system. The only place where a system size-dependence still remains is the calculation of the dynamical maps or propagators which are important for the transfer tensor method. The cost of calculating this solvent-renormalized propagator is the same as the cost of propagating all the elements of the reduced density matrix, which scales as the square of the size. This adaptive kink-filtration technique promises to be instrumental in extending the affordability of path integral simulations for very large systems."

# Summary. An optional shortened abstract.
summary: "Path integral calculations scale exponentially with system sizes, making simulations of large systems prohibitively difficult. However, physical systems have certain constraints; interactions, for instance, are generally quite local. Is it possible to use these features to make the cost of path integral simulations indepedent of system size? Explore in depth..."

tags: []
categories: [Path Integrals]
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
projects: []

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
