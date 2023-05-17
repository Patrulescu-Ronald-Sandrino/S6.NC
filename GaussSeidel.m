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
## @deftypefn {} {@var{[x, nit]} =} Gauss-Seidel (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-05-17

# Gauss-Seidel p11
function [x, nit] = GaussSeidel (A, b, x0, eps, maxn)
  M = tril(A);
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
