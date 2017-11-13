# -- Mapping Function: jacobian(v)
#     Transforms a vector into its jacobian matrix
# 	  representation.

function m = jacobian(v)
	m = zeros(v, v);
	for i = 1:length(v)
		m(i, i) = v(i);
	end
end
