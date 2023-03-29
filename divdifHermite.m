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
## @deftypefn {} {@var{T} =} divdiffHermite (@var{nodes}, @var{f}, @var{fd})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-03-29

function T = divdifHermite (nodes, f, fd)
  m = length(nodes);
  T = zeros(2 * m);
  nodes2 = repelem(nodes, 2);
  f2 = repelem(f, 2);
  T(:, 1) = f2';
  T(1 : 2 : 2 * m - 1, 2) = fd(1:m);
  
  for i = 1 : m - 1
    T(2 * i, 2) = (T(2 * i + 1,  1) - T(2 * i, 1)) / (nodes2(2 * i + 1) - nodes2(2 * i));
  endfor
  
  for j = 3 : 2 * m
    for i = 1 : 2 * m + 1 - j
      T(i, j) = (T(i + 1, j - 1) - T(i, j - 1)) / (nodes2(i + j - 1) - nodes2(i));
    endfor
  endfor
endfunction
