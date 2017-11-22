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
## @deftypefn {Function File} {c = } kohonen(@var{data}, @var{W})
##
## Tests a Kohonen network using @var{data} with weights @var{W}.
##
## @var{data}
## @indentedblock
## Matrix of data.
## @end indentedblock
##
## @var{W}
## @indentedblock
## Weight matrix.
## @end indentedblock
##
## @seealso{train_kohonen}
## @end deftypefn

%centroids = [data(10,1) data(10,2); data(52,1) data(52,2); data(21,1),data(21,2)];

function c = kohonen(data, W)
	plot(data(:,1), data(:,2),'.k', 'markersize', 10)
	hold on;

	for datum = 1:rows(data)
		p = data(datum,:);
		c = clusterize(p, W);
		switch c
			case 1
				form = 'bo';
			case 2
				form = 'g^';
			case 3
				form = 'rd';
			case 4
				form = 'c*';
			otherwise
				form = 'yv';
		end
		plot(p(1), p(2),form, 'markersize', 10)
		hold on;
	end
	hold off;
end