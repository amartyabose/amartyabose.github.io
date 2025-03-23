#BEGIN get-Hamiltonian
function get_Hamiltonian_matrix_position_space(; V, xgrid::AbstractVector{Float64}, hbar::Float64=1.0, m::Float64=1.0)
    dx = xgrid[2] - xgrid[1]
    Npoints = length(xgrid)
    H = zeros(Npoints, Npoints)
    for r = 1:Npoints, c = 1:Npoints
        if r == c
            H[r, c] = hbar^2 / (m * dx^2) + V(xgrid[r])
        elseif r == c-1 || r == c+1
            H[r, c] = -hbar^2 / (2 * m * dx^2)
        end
    end
    H
end
#END get-Hamiltonian

#BEGIN potential
V(x::Float64) = 0.5 * x^2
#END potential

#BEGIN grid1
x = -0.5:0.1:0.5
#END grid1

#BEGIN diagonalize
using LinearAlgebra
H = get_Hamiltonian_matrix_position_space(; V, xgrid=x)
vals, vecs = eigen(H)
#END diagonalize

#BEGIN dx-converge
dxs = logrange(0.25, 0.001, 200)
energies = zeros(length(dxs))
@time for (i, dx) in enumerate(dxs)
    x = -0.5:dx:0.5
    H = get_Hamiltonian_matrix_position_space(; V, xgrid=x)
    # H = SymTridiagonal(get_Hamiltonian_matrix_position_space(; V, xgrid=x))
    vals, vecs = eigen(H)
    energies[i] = vals[1]
end
new_figure("double")
plt.plot(dxs, energies)
plt.xscale("log")
plt.xlabel(L"\Delta x")
plt.ylabel(L"E_0")
plt.savefig("dx_convergence.png", bbox_inches="tight", dpi=1900)
plt.close()
#END dx-converge

Lmax = LinRange(0.5, 5, 100)
energies = zeros(length(Lmax), 5)
for (j, lmax) in enumerate(Lmax)
    x = -lmax:0.001:lmax
    H = SymTridiagonal(get_Hamiltonian_matrix_position_space(; V, xgrid=x))
    vals, vecs = eigen(H)
    energies[j, :] = vals[1:5]
    @info "$(lmax) done. $(j) of $(length(Lmax)). $(energies[j, 1]) is the ground state energy."
end
fig, ax = new_figure("double")
for j = 1:5
    plt.plot(Lmax, energies[:, j], label=L"E_%$(j-1)")
end
plt.xlabel(L"L_\text{max}")
plt.ylabel("Energy")
plt.legend()

ax2 = fig.add_axes([0.4, 0.3, 0.375, 0.375])
for axis in ["top", "bottom", "left", "right"]
    ax2.spines[axis].set_linewidth(0.1)
    ax2.spines[axis].set_color("gray")
end
ax2.tick_params(width=0.1, direction="in", color="gray")
ax2.tick_params(which="minor", width=0.05, direction="in", color="gray")
ind1 = findfirst(x->x≥3.0, Lmax)
for j = 1:5
    plt.plot(Lmax[ind1:end], energies[ind1:end, j])
end
ax2.set_xlabel(L"L_\text{max}")
ax2.set_ylabel("Energy")

plt.savefig("Lmax_convergence.png", bbox_inches="tight", dpi=1900)