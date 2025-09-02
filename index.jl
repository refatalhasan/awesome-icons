# Demo code: Basic Julia features and operations

println("Welcome to the Julia Demo!")

# Variables and types
name = "Julia"
version = 1.9
is_fun = true

println("Language: $name, Version: $version, Fun: $is_fun")

# Arrays
numbers = [1, 2, 3, 4, 5]
println("Numbers: ", numbers)

# Dictionaries
ages = Dict("Alice" => 30, "Bob" => 25)
println("Ages: ", ages)

# Functions
function greet(person)
    println("Hello, $person!")
end

greet("Alice")

# Looping
for i in 1:5
    println("Loop $i")
end

# Conditionals
x = 10
if x > 5
    println("$x is greater than 5")
else
    println("$x is not greater than 5")
end

# List comprehensions
squares = [i^2 for i in 1:10]
println("Squares: ", squares)

# Tuples
point = (3, 4)
println("Point: ", point)

# String interpolation
msg = "The answer is $(42)"
println(msg)

# Working with random numbers
using Random
rand_num = rand()
println("Random number: ", rand_num)

# Simple struct
struct Person
    name::String
    age::Int
end

p = Person("Charlie", 28)
println("Person: ", p)

# Error handling
try
    error("This is an error!")
catch e
    println("Caught error: ", e)
end

# Working with files
open("demo.txt", "w") do f
    write(f, "Hello, file!\n")
end

# Reading from file
content = read("demo.txt", String)
println("File content: ", content)

# Map and filter
evens = filter(x -> x % 2 == 0, 1:10)
println("Evens: ", evens)

doubled = map(x -> x * 2, 1:5)
println("Doubled: ", doubled)

# End of demo
println("Demo complete!")