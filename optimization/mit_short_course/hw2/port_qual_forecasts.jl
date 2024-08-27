#  data for portfolio optimization with qualitative return forecasts
#  provides n, l, u, Sigma, sig

using LinearAlgebra, Random
Random.seed!(0)

n = 10 # number of stocks
k = 2  # number of factors

c = 0.05 .+ 0.1*randn(n)
r = 0.2*rand(n)
l = c - r
u = c + r

F = randn(n, k)
Sigma = 3Diagonal(0.5 .+ rand(n)) + F*F'
Sigma = Sigma/maximum(diag(Sigma))
Sigma = 0.2^2*Sigma
sigma_max = sqrt(0.07)
