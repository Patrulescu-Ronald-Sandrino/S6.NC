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
## @deftypefn {} {@var{retval} =} Lagrange (@var{nodes}, @var{f}, @var{x})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-03-15

function L = Lagrange (nodes, f, x)
  n = length(nodes);
  wx = ones(1, n);
  
  if sum(x == nodes) == 1
    L = (x == nodes) * f'
  else
    for i = 1:n
      if x != nodes(i)
        wx(i) = (1 / prod(nodes(i)-nodes([1:i-1,i+1:n]))) / (x - nodes(i));
      endif
    endfor
    L = (wx * f') / sum(wx);
  endif
endfunction
