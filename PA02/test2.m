# -- Mapping Function: test2(W, b, P, T, f1, f2)
#     Calculates the accuracy of a perceptron by using a 
#     set of examples represented by P (the inputs) and T
#     (their expected outputs). 

function accuracy = test2(W1, b1, W2, b2, P, T, f1, f2)
	accuracy = 0;	
	for i = 1:rows(P)
		p = P(i, :)';
		t = T(i, :)';		
		a = perceptron2(W1, b1, W2, b2, p, f1, f2);			
		if t == a;
			accuracy = accuracy + 1;
		end
	end
	accuracy = accuracy / rows(P);
end
