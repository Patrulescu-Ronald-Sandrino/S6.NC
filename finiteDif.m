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
## @deftypefn {} {@var{d} =} finiteDif (@var{m}, @var{f})
##
## @seealso{}
## @end deftypefn

## Author: Kamui Yato <kamui@AcerNitro5-Mint21-kamui>
## Created: 2023-03-08

function d = finiteDif (m, f)
  d = zeros(m + 1);
  d(:, 1) = f'; # f is a row vector, so f' is a column vector
  for j = 2:m+1
    for i = 1:m+2-j
      d(i, j) = d(i + 1, j - 1) - d(i, j - 1);
    endfor
  endfor
endfunction
