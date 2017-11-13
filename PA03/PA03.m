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
## @deftypefn {Function File} {[W1,b1,W2,b2] =} PA03(@var{data}, @var{data_iris}, @var{funtype}, @var{lrate}, @var{trainits}, @var{runs})
## Performs necessary actions for PA03.
##
## @var{data}
## @indentedblock
## Matrix of data for to check against.
## Use in conjunction with @var{problem}!
## @end indentedblock
##
## @var{problem}
## @indentedblock
## Number of the HW problem.
## Use integers.
## @end indentedblock
##
## @var{funtype}
## @indentedblock
## Character defining type of perceptron.
## Lowercase 'c' for classification, anything else for regression.
## @end indentedblock
##
## @var{lrate}
## @indentedblock
## Float defining the learning rate of the perceptron.
## Use around 0.1
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

function [W1, b1, W2, b2] = PA03(data, problem, funtype, layers, lrate, trainits, runs)

	if problem == 1
		% Using Problem 1 data
		P = data(:,1:2);
		T = data(:,3);
	elseif problem == 2
		% Using Problem 2 data
		P = data(:,1:4);
		T = data(:,5);
	elseif problem == 3
		% Using Problem 3 data
		P = data(:,1);
		T = data(:,2);
	end

	if funtype == 'c'
		mymode = 'classification';
	else
		mymode = 'regression';
	end

	for i = 1:runs
		% training perceptron
		[W1, b1, W2, b2] = train2(P, T, layers, lrate, trainits, mymode);

		% the accuracy
		acc = test2(W1, b1, W2, b2, P, T, mymode);
		sprintf('Run %d: accuracy: %.3f',i,acc)
		if acc == 1
			sprintf('1.0 accuracy obtained at iteration %d!', i)
			disp('Parameters are the following:')
			W1
			b1
			W2
			b2
			break
		end
	end
end