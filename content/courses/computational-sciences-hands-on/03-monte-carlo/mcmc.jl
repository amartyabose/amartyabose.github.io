using Random
using Statistics

#BEGIN single-MC
function MCsingle(P, g, xmax::Float64, nsteps::Int64)
    x = rand() - 0.5
    gtot = g(x)
    p = P(x)
    accept = 1
    for _ = 1:nsteps - 1
        xnew = x + (2rand() - 1) * xmax
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
#END single-MC

function MC(P, g, xmax::Float64, nsteps::Int64, nblocks::Int64)
    integral = zeros(nblocks)
    acceptance = zeros(nblocks)
    for j = 1:nblocks
        integral[j], acceptance[j] = MCsingle(P, g, xmax, trunc(Int64, nsteps/nblocks))
    end
    sum(integral)/nblocks, std(integral)/sqrt(nblocks), sum(acceptance)/nblocks
end

num_trials = [10^j for j in 2:10]
vals = [MC(x->exp(-x^2), x->x^2, 3.0, j, 10) for j in num_trials]

new_figure("double")
plt.errorbar(num_trials, [val[1] for val in vals], yerr=[val[2] for val in vals], fmt="o-")
plt.xscale("log")
plt.xlabel("number of trials")
plt.ylabel("integral")
plt.savefig("MC_1.png", bbox_inches="tight", dpi=1900)

new_figure("double")
plt.plot(num_trials, [val[2] for val in vals])
plt.xscale("log")
plt.xlabel("number of trials")
plt.ylabel("error")
plt.savefig("MC_1_error.png", bbox_inches="tight", dpi=1900)