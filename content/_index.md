---
# Leave the homepage title empty to use the site title
title:
date: 
type: landing

sections:
  - block: hero
    content:
      title: |
        Bose Research Group
      image:
        filename: welcome.jpg
      text: |
        <br>

        The **Bose Research Group** focuses on developing novel computational approaches to **simulating non-equilibrium dynamics of quantum systems in the condensed phase**, overcoming the *curse of dimensionality*.

        <br>

        {{% cta cta_link="#projects" cta_text="Read more →" %}}&nbsp;&nbsp;{{% cta cta_link="./publication/" cta_text="Publications →" %}}&nbsp;&nbsp;{{% cta cta_link="./people/" cta_text="Meet the team →" %}}

  - block: markdown
    content:
      title: "Announcements"
      subtitle: "[All announcements>>](/news)"
      text: |
        {{< readfromfile "/content/news/newslist.dat" 5 >}} 
    design:
      columns: '2'

  - block: portfolio
    id: projects
    content:
      title: Research Areas
      subtitle: The cost of simulations of time-evolution of quantum systems grows exponentially with the number of dimensions involved. Various approaches, both approximate and numerically exact, are required to make such simulations feasible. Explore the ideas that are being developed in the group.
      filters:
        folders:
          - project
      buttons:
        - name: All
          tag: '*'
        - name: Path Integrals
          tag: Path Integrals
        - name: Applications
          tag: Applications
        - name: Software
          tag: Software
    design:
      columns: '1'
      # view: showcase
      flip_alt_rows: true

  - block: tag_cloud
    content:
      title: Topics under Study
      subtitle: 
      text: 
      # Choose a taxonomy from the `taxonomies` list in `config.yaml` to display (e.g. tags, categories, authors)
      taxonomy: categories
      # Choose how many tags you would like to display (0 = all tags)
      count: 20
    design:
      # Minimum and maximum font sizes (1.0 = 100%).
      font_size_min: 0.7
      font_size_max: 2.0

  - block: collection
    content:
      title: Latest Publications
      subtitle: "Search through [all publications>>](/publication)"
      count: 5
      filters:
        folders:
          - publication
        publication_type: 'article-journal'
      archive:
        enable: true
        text: See all publications
        link: publication/
    design:
      # view: showcase
      columns: '2'
---
