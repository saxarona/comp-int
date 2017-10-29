## Copyright (C) 2017 Xavier Sánchez-Díaz <xavier.sanchezdz@gmail.com>
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
## @deftypefn {Function File} {[@var{W1, b1, W2, b2]} =} multiperceptron (@var{data}, @var{dataA}, @var{dataB}, @var{trainits}, @var{runs})
##
## Trains and tests a multi perceptron.
##
## @var{data}
## @indentedblock
## Matrix of data for final results to check against.
## @end indentedblock
##
## @var{dataA}
## @indentedblock
## Matrix of data for perceptron A.
## @end indentedblock
##
## @var{dataB}
## @indentedblock
## Matrix of data for perceptron B.
## @end indentedblock
##
## @var{trainits}
## @indentedblock
## Number of iterations for training.
## @end indentedblock
##
## @var{runs}
## @indentedblock
## Number of runs of the algorithm. Try with 5, or the like.
## @end indentedblock
## @end deftypefn

function [W1, b1, W2, b2] = multiperceptron(data, dataA, dataB, trainits, runs)

	P = data(:,1:2);
	T = data(:,3);

	PA = dataA(:,1:2);
	TA = dataA(:,3);

	PB = dataB(:,1:2);
	TB = dataB(:,3);

	#the good ol' AND gate
	#hardcoded because it's easy
	W2 =[1 1];
	b2 = -1.5;

	for i = 1:runs
		p = P(i,:)';

		#train perceptron1a
		[W1A, b1A] = train(PA, TA, trainits)

		#train perceptron1b
		[W1B, b1B] = train(PB, TB, trainits)

		#Join weights and biases
		W1 = cat(1, W1A, W1B)
		b1 = cat(1, b1A, b1B)

		#the AND gate itself
		a = perceptron(W2, b2, p, @hardlim)

		#the accuracy
		acc = test2(W1, b1, W2, b2, P, T, @hardlim, @hardlim)
	end
end