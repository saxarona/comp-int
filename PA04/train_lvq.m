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
## @deftypefn {Function File} {W = } train_lvq(@var{data}, @var{nb_outs}, @var{runs})
## Trains an LVQ network.
##
## @var{data}
## @indentedblock
## Matrix of data.
## @end indentedblock
##
## @var{nb_outs}
## @indentedblock
## Number of output neurons.
## @end indentedblock
##
## @var{runs}
## @indentedblock
## Number of iterations for the training process.
## Use a small amount, since using a lot can compromise clustering.
## @end indentedblock
##
## @seealso{lvq}
## @end deftypefn

function W = train_lvq(data, nb_outs, runs)
	%W = rand(nb_outs, 2);
	W = rand(nb_outs, 4);
	%using radius 1
	lrate = 0.8;
	%P = data(:,1:2);
	P = data(:,1:4);
	%T = data(:,3);
	T = data(:,5);
	% assign classes
	classes = [0 0 1];
	%W = [-1 0; 0 1; 1 0; 0 -1; -0.5 -0.5; 0.5 0.5];

	for i = 1:runs
		for datum = 1:rows(data)
			p = P(datum,:);
			t = T(datum);
			index = clusterize(p,W);
			if classes(index) == t
				W(index,:) = W(index,:) + lrate * (p - W(index,:));
			end
			lrate -= 0.05;
			if lrate <= 0
				break;
			end
		end
	end
end