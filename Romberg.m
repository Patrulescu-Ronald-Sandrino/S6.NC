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
## @deftypefn {} {@var{[I, nf]} =} Romberg (@var{f}, @var{a}, @var{b}, @var{eps}, @var{nmax})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-05-03

# nf = number of interactions of f
function [I, nf] = Romberg (f, a, b, eps, nmax)
  R = zeros(nmax);
  h = b - a;

  R(1, 1) = h / 2 * (f(a) + f(b));

  nf = 2;
  for k = 2 : nmax
    x = a + ((1 : 2^(k - 2)) - 1/2) * h;
    R(k, 1) = 1/2 * (R(k - 1, 1) + h * sum(f(x)));
    nf = nf + length(x);
    p = 4;
    for j = 2 : k
      R(k, j) = (p * R(k, j - 1) - R(k - 1, j - 1)) / (p - 1);
      p = p * 4;
    endfor
    
    if abs(R(k, k) - R(k - 1, k - 1)) < eps
      I = R(k, k);
      R(1 : k, 1 : k)
      return
    endif
    
    h = h / 2;
  endfor
  
  fprintf('Not enough iterations or something:\n'); R
endfunction
