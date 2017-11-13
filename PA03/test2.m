# -- Mapping Function: test2(W1, b1, W2, b2, P, T, mode)
#     Calculates the accuracy of a perceptron by using a 
#     set of examples represented by P (the inputs) and T
#     (their expected outputs). 

function eval = test2(W1, b1, W2, b2, P, T, mode)
	eval = 0;
	output = zeros(length(T), columns(T));
	for i = 1:rows(P)
		p = P(i, :)';
		t = T(i, :)';

		# Sets the mode (classification or regression)
		if strcmp(mode, "classification")
			a = round(perceptron2(W1, b1, W2, b2, p, @logsig, @purelin));
		else
			a = perceptron2(W1, b1, W2, b2, p, @logsig, @purelin);
		end
		output(i, :) = a;
		if t == a;
			eval = eval + 1;
		end
	end
	display([P, output]);
	plot(output);
	eval = eval / rows(P);
end
