---
# Page title
title: "Introduction to Programming with Julia"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Introduction to Julia

# Page summary for search engines.
summary: Basics of scientific software development with Julia.

date: 2025-02-25

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 10
---

[Julia](https://julialang.org) is a high-level programming language like Python with a focus on numerical and scientific computation. It is just-in-time (JIT) compiled and consequently extremely fast. In this module, we will explore basics of programming with Julia. Of course the skills are easily transferrable to many other programming languages.

Julia already comes equipped with several modules useful for scientific programming in its standard library. There are many more open-source libraries addressing a variety of problems.

### Standard Library Modules
1. [LinearAlgebra](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/) for matrix decompositions. This library interfaces into highly efficient LAPACK and BLAS libraries.
1. [Test](https://docs.julialang.org/en/v1/stdlib/Test/) for unit testing.
1. [Logging](https://docs.julialang.org/en/v1/stdlib/Logging/)
1. [TOML](https://docs.julialang.org/en/v1/stdlib/TOML/) for parsing TOML formatted input files.

### Other packages of importance for the course
1. [Plots.jl](https://docs.juliaplots.org/stable/) or [PyPlot.jl](https://github.com/JuliaPy/PyPlot.jl) for plotting.
1. [FFTW.jl](https://juliamath.github.io/FFTW.jl/stable/) for Fourier transforms.

### Beyond this course
1. [DifferentialEquations.jl](https://docs.sciml.ai/DiffEqDocs/stable/) for built-in solutions to differential equations using advanced algorithms.
1. [DFTK.jl](https://docs.dftk.org/stable/) for plane-wave DFT calculations.
1. [Molly.jl](https://juliamolsim.github.io/Molly.jl/v0.4/) for molecular dynamics simulations.
1. [Lux.jl](https://lux.csail.mit.edu/stable/), [Flux.jl](https://fluxml.ai/Flux.jl/stable/), or [KNet.jl](https://fluxml.ai/Flux.jl/stable/) for neural networks.

## Extra Resources

We will cover the basics in class lectures and through assignments and homeworks. However, programming is a skill that requires time and practice to master. Full programming courses can themselves be a semester or a year long affair especially when dealing with data structures and algorithms. Because we do not have this luxury, consider reading up using several resources and tutorials online or watching youtube videos. Julia has an official youtube channel, where people post teaching material. In addition the online Julia manual is extremely thorough and detailed. Below are some extra resources that might help you get started.

### Books

1. [Julia 1.0 Programming by Ivo Balbaert](https://www.amazon.in/Julia-1-0-Programming-high-performance-applications/dp/1788999096/ref=sr_1_18?crid=2HS4KPAUTKL4I&dib=eyJ2IjoiMSJ9.45-mXAi0uk8lrMpSYUTJaypqinbmZxCRB9blPtABda8N6hdA74Fi0XSHHAmXaV0pMFI39FsV6uFblO170Xuo3RDsrNTzObMvE9htWemKBBwKp-XYPFhccV1yW4xU8g5CWU1WCqzwGSkRuSKT9Eg0-tp6s6KCik4bbz-a4e7YF2unwXtVp3r6Jt5iXkYtKTXY1Z9PPmb-0BadLadRu4Vu121olZZQfDkhxNqFnr1uIKs.WYYZU-fjzMuWRQZrMLzZioHN_QCAMGvmO5gPLFMVYds&dib_tag=se&keywords=julia+programming&qid=1738438366&sprefix=julia+programmi%2Caps%2C192&sr=8-18&xpid=yBgn8VnT0QsqK)
1. [Julia as a Second Language by Eric Engheim](https://www.amazon.in/Julia-Second-Language-Erik-Engheim/dp/1617299715/ref=sr_1_19?crid=2HS4KPAUTKL4I&dib=eyJ2IjoiMSJ9.45-mXAi0uk8lrMpSYUTJaypqinbmZxCRB9blPtABda8N6hdA74Fi0XSHHAmXaV0pMFI39FsV6uFblO170Xuo3RDsrNTzObMvE9htWemKBBwKp-XYPFhccV1yW4xU8g5CWU1WCqzwGSkRuSKT9Eg0-tp6s6KCik4bbz-a4e7YF2unwXtVp3r6Jt5iXkYtKTXY1Z9PPmb-0BadLadRu4Vu121olZZQfDkhxNqFnr1uIKs.WYYZU-fjzMuWRQZrMLzZioHN_QCAMGvmO5gPLFMVYds&dib_tag=se&keywords=julia+programming&qid=1738438366&sprefix=julia+programmi%2Caps%2C192&sr=8-19&xpid=yBgn8VnT0QsqK)

### Official Julia manual

1. [Julia documentation](https://docs.julialang.org/en/v1/)
1. [Julia website](https://julialang.org)

### Youtube videos

1. [Julia tutorial videos](https://www.youtube.com/watch?v=4igzy3bGVkQ&list=PLP8iPy9hna6SCcFv3FvY_qjAmtTsNYHQE)