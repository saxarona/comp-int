%% functionname: function description
function [W, acc] = lvq_loop(data, runs)
	for i = 1:runs
		W = train_lvq(data, 3, 5);
		acc = lvq(data, W, runs);

		if acc == 1
			break;
		end
	end
end