# -- Mapping Function: perceptron(W, b, p, f)
#     Calculates the output(s) of a perceptron given an input p. The
#     perceptron is fully specified by a weight matrix W, a bias 
#     vector b and an activation function. 

function a = perceptron(W, b, p, f)
	n = W * p + b;
	a = arrayfun(f, n);
end