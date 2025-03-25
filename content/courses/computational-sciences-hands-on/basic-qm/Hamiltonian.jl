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