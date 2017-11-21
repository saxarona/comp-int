## Copyright (C) Xavier Sánchez Díaz <xavier.sanchezdz@@gmail.com>
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
## along with this program; If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {Outputs = } Function Name (Input Arguments)
## Short Description
##
## Long Description
##
## @seealso{functions
## @end deftypefn

%centroids = [data(10,1) data(10,2); data(52,1) data(52,2); data(21,1),data(21,2)];

function c = kohonen(p, W)
	distances = sum((W - p) .^ 2, 2);
	c = find(distances == min(distances));
end