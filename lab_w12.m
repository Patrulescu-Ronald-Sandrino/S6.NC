
# 1) x = cos x
# Newton's method
# x_n+1_ = x_n - f(x_n)/f'(x_n) - comes from the tangent line
# stopping condition |f(x_n+1_)| < eps
# f(x) = x - cos x
# f'(x) = 1 + sin x
f = @(x) x - cos(x);
x0 = pi / 4;
eps = 10^(-4);
U = 100;

xn = x0;
while !(abs(f(xn)) < eps)  && U > 0
  xn = xn - f(xn) / (1 + sin(xn));
  U--;
endwhile

fprintf("1) xn=%f U=%d\n", xn, U); # xn=0.739085 U=98

# 2) secant method sol for x^3 - x^2 - 1 = 0

# x_n+1_ = x_n - f(x_n) * (x_n - x_n-1_) / (f(x_n) - f(x_n-1_))
# stopping condition: |f(x_n+1_)| < eps
# can also use the condition that | x_n - x_n-1 | < eps

x0 = 1;
x1 = 2;
eps = 10^(-4);
N = 100;
f = @(x) x^3 - x^2 - 1;


while !(abs(f(x1)) < eps) && N > 0
  oldx1 = x1;
  x1 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
  x0 = oldx1;
  N--;
endwhile

fprintf("2) x1=%f U=%d\n", x1, U); # x1 = 1.465


# 3) f:[1,2] -> R-set, f(x) = (x - 2)^2 - ln(x), f(x) = 0
# f(a) * f(b) <= 0 
# take middle point and check sign of the function: sgn(f(( a+ b) / 2))

f = @(x) (x - 2)^2 - log(x);
eps = 10^(-4);
N = 100;
a = 1; b = 2;

for i = 1 : N
  c = (a+b) / 2;
  if f(a) * f(c) <= 0
    b = c;
  else
    a = c;
  endif
  if abs(f((a + b) / 2)) < eps # or abs(b - a) < eps
    break
  endif
endfor

fprintf("3) c=%f\n", (a + b) / 2); # c = 1.412

# f(1) = 1 > 0      | 
# f(2) = -ln 2 < 0 | => x belongs (1, 2)

# quadratures



# A quadrature formula is of the forma
# L(f) = su);m_i=1_m(A_i * L_i(f) + R(f))

# L, L_1, L_2, ..., L_m are linearly independent linear functions
# A_i are the coefficients
# R(f) is the remainder

# most important thing about quadratures: 
# the degree of exactness of the formula is
#   d <=> R(e_k) = 0, k=0,1,...,d and R(e_d+1_) != 0 e_k(x) = x^k

# 1) Consider the quadrature formula
# int_0_1(f(x)dx) = w_1 * f(0) + w_2 * f(x1) + R(f).
# Find w_1, w_2, x such that the formula has the highest
#   possible degree of exactness





