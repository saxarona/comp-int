# -- Mapping Function: train2(P, T, nbHiddenNeurons, lRate, maxIterations, mode)
#     Trains a perceptron by using a set of examples represented 
#     by P (the inputs) and T (their expected outputs). 

function [W1, b1, W2, b2] = train2(P, T, nbHiddenNeurons, lRate, maxIterations, mode)

	W1 = rand(nbHiddenNeurons, columns(P));
	b1 = rand(rows(W1), 1);
	W2 = rand(columns(T), nbHiddenNeurons);
	b2 = rand(rows(W2), 1);

	i = 1;
	totalError = 0;	
	for x = 1:maxIterations
		p = P(i, :)';
		t = T(i, :)';						

		# Calculates the outputs of the networks
		n1 = W1 * p + b1;
		a1 = arrayfun(@logsig, n1);
		n2 = W2 * a1 + b2;

		# Sets the mode (classification or regression)
		if strcmp(mode, "classification")
			a2 = arrayfun(@purelin, n2);
			
			# Calculates the error
			e = t - round(a2);

			# Calculates the sensitivities
			s2 = -2 * 1 * e;	
		else			
			a2 = arrayfun(@purelin, n2);

			# Calculates the error
			e = t - a2;

			# Calculates the sensitivities
			s2 = -2 * 1 * e;
		end

		totalError = totalError + abs(e);
		s1 = (jacobian(a1 .* (1 - a1)) * W2') * s2;		

		# Updates the weights
		W2 = W2 - (lRate * s2 * a1');
		b2 = b2 - (lRate * s2);
		W1 = W1 - (lRate * s1 * p');
		b1 = b1 - (lRate * s1);	
		i = i + 1;
		if i > rows(P)
			if totalError == 0				
				return
			end
			i = 1;
			totalError = 0;
		end	
	end
end
