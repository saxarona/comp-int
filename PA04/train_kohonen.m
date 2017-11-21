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

function W = train_kohonen(data, centroids, nb_outputs, runs)
	%nb_outputs is a number
	%W = rand(nb_outputs, 2);
	W = centroids;
	%using radius 1
	lrate = 0.8;
	
	for i = 1:runs
		for datum = 1:rows(data)
			p = data(datum,:);
			distances = sum((W - p) .^ 2, 2);
			index = find(distances == min(distances));
			W(index,:) = W(index,:) + lrate * (W(index,:) - p);
		end
	end
end