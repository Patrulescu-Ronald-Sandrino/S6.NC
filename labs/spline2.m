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
## @deftypefn {} {@var{S} =} spline2 (@var{x}, @var{f}, @var{x0})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-04-05

function S = spline2 (x, f, x0)
  I = x0 == x;
  if sum(I) == 1
    S = f(I);
  else
    n = length(x);
    # if you didn't know that there are n elements, 
    # you could write 'end', and 'start' instead of 2
    h = x(2 : end) - x(1 : end - 1);
    b = zeros(1, n);
    
    for i = 2 : n - 1
      # (2.13) 3 * (h(i) * f[x(i-1), x(i)] + h(i -1) * f[x(i), x(i+1)])
      b(i) = 3 * (h(i) * (f(i) - f(i - 1)) / h(i - 1) + h(i - 1) * (f(i + 1) - f(i)) / h(i)); 
    endfor
    
    b(1) = 3 * (f(2) - f(1)) / h(1); b(n) = 3 * (f(n) - f(n - 1)) / h(n - 1);
    
    # A * m = b
    A = zeros(n);
    
    # (2.13)
    for i = 2 : n - 1 
      A(i, i - 1) = h(i); A(i, i) = 2 * (h(i - 1) + h(i));
      A(i, i + 1) = h(i - 1);
    endfor
    
    # (2.16)
    A(1, 1) = 2; A(1, 2) = 1;
    A(n, n - 1) = 1; A(n, n) = 2;
    m = linsolve(A, b');
    
    i = sum(x0 > x);
    
    c = zeros(1, 4);
    c(1) = f(i); c(2) = m(i);
    
    c(3) = (3 * (f(i + 1) - f(i)) / h(i) - 2 * m(i) - m(i + 1)) / h(i);
    c(4) = (m(i + 1) - 2 * (f(i + 1) - f(i)) / h(i) + m(i)) / (h(i) ^ 2);
    S = c(1);
    for k = 2 : 4
      S = S + c(k) * (x0 - x(i))^(k - 1);
    endfor
  endif
endfunction
