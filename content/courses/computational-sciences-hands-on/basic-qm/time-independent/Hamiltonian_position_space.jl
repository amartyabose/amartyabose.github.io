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
plt.savefig("dx_convergence.jpeg", bbox_inches="tight")
#END dx-converge
