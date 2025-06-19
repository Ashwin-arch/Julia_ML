import Pkg
Pkg.add("Flux")
Pkg.add("MLUtils")  # for data shuffling etc.
using Flux, CSV, DataFrames, Statistics

# Load dataset from CSV
df = CSV.read("data.csv", DataFrame)

# Extract features and labels
X = permutedims(Matrix(df[:, 1:2])) |> Float32
Y = permutedims(Matrix(df[:, 3])) |> Float32

# Define the model: input 2 → hidden 4 → output 1
model = Chain(
    Dense(2, 4, relu),
    Dense(4, 1),
    sigmoid
)

# Binary cross entropy loss
loss(x, y) = Flux.Losses.binarycrossentropy(model(x), y)

# Optimizer
opt = Descent(0.1)

# Training loop
println("Training...")
for epoch in 1:1000
    grads = gradient(() -> loss(X, Y), params(model))
    Flux.Optimise.update!(opt, params(model), grads)
    if epoch % 100 == 0
        println("Epoch $epoch — Loss: ", loss(X, Y))
    end
end

# Test a sample
sample = Float32.([1.0, 0.0])
println("Prediction score (0 = not spam, 1 = spam): ", model(sample))

