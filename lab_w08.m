clc;

# highest degree polynomial for which the reminder is 0

disp('1)');

f = @(x) 1./x;
a = 1;
b = 2;
n = 2;


disp('RectangleRule');
I = RectangleRule(f, a, b, n)
while (!(abs(log(2) - I) < 0.0001))
  n =n + 1;
  I = RectangleRule(f, a, b, n)
end

fprintf("n = %d\n", n);

# log(2) = 0.6931...
# n = 18 for rectangle
# n = 25 for trapezoid
# n = 3 for simspon

# Simpson
# you can choose m to be 10


n = 2;
disp('TrapezoidRule');
I = TrapezoidRule(f, a, b, n)
while (!(abs(log(2) - I) < 0.0001))
  n =n + 1;
  I = TrapezoidRule(f, a, b, n)
end

fprintf("n = %d\n", n);

n = 2;
disp('SimpsonRule');
I = SimpsonRule(f, a, b, n)
while (!(abs(log(2) - I) < 0.0001))
  n =n + 1;
  I = SimpsonRule(f, a, b, n)
end

fprintf("n = %d\n", n);


fprintf("#######################\n")


disp('2)');

e = 0.0001;
n = 1; # and n = 4
f =@(x) exp(-x.^2);
a = 0; b = 1;

adquad(f, a, b, e, @RectangleRule, n)
adquad(f, a, b, e, @TrapezoidRule, n)
adquad(f, a, b, e, @SimpsonRule, n)


