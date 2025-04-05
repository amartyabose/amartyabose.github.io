using FFTW

#BEGIN setup-signal
dx = 0.01
nsteps = 2^15
x = -nsteps/2*dx:dx:nsteps/2*dx

σ = 10.0
p = 5.0
ψ = exp.(-x.^2/(2 * σ^2) + 1im * p * x) / sqrt(sqrt(π * σ))
#END setup-signal

new_figure("double")
plt.plot(x, real.(ψ), label="Real")
plt.plot(x, imag.(ψ), label="Imag")
plt.plot(x, abs.(ψ).^2, label="Abs Squared")
plt.legend()
plt.xlabel(L"x")
plt.ylabel(L"\psi(x)")
plt.xlim(-40, 40)
plt.savefig("pos_space_wf.png", bbox_inches="tight", dpi=1900)
plt.close()

#BEGIN fourier-transform
function fourier_transform(x, f, unitary::Bool)
    dx = x[2] - x[1]
    k = (fftfreq(length(x), 1/dx) * 2π) |> collect
    F = dx * fft(f) .* exp.(-1im * k * x[1])
    if unitary
        k, F ./ sqrt(2π)
    else
        k, F
    end
end
#END fourier-transform

#BEGIN apply-fourier-transform
k, ψtilde = fourier_transform(x, ψ, true)

k = fftshift(k)
ψtilde = fftshift(ψtilde)
#END apply-fourier-transform

new_figure("double")
plt.plot(k, real.(ψtilde), label="Real")
plt.plot(k, imag.(ψtilde), label="Imag")
plt.plot(k, σ^(3/4)/π^(1/4) * exp.(-σ^2/2 * (k .- p).^2), ":", label="Analytic")
plt.xlim(4.25, 5.75)
plt.xlabel(L"p")
plt.ylabel(L"\tilde\psi(p)")
plt.legend()
plt.savefig("mom_space_wf.png", bbox_inches="tight", dpi=1900)
plt.close()