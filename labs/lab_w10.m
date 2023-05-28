clc

fprintf('1)\n');

# 2x1 + 4x2 + 2x3 = 8 => x1 = (8 - 2x3 - 4x2)/2 = 1
#  0        -x2 +   x3 = 0 => x2 = (0 - x3)/(-1) = 1
#  0          0       -x3 = -1 => x3=(-1)/(-1) = 1
# backwards substitution
#             A  * x       = b

A = [ 2 4 2; 0 -1 1; 0 0 -1 ]; # upper triangular
b = [ 8 0 -1 ]';
back_sub(A, b)

# x(n) = b(n) / A(n,n);
# x(i) = (b(i) - sum_j=i+1_n(A(i, j) * x(j))) / A(i, i), i = n-1 -> 1 backward



# x(i) = (b(i) - sum_j=1_i-1(A(i, j) * x(j))) / A(i, i), i = 2 -> n forward
A = A'; # lower triangular
forward_sub(A, b)



##############################
fprintf('2)\n');
# Gauss elimination
# pivot = element on column w/ largest abs value
##A = [ -3 -1 5; -2 2 1; 1 -1 1 ] 
##b = [ -5 2 1 ]'


# R2 <- R2 - 2/3*R1 =>
##A = [ -3 -1 5; 0 8/3 -7/3; 1 -1 1 ] 
##b = [-5 16/3 1 ]'

# R3 <- R3 - (-1)/3*R1 =>
##A = [ -3 -1 5; 0 8/3 -7/3; 0 -4/3 8/3 ] 
##b = [-5 16/3 -8/3 ]'

# now the sub-matrix 2x2 starting from (2,2) (1-indexed)

# R3 <- R3 - (-1/2)*R2 =>
##A = [ -3 -1 5; 0 8/3 -7/3; 0 0 3/2 ] 
##b = [ -5 16/3 0 ]'


n = 8;
A = 5 * eye(n) - diag(ones(n - 1, 1), 1)...
                        - diag(ones(n - 1, 1), -1)...
                        - diag(ones(n - 3, 1), 3)...
                        - diag(ones(n - 3, 1), -3);
b = [ 3 2 2 ones(1, n - 6) 2 2 3 ]';
Gaussian_elim(A, b)


##############################
fprintf('3)');
# A * x = b
# P * A = L * U
  # P - permutation matrix
  # L - lower triangular
  # U - upper triangular

# [ L, U, P ] = lu(A);  y = forward_sub(L, P * b)
# A * x = b   |*P => P * A * x = P * b
#                                             L * (U * x) = P * b
#                                                       y
#  U * x = y => x = back_sub(U, y)

function x = lup_factorization(A, b)
  [ L, U, P ] = lu(A);
  y = forward_sub(L, P * b);
  x = back_sub(U, y);
endfunction

lup_factorization(A, b)



