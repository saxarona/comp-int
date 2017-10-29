# -- Mapping Function: test(W, b, P, T)
#     Calculates the accuracy of a perceptron by using a 
#     set of examples represented by P (the inputs) and T
#     (their expected outputs). 

function accuracy = test(W1, b1, P, T)
	accuracy = 0;	
	for i = 1:rows(P)
		p = P(i, :)';
		t = T(i, :)';		
		a = perceptron(W1, b1, p, @hardlim);			
		if t == a;
			accuracy = accuracy + 1;
		end
	end
	accuracy = accuracy / rows(P);
end
