using FFTW

#BEGIN fourier-transform
function fourier_transform(x, f, neg::Bool=true, unitary::Bool=true)
    dx = x[2] - x[1]
    k = fftshift(fftfreq(length(x), 1/dx) * 2π) |> collect
    F = neg ? fftshift(dx * fft(f)) .* exp.(-1im * k * x[1]) : fftshift(dx * bfft(f)) .* exp.(1im * k * x[1])
    if unitary
        k, F ./ sqrt(2π)
    else
        k, F
    end
end
#END fourier-transform
#BEGIN inverse-fourier-transform
function inverse_fourier_transform(k, f, x, unitary::Bool=true)
    dk = k[2]-k[1]
    F = dk * bfft(ifftshift(f) .* exp.(1im * ifftshift(k) * x[1]))
    if unitary
        F ./ sqrt(2π)
    else
        F
    end
end
#END inverse-fourier-transform