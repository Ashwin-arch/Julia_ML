using Flux
using CSV
using DataFrames
using Statistics

# Load dataset
df = CSV.read("data.csv", DataFrame)
X = Float32.(permutedims(Matrix(df[:, 1:2])))
Y = Float32.(reshape(df[:, 3], 1, :))

# Define model
model = Chain(
    Dense(2, 4, relu),
    Dense(4, 1),
    sigmoid
)

# Define loss
loss(m, x, y) = Flux.Losses.binarycrossentropy(m(x), y)

# Set up optimizer
opt = Descent(0.1)
state = Flux.setup(opt, model)

# Training loop
println("Training...")
for epoch in 1:1000
    grads = gradient(m -> loss(m, X, Y), model)
    Flux.update!(state, model, grads)
    if epoch % 100 == 0
        println("Epoch $epoch — Loss: ", round(loss(model, X, Y), digits=4))
    end
end

# Predict on new input
sample = Float32.([1.0, 0.0])
println("Prediction score (0 = not spam, 1 = spam): ", round(model(sample)[1], digits=4))

