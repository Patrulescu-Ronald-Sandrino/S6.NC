clc
disp(datestr(now))
displayPlots = 0

# 1
nodes = [1 1.5 2 3 4];
f = [0  0.17609  0.30103  0.47712  0.60206];

# compute the aprox of f at 2.5 and 3.25
fprintf('1.\n')
fprintf('  newton(nodes, f, 2.5) = %f\n', newton(nodes, f, 2.5));
fprintf('  newton(nodes, f, 3.25) = %f\n', newton(nodes, f, 3.25));



# E = max | f(yi) - N4f(yi) | 
y = (10:35)/10;
v = zeros(1, length(y)); # can be omitted

for i = 1:length(y)
    v(i) = abs(log10(y(i)) - newton(nodes, f, y(i)));
endfor

# max(v)
fprintf('  E = %0.4f\n', max(v));

# -------------------------------------------------------------------

# 2.a)
nodes = 1:5;
f = [22  23  25  30  28];


fprintf('2.a) %f\n', newton(nodes, f, 2.5));



# 2.b)

x = 1:0.1:5;
# run the function newton for each point
F = [];

for i = 1:length(x)
  F(i) = newton(nodes, f, x(i));
endfor

if displayPlots == 1
  figure('name', '2.b)'); hold on
  plot(nodes, f, '*'); hold on
  plot(x, F); hold off
endif


# -------------------------------------------------------------------

# 3. Consider the function f: [0;6] -> R; f(x) = e^sin x 
# and 13 equidistant interpolation points. Plot the 
# interpolation points, the function f and the 
# Newton intepolation polynomial N12f.
x = 0:0.1:6;
nodes = linspace(0, 6, 13);
fnodes = exp(sin(nodes));
f = exp(sin(x));

F = [];
for i = 1:length(x)
  F(i) = newton(nodes, fnodes, x(i));
endfor


if displayPlots == 1
  figure('name', '3.'); hold on
  plot(nodes, fnodes, '*'); hold on
  plot(x, f, 'r'); hold on
  plot(x, F, 'y'); hold off
endif

# -------------------------------------------------------------------

# 4.
nodes = [100 121 141 169];
f = [10 11 12 13];
x = 115;
e = 10^-3;

#fprintf('4. approximation of %f with precision %f is %f\n', x, e, aitken(nodes, f, x, e));
#aitken(nodes, f, x, e)
fprintf("4. %s\n", aitken(nodes, f, x, e));


