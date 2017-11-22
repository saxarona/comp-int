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
## @deftypefn {Function File} {acc = } lvq(var@{data}, @var{W}, @var{runs})
## Tests LVQ network with @var{data} and weights @var{W}
##
## @var{data}
## @indentedblock
## Matrix of data.
## @end indentedblock
##
## @var{W}
## @indentedblock
## Matrix of weights.
## @end indentedblock
##
## @var{runs}
## @indentedblock
## Number of iterations for the testing process.
## For automation processes.
## @end indentedblock
##
## @seealso{train_lvq}
## @end deftypefn

function acc = lvq(data, W, runs)
	%P = data(:,1:2);
	P = data(:,1:4);
	%T = data(:,3);
	T = data(:,5);
	acc = 0;
	classes = [0 0 1];

	for datum = 1:rows(data)
			p = P(datum,:);
			t = T(datum);
			c = clusterize(p, W);
			if classes(c) == t
				acc += 1;
			end
	end

	acc = acc / rows(P);
end