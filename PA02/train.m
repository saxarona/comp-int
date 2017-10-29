# -- Mapping Function: train(P, T, maxIterations)
#     Trains a perceptron by using a set of examples represented 
#     by P (the inputs) and T (their expected outputs). 

function [W, b] = train(P, T, maxIterations)
	W = rand(columns(T), columns(P));
	b = rand(rows(W), 1);
	i = 1;	
	for x = 1:maxIterations
		p = P(i, :)';
		t = T(i, :)';
		a = perceptron(W, b, p, @hardlim);
		e = t - a;
		W = W + e * p';
		b = b + e;
		i = i + 1;
		if i > rows(P)
			i = 1;
		end
	end
end
