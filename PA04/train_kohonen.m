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

function W = train_kohonen(data, centroids, runs)
	nb_outputs = rows(centroids);
	W = rand(nb_outputs, 2);
	%W = centroids;
	%using radius 1
	lrate = 0.8;
	
	for i = 1:runs
		for datum = 1:rows(data)
			p = data(datum,:);
			distances = sum((W - p) .^ 2, 2);
			index = find(distances == min(distances));
			W(index,:) = W(index,:) + lrate * (p - W(index,:));
			lrate -= 0.01;
			if lrate <= 0
				break;
			end
		end
	end
end