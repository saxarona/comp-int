# README

Reading from a CSV in Julia is a bit different.
For that, I use the `DataFrames` package.
Please notice that using `DataFrames` is a mess (because of the Types).
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

For `dataset02` and `dataset04` (which are non-linear), you may need to detect which is the higher accuracy you'll get:

````julia
newacc = 0
for i in 1:7000
	W, b = train(P,T,5000)
    acc = test(W,b,P,T)
    if acc > newacc
    	newacc = acc; println("New acc is better:", acc)
       	println("W is", W)
       	println("b is", b)
    end
end
````

Also notice how the iterations for testing and training are incredibly high. That's just for debugging purposes, of course.