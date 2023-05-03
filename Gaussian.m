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
## @deftypefn {} {@var{[I, gn, gc]} =} Gaussian (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-05-03


# gn = nodes, gc = coeffcients/weights
# nr <- {1, ..., 5}
function [I, gn, gc] = Gaussian (f, n, nr)
  alpha = zeros(1, n);
  
  switch nr
    case 1 # Legendre
      beta = [2, (4 - ([1 : n - 1]) .^ (-2)) .^(-1)];
    case 2 # 
      beta = [pi, 1/2, 1/4 * ones(1, n - 2)];
    case 3 # 
      beta = [pi/2, 1/4 * ones(1, n - 1)];
    case 4 # 
      a = input('a='); k = 1 : n - 1;
      alpha = [a + 1, 2 * k + a + 1];
      beta = [gamma(1 + a), k .* (k + a)];
    case 5 # Hermite
      beta = [sqrt(pi), [1 : n - 1]/2];
  endswitch
  
  J = diag(alpha) + diag(sqrt(beta(2 : n)), 1) + diag(sqrt(beta(2: n)), -1);
  [v, d] = eig(J); # A*v = λ*v. det(A - λ*I) = 0. roots will be the eigenvalues
  
  gc = beta(1) * v(1, :) .^ 2;
  gn = diag(d);
  I = gc * f(gn);
endfunction
