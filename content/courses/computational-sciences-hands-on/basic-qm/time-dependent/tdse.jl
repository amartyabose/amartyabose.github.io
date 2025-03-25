using PyCall
@pyimport matplotlib.animation as anim
using Printf

include("../Hamiltonian.jl")

#BEGIN propagate-accurate
function propagate_accurate(H, ψ, dt, Ntimes)
    times = 0:dt:Ntimes*dt
    ψs = zeros(ComplexF64, length(ψ), length(times))
    ψs[:, 1] = ψ

    U = exp(- 1im * H * dt)

    for ts = 1:Ntimes
        ψs[:, ts+1] = U * ψs[:, ts]
    end
    times, ψs
end
#END propagate-accurate

#BEGIN propagate-approx
function propagate_approx(H, ψ, dt, Ntimes)
    times = 0:dt:Ntimes*dt
    ψs = zeros(ComplexF64, length(ψ), length(times))
    ψs[:, 1] = ψ

    id = Matrix{ComplexF64}(1.0I, size(H)...)
    U = inv(id + 1im * H * dt/2) * (id - 1im * H * dt/2)

    for ts = 1:Ntimes
        ψs[:, ts+1] = U * ψs[:, ts]
    end
    times, ψs
end
#END propagate-approx

#BEGIN dot-product
function dot_product(ϕ1, ϕ2, dx)
    ϕ1' * ϕ2 * dx
end
#END dot-product

#BEGIN potential
V(x::Float64) = 0.5 * x^2
#END potential

#BEGIN grid1
dx = 0.005
x = -10.0:dx:10.0
#END grid1

#BEGIN diagonalize
using LinearAlgebra
H = get_Hamiltonian_matrix_position_space(; V, xgrid=x)
#END diagonalize

#BEGIN shifted-ground-dynamics
dt = 0.0625
ntimes = 400
ψ0 = zeros(ComplexF64, length(x))
ψ0 = exp.(-(x .+ 3).^2 / 2.0)
ψ0 ./= sqrt(dot_product(ψ0, ψ0, dx))
times, ψs_ground = propagate_accurate(H, ψ0, dt, ntimes)
#END shifted-ground-dynamics

#BEGIN dynamics
ψ0 = zeros(ComplexF64, length(x))
ψ0 = exp.(-(x .+ 3).^2 / (2.0 * 0.5))
ψ0 ./= sqrt(dot_product(ψ0, ψ0, dx))
times, ψs_sharper = propagate_accurate(H, ψ0, dt, ntimes)

ψ0 = zeros(ComplexF64, length(x))
ψ0 = exp.(-(x .+ 3).^2 / (2.0 * 2.0))
ψ0 ./= sqrt(dot_product(ψ0, ψ0, dx))
times, ψs_flatter = propagate_accurate(H, ψ0, dt, ntimes)
#END dynamics

fig, ax = new_figure("double")
function animate(i)
    ax.clear()
    t = @sprintf("%.2f", times[i+1])
    p1 = ax.plot(x, abs.(ψs_ground[:, i+1]).^2, label=L"t=%$(t)")
    ax.legend()
    ax.set_xlabel(L"x")
    ax.set_ylabel(L"\mid\braket{x}{\psi(t)}\mid^2")
    p1
end
myani = anim.FuncAnimation(fig, animate, interval=50, repeat=true, frames=400)
myani[:save]("shifted_ground_state_harmonic.gif", bitrate=-1)

layout = @layout[a; b; c]
anim = @animate for j = 1:length(times)
    p1 = plot(x, abs.(ψs_ground[:, j]).^2, ylims=(0, maximum(abs.(ψs_ground).^2)))
    p2 = plot(x, abs.(ψs_sharper[:, j]).^2, ylims=(0, maximum(abs.(ψs_sharper).^2)))
    p3 = plot(x, abs.(ψs_flatter[:, j]).^2, ylims=(0, maximum(abs.(ψs_flatter).^2)))
    xlabel!(p1, L"x")
    ylabel!(p1, L"\mid\langle\psi(t)|\psi(t)\rangle\mid^2")
    xlabel!(p2, L"x")
    ylabel!(p2, L"\mid\langle\psi(t)|\psi(t)\rangle\mid^2")
    xlabel!(p3, L"x")
    ylabel!(p3, L"\mid\langle\psi(t)|\psi(t)\rangle\mid^2")
    plot(p1, p2, p3; layout)
end
gif(anim, "shifted_harmonic.gif")

anim = @animate for j=1:ntimes
    plot(x, abs.(ψs[:, j]).^2, ylims=(0, maximum(abs.(ψs).^2)))
    xlabel!(L"x")
    ylabel!(L"\mid\langle\psi(t)|\psi(t)\rangle\mid^2")
end
gif(anim, "shifted_ground_state_harmonic.gif")