clc


##disp("1)");
##x = [0, pi / 2, pi, 3 * pi / 2, 2 * pi];
##f = sin(x);
##x0 = pi / 4;
##
##disp('actual:');
##spline2(x, [cos(0), f, cos(2 * pi)], x0) # result 0.6A ? 
##spline2(x, f, x0)
##disp('expected:');
##spline(x, [cos(0), f, cos(2 * pi)], x0)
##spline(x, f, x0)
##
##t = 0: 0.1 : 2 * pi; y1 = zeros(1, length(t)); y2 = y1;
##for i = 1 : length(t);
##  y1(i) = spline(x, f, t(i));
##  y2(i) = spline2(x, f, t(i));
##endfor
##
##plot(t, y1, t, y2, t, sin(t));


disp("2)");
x = []; y = [];
hold on
axis equal
axis([0 1, 0 1])
for i = 1 : 5
  [X, Y] = ginput(1);
  x = [x X]; y = [y Y];
  plot(X, Y, 'o');
endfor

t = min(x) : 0.01 : max(x);

y1 = zeros(1, length(t)); y2 = y1;
for i = 1 : length(t);
  y1(i) = spline(x, y, t(i));
  y2(i) = spline2(x, y, t(i));
endfor

plot(t, y1, t, y2, t, sin(t));