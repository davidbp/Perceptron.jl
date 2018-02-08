# Perceptron

Package for training Perceptron models.

### Installation
```julia
Pkg.clone("https://github.com/davidbp/Perceptron.jl")
```

### Basic usage
```julia
using MLDatasets

train_x, train_y = MLDatasets.MNIST.traindata()
test_x, test_y = MLDatasets.MNIST.testdata();
train_y = train_y + 1
test_y = test_y + 1
train_x = reshape(train_x,784, 60000);
test_x  = reshape(test_x, 784, 10000);
```

We can create a `PerceptronClassifer` type defining the type of the weights, the number of classes,
and the number of features.

The function `Perceptron.fit!` is used to train the model.

```julia
scores = []
n_features = size(train_x, 1)
n_classes =  length(unique(train_y))
perceptron = PerceptronClassifier(Float32, n_classes, n_features)
Perceptron.fit!(perceptron, train_x, train_y, scores;  print_flag=true)
```

#### Details of the `fit!` function

>    fit!(h::PerceptronClassifer,
>         X::Array,
>         y::Array;
>         n_epochs=50,
>         learning_rate=0.1,
>         print_flag=false,
>         compute_accuracy=true,
>         seed=srand(1234),
>         pocket=false,
>         shuffle_data=false)

##### Arguments

- **`h`**, (PerceptronClassifer{T} type), Multiclass perceptron.
- **`X`**, (Array{T,2} type), data contained in the columns of X.
- **`y`**, (Vector{T} type), class labels (as integers from 1 to n_classes).

##### Keyword arguments

- **`n_epochs`**, (Integer type), number of passes (epochs) through the data.
- **`learning_rate`**, (Float type), learning rate (The standard perceptron is with learning_rate=1.)
- **`compute_accuracy`**, (Bool type), if `true` the accuracy is computed at the end of every epoch.
- **`print_flag`**, (Bool type), if `true` the accuracy is printed at the end of every epoch.
- **`seed`**, (MersenneTwister type), seed for the permutation of the datapoints in case there the data is shuffled.
- **`pocket`** , (Bool type), if `true` the best weights are saved (in the pocket) during learning.
- **`shuffle_data`**, (Bool type),  if `true` the data is shuffled at every epoch (in reality we only shuffle indicies for performance).




[![Build Status](https://travis-ci.org/davidbp/Perceptron.jl.svg?branch=master)](https://travis-ci.org/davidbp/Perceptron.jl)

[![Coverage Status](https://coveralls.io/repos/davidbp/Perceptron.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/davidbp/Perceptron.jl?branch=master)

[![codecov.io](http://codecov.io/github/davidbp/Perceptron.jl/coverage.svg?branch=master)](http://codecov.io/github/davidbp/Perceptron.jl?branch=master)
