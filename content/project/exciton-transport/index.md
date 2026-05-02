---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Exciton and Polaritonic Transport"
summary: "Quantum energy transport in molecular and hybrid light–matter systems"
authors: [amartya]
tags: [Applications]
categories: []
date: 2022-11-04T17:04:49+05:30

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Light-Harvesting Complexes are extremely efficient transporters of excitations."
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

# Motivation

The transfer of electronic excitation — the movement of an exciton — is among the most fundamental processes in both nature and technology. In photosynthetic complexes, this process captures sunlight and channels energy with near-unity efficiency. In molecular crystals, conjugated polymers, and organic microcavities, similar mechanisms underlie the performance of optoelectronic and quantum photonic devices. Despite the diversity of these systems, they all share a central theme: energy flow occurs in a quantum mechanical world shaped by structure, coherence, and dissipation.

Our group studies how quantum coherence and environmental interactions organize the flow of excitation energy through complex molecular and hybrid systems. The goal is not only to quantify how efficiently energy moves, but to reveal how it moves — to uncover the competing routes of transport that emerge from the interplay of coherent delocalization, vibrational coupling, and environmental loss.

# Conceptual Background

Excitonic transport lies in the fascinating regime between classical diffusion and fully coherent quantum motion. When the coupling between sites in a molecular aggregate is strong compared to environmental noise, excitations delocalize over multiple chromophores, giving rise to wave-like dynamics. Conversely, strong coupling to phonons or solvent fluctuations can localize the excitation and drive it toward incoherent hopping. Real systems — biological, chemical, and synthetic — exist somewhere in between, and the key challenge is to understand how coherence and dissipation cooperate to produce efficient transport.

Traditional theories such as Förster or Redfield describe these two limiting regimes separately. However, they often rely on perturbative or Markovian assumptions that fail in intermediate or strongly coupled regimes. To overcome this, we employ numerically exact open-system simulations based on path integrals, which treat system–environment coupling nonperturbatively and capture long-time memory effects. These methods are discussed in detail in [Tensor Network Path Integral]({{<relref "/project/tensor-network-path-integral">}}), where we developed scalable algorithms to evaluate the Feynman–Vernon influence functional for extended molecular systems.

Here, the focus is on how these rigorous dynamical tools can be used to map the routes of excitonic and polaritonic transport.
