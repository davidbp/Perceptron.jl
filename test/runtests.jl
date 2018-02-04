using Perceptron
using Base.Test

# write your own tests here
@test Perceptron.accuracy([1,2,2], [1,2,2])==1

@test Perceptron.accuracy([1,2,2,3], [1,2,2,2])==0.75
