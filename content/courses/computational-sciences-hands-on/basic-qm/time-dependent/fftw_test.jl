using FFTW

dt = 0.01
ts = 0:dt:100π
# y = cos.(ts) .* exp.(-ts.^2/100)#  + 0.5 * sin.(2.0 * ts);
y = exp.(-1im * 5 * ts)
plt.plot(ts, y)
F = fftshift(bfft(y));
ω = fftshift(fftfreq(length(ts), 1/dt)) * 2π
plt.plot(ω, real.(F))
plt.plot(ω, imag.(F))
plt.plot(ω, abs.(F))
