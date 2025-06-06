using Random
using Statistics

function MCsingle(P, g, xinit::AbstractVector{Float64}, xmax::Float64, nsteps::Int64)
    x = copy(xinit)
    gtot = g(x)
    p = P(x)
    accept = 1
    dims = length(xinit)
    for _ = 1:nsteps - 1
        xnew = copy(x)
        ind = rand(1:dims)
        xnew[ind] += (2rand() - 1) * xmax
        pnew = P(xnew)
        if pnew / p ≥ rand()
            x = xnew
            p = pnew
            accept += 1
        end
        gtot += g(x)
    end
    gtot / nsteps, accept / nsteps
end

function MC(P, g, xinit::AbstractVector{Float64}, xmax::Float64, nsteps::Int64, nblocks::Int64)
    integral = zeros(nblocks)
    acceptance = zeros(nblocks)
    for j = 1:nblocks
        integral[j], acceptance[j] = MCsingle(P, g, xinit, xmax, trunc(Int64, nsteps/nblocks))
    end
    sum(integral)/nblocks, std(integral)/sqrt(nblocks), sum(acceptance)/nblocks
end

num_trials = [10^j for j in 2:8]
vals = [MC(x->exp(-sum(x.^2)), x->sum(x.^2), [rand() - 0.5], 3.0, j, 10) for j in num_trials]
