# -- Mapping Function: logsig(n)
#     Implements the log-sigmoid activation function.

function a = logsig(n)
	a = 1 / (1 + exp(-n));
end