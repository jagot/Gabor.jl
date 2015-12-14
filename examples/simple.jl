using Gabor

using PyCall
using PyPlot

t = linspace(0,3,1000)
f = sin(5*ceil(t)*2π.*t)
freq,G = gabor(t, f, 0.1)

fig, axs = subplots(nrows=2,sharex="col")
subplot(axs[1])
plot(t,f, "k")
margins(0,0.1)
ylabel(L"$f(t)$")
title("Signal")

subplot(axs[2])
pcolormesh(t,freq,abs(G), rasterized="true",
           cmap = plt[:get_cmap]("viridis"))
ylim(-20,20)

xlabel(L"$t/T$")
ylabel(L"$\omega/2\pi$")
title("Gabor transform")

tight_layout()
savefig("simple.png", dpi=100)
