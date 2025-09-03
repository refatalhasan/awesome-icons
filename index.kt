import kotlin.random.Random
import kotlinx.coroutines.*
import java.time.LocalDateTime

data class Person(
    val name: String,
    val age: Int,
    val hobbies: List<String>
)

sealed class Shape {
    abstract fun area(): Double
}

class Circle(private val radius: Double) : Shape() {
    override fun area() = Math.PI * radius * radius
}

class Rectangle(private val width: Double, private val height: Double) : Shape() {
    override fun area() = width * height
}

class Stack<T> {
    private val elements = mutableListOf<T>()
    
    fun push(item: T) = elements.add(item)
    fun pop(): T? = if (elements.isNotEmpty()) elements.removeAt(elements.lastIndex) else null
    fun peek(): T? = elements.lastOrNull()
    fun isEmpty() = elements.isEmpty()
}

object Calculator {
    fun add(a: Int, b: Int) = a + b
    fun subtract(a: Int, b: Int) = a - b
    fun multiply(a: Int, b: Int) = a * b
    fun divide(a: Int, b: Int) = if (b != 0) a.toDouble() / b else Double.POSITIVE_INFINITY
}

class Database {
    private val storage = mutableMapOf<String, Any>()
    
    fun save(key: String, value: Any) {
        storage[key] = value
    }
    
    fun get(key: String): Any? = storage[key]
    
    fun remove(key: String) = storage.remove(key)
    
    fun getAllKeys() = storage.keys.toList()
}

suspend fun fetchData(): String {
    delay(1000)
    return "Async data fetched at ${LocalDateTime.now()}"
}

fun generateRandomNumbers(count: Int): List<Int> {
    return List(count) { Random.nextInt(100) }
}

fun <T : Comparable<T>> quickSort(list: List<T>): List<T> {
    if (list.size <= 1) return list
    
    val pivot = list[list.size / 2]
    val equal = list.filter { it == pivot }
    val less = list.filter { it < pivot }
    val greater = list.filter { it > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

fun main() = runBlocking {
    println("Welcome to the Enhanced Kotlin Demo!")

    val shapes = listOf(
        Circle(5.0),
        Rectangle(4.0, 6.0)
    )
    
    shapes.forEach {
        println("Shape area: ${it.area()}")
    }

    val person = Person(
        name = "John Doe",
        age = 30,
        hobbies = listOf("reading", "hiking", "coding")
    )
    println("Person: $person")

    val stack = Stack<Int>()
    (1..5).forEach { stack.push(it) }
    
    while (!stack.isEmpty()) {
        println("Popped: ${stack.pop()}")
    }

    println("Calculator Demo:")
    println("10 + 5 = ${Calculator.add(10, 5)}")
    println("10 - 5 = ${Calculator.subtract(10, 5)}")
    println("10 * 5 = ${Calculator.multiply(10, 5)}")
    println("10 / 5 = ${Calculator.divide(10, 5)}")

    val db = Database()
    db.save("user1", person)
    println("Database keys: ${db.getAllKeys()}")

    val numbers = generateRandomNumbers(10)
    println("Random numbers: $numbers")
    
    val sortedNumbers = quickSort(numbers)
    println("Sorted numbers: $sortedNumbers")

    val deferredData = async {
        fetchData()
    }
    
    println("Waiting for async data...")
    println("Result: ${deferredData.await()}")

    val jobs = List(5) { i ->
        launch {
            delay(100 * i.toLong())
            println("Coroutine $i at ${LocalDateTime.now()}")
        }
    }
    
    jobs.forEach { it.join() }

    val numberSequence = sequence {
        var x = 0
        while (true) {
            yield(x++)
            if (x > 10) break
        }
    }
    
    println("Sequence: ${numberSequence.toList()}")

    val filtered = (1..20).asSequence()
        .filter { it % 2 == 0 }
        .map { it * it }
        .take(5)
        .toList()
    
    println("Filtered sequence: $filtered")

    println("Range operations:")
    (1..5).forEach { num ->
        println("$num squared is ${num * num}")
    }

    val letters = ('A'..'E')
    println("Letters: ${letters.joinToString()}")

    val numbers2 = (1..100).filter { num ->
        num % 3 == 0 && num % 5 == 0
    }
    println("Numbers divisible by both 3 and 5: $numbers2")

    println("Demo completed successfully!")
}

