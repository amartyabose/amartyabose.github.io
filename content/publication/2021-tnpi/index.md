---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "A Tensor Network Representation of Path Integrals: Implementation and Analysis"
authors: [amartya, Peter L. Walters]
date: 2021-10-19
doi: "10.48550/arXiv.2106.12523"

# Schedule page publish date (NOT publication's date).
publishDate: 

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["article"]

# Publication name and optional abbreviated publication name.
publication: "arXiv"
publication_short: "arXiv"

abstract: "Tensors with finite correlation afford very compact tensor network representations. A novel tensor network-based decomposition of real-time path integral simulations involving Feynman-Vernon influence functional is introduced. In this tensor network path integral (TNPI) technique, the finite temporarily non-local interactions introduced by the influence functional can be captured very efficiently using matrix product state representation for the path amplitude (PA) tensor. We illustrate this particular TNPI method through various realistic examples, including a charge transfer reaction and an exciton transfer in a dimer. We also show how it is readily applied to systems with greater than two states by simulating a 7-site model of FMO and a molecular wire model. The augmented propagator (AP) TNPI utilizes the symmetries of the problem, leading to accelerated convergence and dramatic reductions of computational effort. We also introduce an approximate method that speeds up propagation beyond the non-local memory length. Furthermore, the structure imposed by the tensor network representation of the PA tensor naturally suggests other factorizations that make simulations for extended systems more efficient. These factorizations would be the subject of future explorations. The flexibility of the AP-TNPI framework makes it a promising new addition to the family of path integral methods for non-equilibrium quantum dynamics."

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
projects: [tensor-network-path-integral]

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
