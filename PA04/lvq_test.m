## Copyright (C)  
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

## Author:  

%% functionname: function description
function acc = lvq_test(data, W)
	P = data(:,1:2);
	T = data(:,3);
	acc = 0;

	for datum = 1:rows(data)
		p = P(datum);
		t = T(datum);
		c = clusterize(p, W) - 1 %since we're using 0 and 1
		if c == t
			acc += 1;
		end
	end

	acc = acc / rows(P);
end