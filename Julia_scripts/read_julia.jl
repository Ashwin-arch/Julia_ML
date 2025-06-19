# read_file.jl

function read_and_print(file_path::String)
    if isfile(file_path)
        content = read(file_path, String)
        println("Contents of the file:")
        println(content)
    else
        println("File not found: $file_path")
    end
end

# Example usage (you can pass the file path as an argument)
if abspath(PROGRAM_FILE) == @__FILE__
    if length(ARGS) == 0
        println("Usage: julia read_file.jl <path_to_file>")
    else
        read_and_print(ARGS[1])
    end
end

