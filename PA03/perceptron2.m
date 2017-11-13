# -- Mapping Function: perceptron2(W1, b1, W2, b2, p, f1, f2)
#     Calculates the output(s) of a perceptron given an input p. The
#     perceptron is fully specified by a weight matrices W1, W2, the bias 
#     vector b1 and b2 and the activation functions of the layers in the
# 	  network.

function a = perceptron2(W1, b1, W2, b2, p, f1, f2)
	# Hidden layer
	n = W1 * p + b1;
	a = arrayfun(f1, n);
	# Output layer	
	n = W2 * a + b2;
	a = arrayfun(f2, n);
end