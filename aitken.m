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
## @deftypefn {} {@var{A} =} aitken (@var{nodes}, @var{f}, @var{x}, @var{e})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-03-22


# x0 P00
# x1 P10 P11
# ...  P20 P21 P22
# ...
# xn Pn0 ...                 Pnn
#       ^
#        |
#     f(xi)

# P(i, j + 1) = 1/(x(i) - x(j)) * ((x - x(j)) * P(i, j) - (x - x(i)) * P(j, j))

# (Pkk) k belongs N --> P
# Pnn - P(n+k, n+k) < epsilon

function A = aitken (nodes, f, x, e)
  m = length(nodes);
  P = zeros(m);
  P(:,1) = f';
  for i = 2:m
    for j = 1:i - 1
      P(i, j + 1) = 1/(nodes(i) - nodes(j)) * det([x - nodes(j), P(j, i);...
      x - nodes(i), P(i, j)]);
    endfor
    if abs(P(i, i) - P(i - 1, i - 1)) < e
      A = P(i, i);
      #P
      return
    endif
  endfor
  A = 'Not enough nodes';
endfunction
