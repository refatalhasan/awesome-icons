fun main() {
    println("Welcome to the Kotlin Demo!")

    // Variables and types
    val name = "Kotlin"
    val version = 1.9
    val isFun = true

    println("Language: $name, Version: $version, Fun: $isFun")

    // Arrays
    val numbers = arrayOf(1, 2, 3, 4, 5)
    println("Numbers: ${numbers.joinToString()}")

    // Lists
    val fruits = listOf("Apple", "Banana", "Cherry")
    println("Fruits: $fruits")

    // Maps
    val ages = mapOf("Alice" to 30, "Bob" to 25)
    println("Ages: $ages")

    // Functions
    fun greet(person: String) {
        println("Hello, $person!")
    }
    greet("Alice")

    // Looping
    for (i in 1..5) {
        println("Loop $i")
    }

    // Conditionals
    val x = 10
    if (x > 5) {
        println("$x is greater than 5")
    } else {
        println("$x is not greater than 5")
    }
}

