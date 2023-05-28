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
## @deftypefn {} {@var{x} =} Gaussian_elim (@var{A}, @var{b})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-05-10

function x = Gaussian_elim (A, b)
  [r, n] = size(A);
  x = zeros(size(b));
  A = [A, b]; # augmented matrix
  piv = 1 : n;
  
  for i = 1 : n - 1
    [m, p] = max(abs(A(i : n, i))); p = p + i - 1;
    
    if m == 0
      fprintf('We don''t have a unique solution');
    endif
    if p ~= i
      piv([i, p]) = piv([p, i]);
    endif
    
    for j = i + 1 : n
      coeff = A(piv(j), i) / A(piv(i), i);
      A(piv(j), i : n + 1) = A(piv(j), i : n + 1) - coeff * A(piv(i), i : n + 1);
    endfor
    
  endfor
  
  x = back_sub(A(piv, 1 : n), A(piv, n + 1));
endfunction
