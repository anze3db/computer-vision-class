## Copyright (C) 2000 Paul Kienzle
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## usage: B = imnoise (A, type)
##
## Adds noise to image in A.
##
## imnoise (A, 'gaussian' [, mean [, var]])
##    additive gaussian noise: A = A + noise
##    defaults to mean=0, var=0.01
##
## imnoise (A, 'salt & pepper' [, density])
##    lost pixels: A = 0 or 1 for density*100% of the pixels
##    defaults to density=0.05, or 5%
##
## imnoise (A, 'speckle' [, var])
##    multiplicative gaussian noise: A = A + A*noise
##    defaults to var=0.04

function A = imnoise(A, stype, a, b)

  if (nargin < 3 || nargin > 4 || !is_matrix(A) || !isstr(stype))
    usage("B = imnoise(A, type, parameters, ...)");
  endif

  stype = tolower(stype);
  if (strcmp(stype, 'gaussian'))
    if (nargin < 3), a = 0.0; endif
    if (nargin < 4), b = 0.01; endif
    A = A + (a + randn(size(A)) * b);
  elseif (strcmp(stype, 'salt & pepper'))
    if (nargin < 3), a = 0.05; endif
    noise = rand(size(A));
    A(noise <= a/2) = 0;
    A(noise >= 1-a/2) = 1;
  elseif (strcmp(stype, 'speckle'))
    if (nargin < 3), a = 0.04; endif
    A = A * (1 + randn(size(A))*a);
  else
    error("imnoise: use type 'gaussian', 'salt & pepper', or 'speckle'");
  endif

endfunction