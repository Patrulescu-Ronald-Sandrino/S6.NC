
disp('Exercise 1')

nodes = 1930:10:1980;
f = [123203  131669  150697  179323  203212  226505];

x = 1955
Lagrange(nodes, f, x)

x = 1995
Lagrange(nodes, f, x)



disp('Exercise 2')
nodes = [100 121 144];
f = [10 11 12];
x = 115;
Lagrange(nodes, f, x)



disp('Exercise 3')
x = 0:0.1:10;
f = (1 + cos(pi * x)) ./ (1 + x);
plot(x, f); hold on

nodes = linspace(0,10,21);
f = (1 + cos(pi * nodes)) ./ (1 + nodes);
f1 = ones(1, length(x));
for i = 1:length(x)
  f1(i) = Lagrange(nodes, f, x(i));
endfor
plot(x, f1); hold off