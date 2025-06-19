# 🧠 TinyML Classifier in Julia

This project is a minimal machine learning classifier built in **Julia** using [`Flux.jl`](https://fluxml.ai/), [`DataFrames.jl`](https://github.com/JuliaData/DataFrames.jl), and [`CSV.jl`](https://github.com/JuliaData/CSV.jl). It demonstrates how to load a dataset from a CSV, train a small neural network, and make predictions — all running on Arch Linux.

---

## 🚀 Features

- ✅ Lightweight binary classification model
- ✅ Neural network: 2 → 4 → 1 structure with ReLU and sigmoid
- ✅ CSV input with auto type handling
- ✅ Flux's updated training API
- ✅ Clear output & sample prediction
- ✅ Built and debugged entirely on **Arch Linux**

---

## 📁 Project Structure

```
Julia_scripts/
├── data.csv            # Your dataset: 2 input columns, 1 output label
├── tinyml.jl           # Final working script
├── Flux.jl             # Initial script version (can delete/ignore)
├── read_julia.jl       # Sample file reader in Julia
├── sample.txt          # Example text file
└── README.md           # This file
```

---

## 📦 Dependencies

Install Julia packages (from REPL):

```julia
import Pkg
Pkg.add("Flux")
Pkg.add("CSV")
Pkg.add("DataFrames")
```

---

## 🧠 Model Architecture

```julia
model = Chain(
    Dense(2, 4, relu),
    Dense(4, 1),
    sigmoid
)
```

Loss function: `binarycrossentropy`  
Optimizer: `Descent(0.1)`

---

## 🏃 Usage

1. Prepare your `data.csv` file with 3 columns: two features and one label (0 or 1).
2. Run the script while suppressing deprecation warnings:

```bash
$ julia -e 'using Logging; Logging.disable_logging(Logging.Warn); include("tinyml.jl")'
```

---

## 🔍 Example Output

```
Training...
Epoch 100 — Loss: 0.5868
Epoch 200 — Loss: 0.5386
Epoch 300 — Loss: 0.5102
Epoch 400 — Loss: 0.4947
Epoch 500 — Loss: 0.4855
Epoch 600 — Loss: 0.4796
Epoch 700 — Loss: 0.4758
Epoch 800 — Loss: 0.4731
Epoch 900 — Loss: 0.4712
Epoch 1000 — Loss: 0.4697
Prediction score (0 = not spam, 1 = spam): 0.5026
```

---

## ⚠️ Warnings

You may see deprecation warnings from Flux or Zygote about gradients or `params()` usage. The model still works. These will be debugged in a future version.

To suppress them, we use:

```bash
$ julia -e 'using Logging; Logging.disable_logging(Logging.Warn); include("tinyml.jl")'
```

---

## 🔮 Future Plans

- 📈 Add live loss plot with `Plots.jl`
- 📦 Export model weights
- 🌐 Serve as a REST API
- 📱 Port to microcontroller (TinyML)

---

## 🛠️ Built With

- [Julia 1.11.5](https://julialang.org/)
- [Flux.jl](https://fluxml.ai/)
- [Zygote.jl](https://github.com/FluxML/Zygote.jl)
- Arch Linux 💻

---

## ✨ Acknowledgments

This project was co-developed with **ChatGPT**, handling bugs, warnings, and model design with a mix of 🧠 logic and 🚀 patience.

---

## 📜 License

MIT – use, share, and build on it!
