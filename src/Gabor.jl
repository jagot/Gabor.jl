module Gabor
using DSP

function pad_zeros(v, n)
    d = max(n - length(v),0)
    pre,post = fld(d,2),cld(d,2)
    [zeros(pre);v;zeros(post)]
end

function gabor{T}(t, f::Vector{T}, σ = 1.0, tol = 1e-5,
                  wf = n -> hanning(n))
    Δt = sqrt(-2σ^2*log(tol))
    Δi = round(Int, 2Δt/(t[2]-t[1]))

    w = wf(2Δi+1)

    nt = length(t)
    G = zeros(Complex{T}, (2Δi+1, nt))
    for i = 1:nt
        sel = max(1,i-Δi):min(nt,i+Δi)
        G[:,i] = fftshift(fft(pad_zeros(exp(-(t[sel]-t[i]).^2/2(σ^2)).*f[sel], 2Δi+1).*w))
    end
    fftshift(collect(fftfreq(2Δi+1,1.0/(t[2]-t[1])))), G/√(2π)
end

export gabor

end
