using PyCall
@pyimport matplotlib.animation as anim
using Printf

using FFTW

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

#BEGIN propagate-feit-fleck
function propagate_feit_fleck(V, xgrid, ψ, dt, Ntimes)
    Vgrid = V.(xgrid)
    half_pot_prop = exp.(-1im * Vgrid * dt / 2)
    dx = xgrid[2] - xgrid[1]
    pgrid = fftshift(fftfreq(length(xgrid), 1.0/dx)) * 2π
    dp = pgrid[2] - pgrid[1]
    kin_prop = exp.(-1im * pgrid.^2 * dt / 2.0)

    times = 0:dt:Ntimes*dt
    ψs = zeros(ComplexF64, length(ψ), length(times))
    ψs[:, 1] = ψ

    for t = 1:Ntimes
        Vψ = half_pot_prop .* ψs[:, t]
        ψtilde = kin_prop .* fftshift(fft(Vψ)) * dx / sqrt(2π)
        ψs[:, t+1] = half_pot_prop .* bfft(ifftshift(ψtilde)) / sqrt(2π) * dp
    end
    times, ψs
end

function propagate_feit_fleck_plan(V, xgrid, ψ, dt, Ntimes)
    dx = xgrid[2] - xgrid[1]
    pgrid = fftfreq(length(xgrid), 1.0/dx) * 2π
    dp = pgrid[2] - pgrid[1]
    Vgrid = V.(xgrid)
    half_pot_prop = exp.(-1im * Vgrid * dt / 2) * sqrt(dx / sqrt(2π))
    kin_prop = exp.(-1im * pgrid.^2 * dt / 2.0) * dp / sqrt(2π)

    times = 0:dt:Ntimes*dt
    ψs = zeros(ComplexF64, length(ψ), length(times))
    ψs[:, 1] = ψ

    bfftplan = plan_bfft(ψ; flags=FFTW.ESTIMATE, timelimit=Inf)
    fftplan = plan_fft(ψ; flags=FFTW.ESTIMATE, timelimit=Inf)

    for t = 1:Ntimes
        Vψ = half_pot_prop .* ψs[:, t]
        ψtilde = kin_prop .* (fftplan * Vψ)
        ψs[:, t+1] = half_pot_prop .* (bfftplan * ψtilde)
    end
    times, ψs
end
#END propagate-feit-fleck

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
dt = 2π/100
ntimes = 1000
ψ0 = zeros(ComplexF64, length(x))
ψ0 .= exp.(-(x .+ 3).^2 / 2.0)
ψ0 ./= sqrt(dot_product(ψ0, ψ0, dx))
times, ψs_ground = propagate_accurate(H, ψ0, dt, ntimes)
#END shifted-ground-dynamics

#BEGIN feit-fleck-dynamics
times_so, ψs_so = propagate_feit_fleck(V, x, ψ0, dt, ntimes)
#END feit-fleck-dynamics

function test_dynamics(psi0, V, xgrid, dt, ntimes, name)
    dx = xgrid[2] - xgrid[1]

    ψ0 = zeros(ComplexF64, length(xgrid))
    ψ0 .= psi0.(xgrid)
    ψ0 ./= sqrt(dot_product(ψ0, ψ0, dx))

    H = get_Hamiltonian_matrix_position_space(; V, xgrid)
    @info "Propagating using exact method"
    @time times, ψs = propagate_accurate(H, ψ0, dt, ntimes)
    @info "Propagating using split operator method"
    @time times_so, ψs_so = propagate_feit_fleck_plan(V, xgrid, ψ0, dt, ntimes)
    # @info "Propagating using split operator method using FFTW plan"
    # @time times_so_plan, ψs_so_plan = propagate_feit_fleck_plan(V, xgrid, ψ0, dt, ntimes)

    fig, ax = new_figure("double")
    function animate(i)
        ax.clear()
        t = @sprintf("%.2f", times_so[i+1])
        p1 = ax.plot(x, abs.(ψs[:, i+1]).^2, label="Exact")
        p2 = ax.plot(x, abs.(ψs_so[:, i+1]).^2, label="Split-Operator Method")
        ax.set_title(L"t=%$(t)")
        ax.legend()
        ax.set_xlabel(L"x")
        ax.set_ylabel(L"\mid\braket{x}{\psi(t)}\mid^2")
        p1, p2
    end
    myani = anim.FuncAnimation(fig, animate, interval=50, repeat=true, frames=ntimes+1)
    myani[:save](name, bitrate=-1)
    plt.close()
    times_so, ψs_so
end

dt = 2π/100
ntimes = 1000
ts_gs, ψs_gs = test_dynamics(x->exp(-(x + 3)^2 / 2.0), V, x, dt, ntimes, "shifted_ground_state.gif")
ts_sharper, ψs_sharper = test_dynamics(x->exp(-(x + 3)^2 / (2.0*0.5)), V, x, dt, ntimes, "shifted_sharper_wf.gif")
ts_fatter, ψs_fatter = test_dynamics(x->exp(-(x + 3)^2 / (2.0*2.0)), V, x, dt, ntimes, "shifted_fatter_wf.gif")

pos_gs = [real(ψs_gs[:, j]' * (x .* ψs_gs[:, j]) * dx) for j = 1:ntimes+1]
pos_sharper = [real(ψs_sharper[:, j]' * (x .* ψs_sharper[:, j]) * dx) for j in 1:ntimes+1]
pos_fatter = [real(ψs_fatter[:, j]' * (x .* ψs_fatter[:, j]) * dx) for j in 1:ntimes+1]

new_figure("double")
plt.plot(ts_gs, pos_gs, label="Ground State")
plt.plot(ts_gs, pos_sharper, label="Narrower Wave Function")
plt.plot(ts_gs, pos_fatter, label="Broader Wave Function")
plt.xlabel("time")
plt.ylabel(L"\langle x\rangle(t)")
plt.legend()
plt.savefig("positions_harmonic.png", bbox_inches="tight", dpi=1900)

width_gs = [real(ψs_gs[:, j]' * (x.^2 .* ψs_gs[:, j]) * dx) for j = 1:ntimes+1] .- pos_gs.^2
width_sharper = [real(ψs_sharper[:, j]' * (x.^2 .* ψs_sharper[:, j]) * dx) for j = 1:ntimes+1] .- pos_sharper.^2
width_fatter = [real(ψs_fatter[:, j]' * (x.^2 .* ψs_fatter[:, j]) * dx) for j = 1:ntimes+1] .- pos_fatter.^2

new_figure("double")
plt.plot(ts_gs, width_gs, label="Ground State")
plt.plot(ts_gs, width_sharper, label="Narrower Wave Function")
plt.plot(ts_gs, width_fatter, label="Broader Wave Function")
plt.xlabel("time")
plt.ylabel(L"\langle x^2\rangle(t) - \langle x\rangle^2(t)")
plt.legend()
plt.savefig("widths_harmonic.png", bbox_inches="tight", dpi=1900)