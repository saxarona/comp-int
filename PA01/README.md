# README

Please notice that using `DataFrames` is a mess.
Here's an example of a run.
Notice how we need to convert each `DataFrame.column` to `Array`:

````julia
using DataFrames
data = readtable("dataset.csv")
P = convert(Array,data[:,1:2])
T = convert(Array,data[:,3])
W, b = train(P,T,500)
test(W,b,P,T)
````

But perhaps doing it until it is found is better:

````julia
for i in 1:700
	W,b = train(P,T,500)
    acc = test(W,b,P,T)
    println(acc)
    if acc  == 1
    	println("yeah baby!")
    	println("W is", W)
       	println("b is", b)
       	break
    end
end
````