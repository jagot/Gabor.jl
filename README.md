# Gabor

[![Build Status](https://travis-ci.org/jagot/Gabor.jl.svg?branch=master)](https://travis-ci.org/jagot/Gabor.jl)

Small routine to calculate Gabor transform of a vector.

Example usage:

```julia
t = linspace(0,3,1000)
f = sin(5*ceil(t)*2π.*t)
freq,G = gabor(t, f, 0.1)
```

This produces

![Simple Gabor transform example](examples/simple.png?raw=true "Simple Gabor transform example")
