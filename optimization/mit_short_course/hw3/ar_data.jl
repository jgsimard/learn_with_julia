using Random
Random.seed!(1)

n_train = 200
n_skip = 50
n_test = 50
N = n_train + n_test + n_skip 
n = 2
c = [1.8, -0.8]
y = zeros(N)
y[1:n] .= randn(n)
for i in n+1:N
    y[i] = sum(c[j]*y[i-j] for j in 1:n) + 2randn()
end
y_train = y[1:n_train]
y_test = y[n_train+n_skip+1:n_train+n_skip+n_test]
