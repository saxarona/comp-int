## Copyright (C) Xavier Sánchez Díaz <mail@@gmail.com>
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
## @deftypefn {Function File} {W = } train_kohonen(@var{data}, @var{centroids}, @var{runs})
## Trains a Kohonen network.
##
## @var{data}
## @indentedblock
## Matrix of data.
## @end indentedblock
##
## @var{centroids}
## @indentedblock
## Number of centroids.
## Determine the number of outputs.
## @end indentedblock
##
## @var{runs}
## @indentedblock
## Number of iterations for the training process.
## Use a small amount, since using a lot can compromise clustering.
## @end indentedblock
##
## @seealso{kohonen}
## @end deftypefn

function W = train_kohonen(data, centroids, runs)
	W = rand(centroids, 2);
	%using radius 1
	lrate = 0.8;
	
	for i = 1:runs
		for datum = 1:rows(data)
			p = data(datum,:);
			index = clusterize(p,W);
			W(index,:) = W(index,:) + lrate * (p - W(index,:));
			lrate -= 0.005;
			if lrate <= 0
				break;
			end
		end
	end
end