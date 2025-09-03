require 'date'
require 'json'

class Shape
  def area
    0
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
  end
  
  def area
    Math::PI * @radius * @radius
  end
end

class Rectangle < Shape
  def initialize(width, height)
    @width = width
    @height = height
  end
  
  def area
    @width * @height
  end
end

class Stack
  def initialize
    @elements = []
  end
  
  def push(item)
    @elements.push(item)
  end
  
  def pop
    @elements.pop
  end
  
  def peek
    @elements.last
  end
  
  def empty?
    @elements.empty?
  end
end

class Database
  def initialize
    @storage = {}
  end
  
  def save(key, value)
    @storage[key] = value
  end
  
  def get(key)
    @storage[key]
  end
  
  def delete(key)
    @storage.delete(key)
  end
  
  def all_keys
    @storage.keys
  end
end

class Person
  attr_reader :name, :age, :hobbies
  
  def initialize(name, age, hobbies)
    @name = name
    @age = age
    @hobbies = hobbies
  end
  
  def to_hash
    {
      name: @name,
      age: @age,
      hobbies: @hobbies
    }
  end
  
  def to_json
    to_hash.to_json
  end
end

def generate_random_numbers(count, max = 100)
  Array.new(count) { rand(1..max) }
end

def quick_sort(arr)
  return arr if arr.length <= 1
  
  pivot = arr[arr.length / 2]
  left = arr.select { |x| x < pivot }
  middle = arr.select { |x| x == pivot }
  right = arr.select { |x| x > pivot }
  
  quick_sort(left) + middle + quick_sort(right)
end

module DataProcessor
  def self.map(array, &block)
    array.map(&block)
  end
  
  def self.filter(array, &block)
    array.select(&block)
  end
  
  def self.reduce(array, initial = nil, &block)
    array.reduce(initial, &block)
  end
end

class FileHandler
  def initialize(filename)
    @filename = filename
  end
  
  def write(content)
    File.write(@filename, content)
  end
  
  def read
    File.read(@filename)
  end
end

puts "Ruby Demo Started"

circle = Circle.new(5)
rectangle = Rectangle.new(4, 6)

puts "Circle area: #{circle.area.round(2)}"
puts "Rectangle area: #{rectangle.area}"

stack = Stack.new
(1..5).each { |i| stack.push(i) }

puts "\nStack Demo:"
until stack.empty?
  puts "Popped: #{stack.pop}"
end

db = Database.new
person1 = Person.new("John", 30, ["reading", "hiking"])
person2 = Person.new("Alice", 25, ["painting", "music"])

db.save("user1", person1.to_hash)
db.save("user2", person2.to_hash)

puts "\nDatabase Demo:"
puts "User1: #{db.get('user1')[:name]}"
puts "User2: #{db.get('user2')[:name]}"

numbers = generate_random_numbers(10)
puts "\nRandom numbers: #{numbers.join(', ')}"

sorted_numbers = quick_sort(numbers)
puts "Sorted numbers: #{sorted_numbers.join(', ')}"

puts "\nData Processing Demo:"
squared = DataProcessor.map(numbers) { |x| x * x }
evens = DataProcessor.filter(numbers) { |x| x.even? }
sum = DataProcessor.reduce(numbers, 0) { |acc, x| acc + x }

puts "Squared numbers: #{squared.join(', ')}"
puts "Even numbers: #{evens.join(', ')}"
puts "Sum of numbers: #{sum}"

file_handler = FileHandler.new("test.txt")
file_handler.write("Hello from Ruby!")
puts "\nFile content: #{file_handler.read}"

begin
  raise "This is a test exception"
rescue StandardError => e
  puts "\nCaught exception: #{e.message}"
ensure
  puts "Finally block executed"
end

puts "\nDemo completed successfully!"