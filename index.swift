import Foundation

protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
        return width * height
    }
}

struct Person: Codable {
    let name: String
    let age: Int
    let hobbies: [String]
    
    func toJson() -> String? {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}

class Stack<T> {
    private var elements: [T] = []
    
    func push(_ item: T) {
        elements.append(item)
    }
    
    func pop() -> T? {
        return elements.popLast()
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
}

class Database {
    private var storage: [String: Any] = [:]
    
    func save(key: String, value: Any) {
        storage[key] = value
    }
    
    func get(key: String) -> Any? {
        return storage[key]
    }
    
    func delete(key: String) {
        storage.removeValue(forKey: key)
    }
    
    func getAllKeys() -> [String] {
        return Array(storage.keys)
    }
}

func generateRandomNumbers(count: Int, max: Int = 100) -> [Int] {
    return (0..<count).map { _ in Int.random(in: 1...max) }
}

func quickSort<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.count <= 1 { return arr }
    
    let pivot = arr[arr.count / 2]
    let less = arr.filter { $0 < pivot }
    let equal = arr.filter { $0 == pivot }
    let greater = arr.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

class DataProcessor<T> {
    let data: [T]
    
    init(data: [T]) {
        self.data = data
    }
    
    func map<U>(_ transform: (T) -> U) -> [U] {
        return data.map(transform)
    }
    
    func filter(_ isIncluded: (T) -> Bool) -> [T] {
        return data.filter(isIncluded)
    }
    
    func reduce<U>(_ initialResult: U, _ nextPartialResult: (U, T) -> U) -> U {
        return data.reduce(initialResult, nextPartialResult)
    }
}

class FileHandler {
    let filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    func write(_ content: String) throws {
        try content.write(toFile: filename, atomically: true, encoding: .utf8)
    }
    
    func read() throws -> String {
        return try String(contentsOfFile: filename, encoding: .utf8)
    }
}

print("Swift Demo Started")

let circle = Circle(radius: 5)
let rectangle = Rectangle(width: 4, height: 6)

print("Circle area: \(String(format: "%.2f", circle.area()))")
print("Rectangle area: \(rectangle.area())")

let stack = Stack<Int>()
(1...5).forEach { stack.push($0) }

print("\nStack Demo:")
while let value = stack.pop() {
    print("Popped: \(value)")
}

let db = Database()
let person1 = Person(name: "John", age: 30, hobbies: ["reading", "hiking"])
let person2 = Person(name: "Alice", age: 25, hobbies: ["painting", "music"])

db.save(key: "user1", value: person1)
db.save(key: "user2", value: person2)

print("\nDatabase Demo:")
if let user1 = db.get(key: "user1") as? Person {
    print("User1: \(user1.name)")
}
if let user2 = db.get(key: "user2") as? Person {
    print("User2: \(user2.name)")
}

let numbers = generateRandomNumbers(count: 10)
print("\nRandom numbers: \(numbers)")

let sortedNumbers = quickSort(numbers)
print("Sorted numbers: \(sortedNumbers)")

let processor = DataProcessor(data: numbers)
let squared = processor.map { $0 * $0 }
let evens = processor.filter { $0 % 2 == 0 }
let sum = processor.reduce(0, +)

print("\nData Processing:")
print("Squared numbers: \(squared)")
print("Even numbers: \(evens)")
print("Sum of numbers: \(sum)")

let fileHandler = FileHandler(filename: "test.txt")
do {
    try fileHandler.write("Hello from Swift!")
    let content = try fileHandler.read()
    print("\nFile content: \(content)")
} catch {
    print("File error: \(error)")
}

print("\nDemo completed successfully!")