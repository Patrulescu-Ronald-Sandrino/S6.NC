clc


disp("1)")
x = 1 : 7;
y = [ 13 15 20 14 15 13 10 ];
u = 1;

p = polyfit(x, y, u)
polyval(p, 8)

plot(x, y, '*')
hold on
plot(x, polyval(p, x))
hold off



disp("2)")
disp("a)")
t = [0 10 20 30 40 60 80 100];
P = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133];

n = 1; # 45 degrees Celsius

p = polyfit(t, P, n);

polyval(p, 45)



disp("b)")
# n = 2, 3; # 45 degrees Celsius

p2 = polyfit(t, P, 2);
p3 = polyfit(t, P, 3);

polyval(p2, 45)
polyval(p3, 45)


disp("c)")
P45 = 0.095848;
abs(P45 - polyval(p, 45))
abs(P45 - polyval(p2, 45))
abs(P45 - polyval(p3, 45))


disp("d)")



