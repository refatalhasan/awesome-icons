-- Welcome message
print("Welcome to the Lua Demo!")

-- Tables for object-oriented programming
local Shape = {}
Shape.__index = Shape

function Shape.new()
    local self = setmetatable({}, Shape)
    return self
end

function Shape:area()
    return 0
end

local Circle = {}
Circle.__index = Circle
setmetatable(Circle, {__index = Shape})

function Circle.new(radius)
    local self = setmetatable({}, Circle)
    self.radius = radius
    return self
end

function Circle:area()
    return math.pi * self.radius * self.radius
end

local Rectangle = {}
Rectangle.__index = Rectangle
setmetatable(Rectangle, {__index = Shape})

function Rectangle.new(width, height)
    local self = setmetatable({}, Rectangle)
    self.width = width
    self.height = height
    return self
end

function Rectangle:area()
    return self.width * self.height
end

-- Stack implementation
local Stack = {}
Stack.__index = Stack

function Stack.new()
    local self = setmetatable({}, Stack)
    self.elements = {}
    return self
end

function Stack:push(element)
    table.insert(self.elements, element)
end

function Stack:pop()
    return table.remove(self.elements)
end

function Stack:peek()
    return self.elements[#self.elements]
end

function Stack:isEmpty()
    return #self.elements == 0
end

-- Queue implementation
local Queue = {}
Queue.__index = Queue

function Queue.new()
    local self = setmetatable({}, Queue)
    self.elements = {}
    self.first = 0
    self.last = -1
    return self
end

function Queue:enqueue(element)
    self.last = self.last + 1
    self.elements[self.last] = element
end

function Queue:dequeue()
    if self.first > self.last then return nil end
    local element = self.elements[self.first]
    self.elements[self.first] = nil
    self.first = self.first + 1
    return element
end

-- Database simulation
local Database = {}
Database.__index = Database

function Database.new()
    local self = setmetatable({}, Database)
    self.storage = {}
    return self
end

function Database:save(key, value)
    self.storage[key] = value
end

function Database:get(key)
    return self.storage[key]
end

function Database:delete(key)
    self.storage[key] = nil
end

-- Utility functions
local function generateRandomNumbers(count, max)
    local numbers = {}
    for i = 1, count do
        numbers[i] = math.random(1, max or 100)
    end
    return numbers
end

local function quickSort(arr)
    if #arr <= 1 then return arr end
    
    local pivot = arr[math.floor(#arr/2)]
    local left, middle, right = {}, {}, {}
    
    for _, x in ipairs(arr) do
        if x < pivot then
            table.insert(left, x)
        elseif x > pivot then
            table.insert(right, x)
        else
            table.insert(middle, x)
        end
    end
    
    local result = {}
    for _, x in ipairs(quickSort(left)) do table.insert(result, x) end
    for _, x in ipairs(middle) do table.insert(result, x) end
    for _, x in ipairs(quickSort(right)) do table.insert(result, x) end
    
    return result
end

-- Demo execution
math.randomseed(os.time())

local circle = Circle.new(5)
local rectangle = Rectangle.new(4, 6)

print("\nShape Areas:")
print("Circle area:", circle:area())
print("Rectangle area:", rectangle:area())

local stack = Stack.new()
for i = 1, 5 do stack:push(i) end

print("\nStack Demo:")
while not stack:isEmpty() do
    print("Popped:", stack:pop())
end

local queue = Queue.new()
for i = 1, 5 do queue:enqueue(i) end

print("\nQueue Demo:")
for i = 1, 5 do
    print("Dequeued:", queue:dequeue())
end

local db = Database.new()
db:save("user1", {name = "John", age = 30})
db:save("user2", {name = "Alice", age = 25})

print("\nDatabase Demo:")
print("User1:", db:get("user1").name)
print("User2:", db:get("user2").name)

local numbers = generateRandomNumbers(10)
print("\nRandom Numbers:", table.concat(numbers, ", "))

local sortedNumbers = quickSort(numbers)
print("Sorted Numbers:", table.concat(sortedNumbers, ", "))

-- Coroutine demo
local function counter(start, finish)
    for i = start, finish do
        coroutine.yield(i)
    end
end

print("\nCoroutine Demo:")
local co = coroutine.create(counter)
while true do
    local code, value = coroutine.resume(co, 1, 5)
    if not code then break end
    print("Coroutine value:", value)
end

-- Metatable demo
local Vector = {}
Vector.__index = Vector

function Vector.new(x, y)
    return setmetatable({x = x, y = y}, Vector)
end

function Vector:__add(other)
    return Vector.new(self.x + other.x, self.y + other.y)
end

function Vector:__tostring()
    return string.format("Vector(%d, %d)", self.x, self.y)
end

local v1 = Vector.new(1, 2)
local v2 = Vector.new(3, 4)
local v3 = v1 + v2

print("\nVector Demo:")
print("v1:", v1)
print("v2:", v2)
print("v1 + v2:", v3)

print("\nDemo completed successfully!")