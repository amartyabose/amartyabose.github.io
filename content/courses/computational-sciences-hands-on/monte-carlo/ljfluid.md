---
# Page title
title: "MC Simulation of Lennard-Jones Fluid: A Project"

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: "Project: LJ Fluid"

# Page summary for search engines.
summary: 

# Date page published
date: 2025-04-07

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 210
---

A Lennard-Jones fluid, in its simplest form, is a monoatomic fluid with the constituent particles interacting in a pair-wise fashion using the famous [Lennard-Jones potential](https://en.wikipedia.org/wiki/Lennard-Jones_potential#Overview):
{{<math>}}
$$V_\text{LJ}(r_{ij}) = 4\epsilon \left(\left(\frac{\sigma}{r_{ij}}\right)^{12}-\left(\frac{\sigma}{r_{ij}}\right)^6\right),$$
{{</math>}}
where $r_{ij}$ is the distance between the $i$th and the $j$th atom, $r_{ij} = \sqrt{(x_i-x_j)^2 + (y_i-y_j)^2 + (z_i-z_j)^2}$.

This will be a guided tutorial in exploring the thermodynamics of the Lennard-Jones fluid using Metropolis Monte Carlo. The simulations are going to use **periodic boundary conditions**, with the potential evaluated using the **minimum image convention**.

## Configuration Space Definition and Convention
Because Julia is a column-major language, we are going to store the coordinates of any given frame with $N$ atoms in a $(3\times N)$ matrix, with the $j$th column giving the position vector of the $j$ atom.

## Implement the Lennard-Jones Potential
The evaluation of the potential for the full box of particles will proceed in three steps:
1. Write a function, `Vpair` to calculate the Lennard-Jones potential for a distance.
1. In addition write a `get_distance` function which will take the $3\times N$ position matrix and two indices $i$ and $j$, and return the distance between the $i$th and the $j$th atoms (columns) under the minimum image convention.
1. Write a function, `Vtot`, which takes in the position matrix and calculates the total potential energy as a sum of all the pair-wise potential energies obtained using the `Vpair` function.

## Implement MC Moves
Because this is a mono-atomic system, the only possible move is a translation. We will evaluate two different moves and try to understand what are the pros and cons.
1. Write a `move_single` function that takes in a position matrix, chooses one random atom and moves one of its dimensions at random. Is this the most efficient way of constructing moves? No! However, its the simplest.
1. Write a `move_all` function which basically moves all the atoms in every move.

Remember to enforce periodic boundary conditions in your move as well.

## Implement the MC function
In the spirit of what has been discussed previously, implement the actual MC code which takes in a starting initial configuration and returns a series of frames using the `Vtot` function for a particular temperature. Each frame is a $3\times N$ matrix. If there are $F$ frames, you may choose to store them as a $F\times 3\times N$ tensor.

## Analysis and Runs
Now we should have all the ingredients ready. How does one do a real simulation?
1. Choose all the parameters for the Lennard-Jones potential, the box size $L$, and the number of particles $N$.
1. Create a random initial configuration. This in principle can be obtained in any way. For real problems, one could use the crystal structure of the system, a previous molecular dynamics run, or electronic structure minimization. In our case, we will just use a random placement of molecules.
1. Run a single MC run evaluating the total potential energy at each frame to see if you are equilibrated. This is called the **equilibration run**.
    1. How many MC steps does equilibration take when using `move_single`?
    1. How many MC steps does equilibration take starting from the same initial configuration when using `move_all`?
1. You can choose 5 or 10 different frames from the **post-equilibration part** of the equilibration trajectory and launch multiple MC runs to obtain error analysis. These would be called the production runs. Do a comparison between `move_single` and `move_all`. Some sample observables are discussed in [Observables](#observables).
1. Choose one of the production runs and visualize using VMD / PyMol.

## Observables
We are interested in understanding a few bulk observables at different temperatures and number densities. The simplest are the interatomic distance, or the total potential energy. In addition to just looking at the average with some MC error, one should also plot the histograms to understand the distribution of these quantities.

Apart from that one simple but very important observable is the [Radial Distribution Function](https://en.wikipedia.org/wiki/Radial_distribution_function), which tells us about the local packing and particle distribution with respect to the bulk density. To calculate the radial distribution function:
1. Define the average density at a distance $r$, $\langle \rho(r)\rangle$, as the local density of particles at a distance $r$ away from another particle. The number of particles at distance $r$ from another particle is therefore $4\pi r^2 \langle\rho(r)\rangle$.
    1. Calculate $\langle\rho(r)\rangle$ by finding the average number of particles at a distance $r$ from any particle and dividing it by $4\pi r^2$.
1. The radial distribution function, $g(r)$, is defined as $g(r) = \frac{\langle\rho(r)\rangle}{\rho}$ where $\rho$ is the bulk density.