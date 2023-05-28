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
## @deftypefn {} {@var{[H, Hd]} =} hermite (@var{nodes}, @var{f}, @var{fd}, @var{x})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-03-29

#           (x-x1)(x-x2)(x-x3)
# i = 2      1
# i = 3      1
# i = 4      




# estimating the derivative:
# f(x) = f(x1) + (x - x1)*f'(x1)
# Sigma (x-x1)...(x-xm)*f[...], where f[...] belongs to R

# (x-x1)       (x-x1)^2       (x-x1)^2*(x-x2)
#   1        1*(x-x1)+(x-x2)    ((x-x1)+(x-x2))*(x-x2)+(x-x1)^2


# when i = 2:
#    p
# (x-x1) * f'(x1)
#    1     * f'(x1)
#   pd


function [H, Hd] = hermite (nodes, f, fd, x)
  I = x == nodes;
  if sum(I) == 1
    H = f(I); Hd = fd(I);
  else
    m = length(nodes);
    d = divdifHermite(nodes, f, fd);
    s = f(1); p = 1; sd = 0; pd = 0;
    
    for i = 2 : 2 * m
      pd = pd * (x - nodes(floor(i / 2))) + p;
      p = p * (x - nodes(floor(i / 2)));
      s = s + p * d(1, i);
      sd = sd + pd * d(1, i);
    endfor
    
    H = s; Hd = sd;
  endif
endfunction
