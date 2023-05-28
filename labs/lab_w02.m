exercise = '5';


if exercise == '1'
  # l0(x) = 1
  # l1(x) = x
  # l2(x)=3/2*x^2 - ½
  # l3(x)=5/2*x^3 - 3/2*x
  # l4(x)= 35/8*x^4 - 15/4*x^2 + 3/8, x ∈ [0,1]
  
  x = 0:0.01:1;
  
  L1 = x;
  L2 = 3/2*x.^2 - 1/2;
  L3 = 5/2*x.^3 - 3/2*x;
  L4 = 35/8*x.^4 - 15/4*x.^2 + 3/8;
  
  # subplot(rows, columns, index from 1)
  subplot(2, 2, 1)
  plot(x, L1)
  title('1st polynomial')

  subplot(2, 2, 2)
  plot(x, L2)
  title('2nd polynomial')

  subplot(2, 2, 3)
  plot(x, L3)
  title('3rd polynomial')

  subplot(2, 2, 4)
  plot(x, L4)
  title('4th polynomial')
elseif exercise == '2a'
  plotMode=1;
  # T{n}(t) = cos(n*arccos t), t ∈ [-1,1]
  # T{1}, T{2}, T{3}
  
  t = -1:0.01:1
  
  # hold on or plot all of them
  if plotMode == 1
    #plot(t, cos(1*acos(t)), t, cos(2*acos(t)), t, cos(3*acos(t)))
  elseif plotMode == 2
    plot(t, cos(1*acos(t))); hold on
    plot(t, cos(2*acos(t))); hold on
    plot(t, cos(3*acos(t))); hold on
    hold off
     clf # clears the figure
  endif
elseif exercise == '2b'
  # T{n+1}(x) = 2xT{n}(x) - T{n-1}(x) , x ∈ [-1,1]
  # T{0}(x) = 1, T{1})(x)=x
  
  x = -1:0.01:1;
  #n = input('n=');
  n = 10;
  
  plot(x, Chebyshev(0, x)); hold on
  for i = 1:n
    plot(x, Chebyshev(i, x))
  endfor
  hold off
elseif exercise == '3'
  # note that f^^(k) means k-th derivative of f
  # P{n}(x) = Σ{k=0}{n}((x - x0)^k/k!*f^^(k)(x0))
  # f(x) = e^x, x0=0, [-1,3]
  # f^^(k)(x) = e^x, f^^(k)(0)=1
  # P{n}(x) = f(x0) + Σ{k=1}{n}(x^k/k!)

  # in each step you multiply with x/k

  x = -1:0.01:3;
  hold on
  for n = 0:6
    plot(x, Taylor(n, x))
  endfor
  hold off
elseif exercise == '4'
  # f(x) = sqrt(5*x^2+1)
  # h = 0.25
  # x{i} = 1 +i*h, i=0,6
  m = 6; # note that m = length(f) - 1
  x = 1:0.25:2.5;
  f = sqrt(5*x.^2+1);
  finiteDif(m, f)
elseif exercise == '5'
  # divided difference
  # i=0 | x0 | f[x0] | f[x0, x1] | f[x0, x1, x2] | ... | f[x0, ..., xm]
  # i=1 | x1 | f[x1] | f[x1, x2] | f[x1, x2, x3] | ... | 0
  # i=2 | x2 | f[x2] | f[x2, x3] |                     | ... | 0
  # ...
  # i=m | xm | f[xm] | 0 | 0 | | 
  
  # f[x0, ..., xk] = (f[x1, ... ,xk] - f[x0, ...,xk-1])/(xk - x0)
  # f[x1, x2, x3] = (f[x2, x3] - f[x1, x2])/(x3 - x1)
  x = [2 4 6 8];
  f = [ 4 8 14 16];
  dividedDif(x, f)
endif
