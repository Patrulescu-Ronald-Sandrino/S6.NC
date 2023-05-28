# Hermite Interpolation
# x0, x1, ..., xm - nodes

# 2m+2 nodes
  # f(x0), f(x1), ... f(xm)
  # f'(x0), f'(x1), ... f'(xm)

# N{2m+1}(x) = f(z0) + f[z0, z1] * (x - z0) + ... + 
#                          f[z0, z1, ..., z2m+1] * (x - z0) * (x - z1) * ... * (x - z2m)
# z0, z1, ... z2m+1

# f[z0, z1] = (f(z1) - f(z0)) / (z1 - z0)

# z0, z1 -> x0,   z2, z3 -> x1,   z2m, z2m+1 -> xm

# z0           x0       f(x0)       f[x0, z0] = f'(x0)
# z1           x0                     f[x0, x1] = f'(x1)
# z2           x1                     f[x1, x1] = f'(x1)
# z3           x1                     f
# ...
# z2m        xm                    f'(xm)
# z2m1+1 xm                    0


clc
# exercise 1
nodes = [0 3 5 8 13];
f = [0 225 383 623 993];
fd = [75 77 80 74 72];
divdifHermite(nodes, f, fd)

# (x - x1)(x - x2)(x - x3) <- Newton
# (x - x1)^2 (x-x2)
# Sigma f[
# function H = Hermite
disp("1)");
[x, xd] = hermite(nodes, f, fd, 10) # 742.5




# exercise 2
nodes = [1 2];
f = [0 0.6931];
fd = [1 0.5];

disp("2)");
h = hermite(nodes, f, fd, 1.5)
abs(log(1.5) - h)

# exercise 3
x = -5 : 0.01 : 5;
nodes = linspace(-5, 5, 5);
f = sin(2 * x);
f_nodes = sin(2 * nodes);
fd = 2 * cos(2 * x);
fd_nodes = 2 * cos(2 * nodes);
#F = zeros(1, length(x));

for i = 1 : length(x)
  F(i) = hermite(nodes, f_nodes, fd_nodes, x(i));
endfor

plot(x, f, 'b'); hold on;
plot(nodes, sin(2 * nodes), 'k*');
plot(x, F, 'r');


