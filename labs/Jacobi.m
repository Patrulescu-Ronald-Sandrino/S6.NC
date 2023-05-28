## Copyright (C) 2023 Kamui Yato
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{[x, nit]} =} Jacobi (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-05-17

# Jacobi
# A x = b
# A = 
## ( a11 ... a1n )
## ( ...    ...  ...   )
## ( an1 ... ann )
#
# A = D - L - U

# D = diag(a11, ..., ann)
# L = lower of A
# U = upper of A

# Lecture10 p10
# M = D = diag(diag(A)) # bc diag(A) is a column-vector

# N = L + U = M - A, T = M^(-1) * N, c = M^(-1) * b

# x__(k+1) = T * x__(k) + c


# || x__(k) - x__(k-1) ||_inf < (1-||T||_inf)/(||T||_inf) * eps

# || A ||_inf = max_1<=i<=n(Sigma_j=1_n | a_ij |) = norm(A, inf)

# sqrt(a_1^2 + a_2^2 + ... + a_n^2)

# nit = number of iterations
function [x, nit] = Jacobi(A, b, x0, eps, maxn)
  M = diag(diag(A));
  N = M - A;
  T = inv(M) * N; c = inv(M) * b;
  a = norm(T, inf);
  
  for k = 1 : maxn
    x =  T * x0 + c;
    if norm(x - x0, inf) < (1 / a - 1) * eps
      nit = k;
      return
    endif
    x0 = x;
  endfor
endfunction

