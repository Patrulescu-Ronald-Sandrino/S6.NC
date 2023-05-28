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
## @deftypefn {} {@var{N} =} newton (@var{nodes}, @var{f}, @var{x})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-03-22

function N = newton (nodes, f, x)
  m = length(nodes);
  d = dividedDif(nodes, f);
  # we need the 1st line of the dividedDif
  s = f(1); p = 1;
  for i = 1:m-1
    p = p * (x - nodes(i));
    s = s + p * d(1, i + 1);
  endfor
  N = s;
endfunction
