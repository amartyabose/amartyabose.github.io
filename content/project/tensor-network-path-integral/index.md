---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Tensor Network Path Integral"
summary: "Simulating exact quantum dynamics of a low-dimensional system interacting with a large dissipative environment proves to be challenging due to presence of non-Markovian effects. Tensor networks can be successfully used to reduce the memory burden of these non-Markovian simulations making it possible to study chemical reactions in the condensed phase with greater accuracy."
authors: [amartya]
tags: [path-integrals]
categories: []
date: 2022-11-04T16:34:44+05:30

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Different tensor networks can be used to manifestly capture different properties of the dynamics."
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

Simulations of real-time dynamics of quantum systems coupled with dissipative media is plagued by the curse of dimensionality. As a way to avoid the problem, many methods integrate out the bath and simulate the dynamics of the reduced density matrix. Such simulations are characterized by the presence of non-Markovian memory. Path integrals, through the use of Feynman-Vernon's influence functional, provides a rigorous way of capturing this non-Markovian effect of the environment on the system.

The most challenging aspect is that the cost of these calculations grow exponentially with the memory length. We classify approaches that utilize tensor networks to make path integral simulations more efficient as belonging to the **tensor network path integral (TNPI)** family of methods. There can be many different kinds of tensor networks that are used. Time-evolved matrix product operators (TEMPO) is a particular one that uses matrix product states and matrix product operators for simulating real-time dynamics with Feynman-Vernon influence functional. We have developed a method called the **pairwise-connected tensor network path integral (PC-TNPI)** as a generalization on these approaches. Additionally, the TNPI framework allows for further factorization of the system to deal with extended systems. This extension, called the **multisite tensor network path integral (MS-TNPI)**, is described in [its own section]({{< relref "/project/mstnpi" >}}).