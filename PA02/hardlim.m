# -- Mapping Function: hardlim(n)
#     Implements the hard limit activation function.

function a = hardlim(n)
	if n < 0
		a = 0;
	else
		a = 1;
	end
end