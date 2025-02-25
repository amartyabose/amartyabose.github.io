---
# Leave the homepage title empty to use the site title
title:
date: 
type: landing

sections:
  - block: hero
    content:
      title: |
        Quantum Dynamics Research Group
      image:
        filename: welcome.jpg
      text: |
        <br>
         
        The **Quantum Dynamics Research Group** focuses on developing novel computational approaches to **simulating non-equilibrium dynamics of quantum systems in the condensed phase**, overcoming the *curse of dimensionality*.

        {{% cta cta_link="#projects" cta_text="Read more →" %}} {{% cta cta_link="./people/" cta_text="Meet the team →" %}} {{% cta cta_link="https://github.com/amartyabose/QuantumDynamics.jl" cta_text="Software →" %}}

  - block: collection
    content:
      title: Latest Publications
      subtitle: "Search through [all publications>>](/publication)"
      count: 5
      filters:
        folders:
          - publication
        publication_type: 'article-journal'
    design:
      view: card
      columns: '2'
---
