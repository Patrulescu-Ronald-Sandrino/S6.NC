clc

f = @(x) 1 ./ (2 + cos(x));
a = 0;
b = 2*pi;
eps = 0.001;
nmax = 10;

# 2*pi/sqrt(3) ~ 3.6
Romberg(f, a, b, eps, nmax)

##############################
fprintf('\n\n\n2)');

#                                                                     |nodes
# int_a_b(w(x)f(x)dx) = sigma_b=1_m(A_k*f(x_k))
#               |weigth                                  |coeff.

# l_m = [(x^2 - 1)^m]^(m)
# int_-1_1(l_i * l_j dx) = 0, i != j


# 1) int_-inf_inf(e^(-x^2) dx) Hermite nr=5
#     int_-inf_inf(e^(-x^2) * 1dx)   Gaussian(f, 2, 5)
#                      |      w     |   |f|     case 5

fprintf('\n\n\n1) int_-inf_inf(e^(-x^2) dx)\n')

f = @(x) (x .^2 + 1) ./ (x .^2 + 1);
[I, gn, gc] = Gaussian(f, 2, 5) # sqrt(pi) ~ 1.77
[I, gn, gc] = Gaussian(f, 8, 5) # same val as before

# 2) int_-1_1(sqrt(1-x^2 dx)) Chebyshev 2nd nr=3
#                    |          w         |

fprintf('\n\n\n2) int_-1_1(sqrt(1-x^2 dx))\n')

[I, gn, gc] = Gaussian(f, 2, 3) # pi/2
[I, gn, gc] = Gaussian(f, 8, 3)

# 3) int_-1_1(1 * sin x^2 dx)   Legendre nr=1
#                        |     f    |                 


fprintf('\n\n\n3) int_-1_1(1 * sin x^2 dx)\n');

f = @(x) sin(x .^2);
[I, gn, gc] = Gaussian(f, 2, 1) # ?
[I, gn, gc] = Gaussian(f, 8, 1) # ?

# 4) int_0_inf(x * e^(-x) * sin(x) dx)    Lagerrre n=4
# w = x * e^(-x)
# f = sin(x)

fprintf('\n\n\n4) int_0_inf(x * e^(-x) * sin(x) dx)\n')
f = @(x) sin(x);
# input a=1
[I, gn, gc] = Gaussian(f, 2, 4) # 0.54
[I, gn, gc] = Gaussian(f, 8, 4) # 0.50

# 5) int_-1_1(x^2/(sqrt(1-x^2) dx) Chebyshev 1st nr=2
# w = 1/(sqrt(1-x^2)
# f = x^2

fprintf('\n\n\n5) int_-1_1(x^2/(sqrt(1-x^2) dx)\n')

f = @(x) x.^2;
[I, gn, gc] = Gaussian(f, 2, 2) # pi/2?
[I, gn, gc] = Gaussian(f, 8, 2) # pi/2?
