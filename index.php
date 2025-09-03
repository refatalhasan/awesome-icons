<?php
// Welcome message
echo "Welcome to the PHP Demo!<br>";

// Variables and types
$name = "PHP";
$version = 8.2;
$isFun = true;

echo "Language: $name, Version: $version, Fun: " . ($isFun ? "Yes" : "No") . "<br>";

// Arrays
$numbers = [1, 2, 3, 4, 5];
echo "Numbers: " . implode(", ", $numbers) . "<br>";

// Associative array
$ages = ["Alice" => 30, "Bob" => 25];
foreach ($ages as $person => $age) {
    echo "$person is $age years old<br>";
}

// Simple function
function greet($person) {
    echo "Hello, $person!<br>";
}
greet("Alice");

class Shape {
    public function area() {
        return 0;
    }
}

class Circle extends Shape {
    private $radius;
    
    public function __construct($radius) {
        $this->radius = $radius;
    }
    
    public function area() {
        return pi() * $this->radius * $this->radius;
    }
}

class Rectangle extends Shape {
    private $width;
    private $height;
    
    public function __construct($width, $height) {
        $this->width = $width;
        $this->height = $height;
    }
    
    public function area() {
        return $this->width * $this->height;
    }
}

class Stack {
    private $elements = [];
    
    public function push($element) {
        array_push($this->elements, $element);
    }
    
    public function pop() {
        return array_pop($this->elements);
    }
    
    public function peek() {
        return end($this->elements);
    }
    
    public function isEmpty() {
        return empty($this->elements);
    }
}

class Database {
    private $storage = [];
    
    public function save($key, $value) {
        $this->storage[$key] = $value;
    }
    
    public function get($key) {
        return $this->storage[$key] ?? null;
    }
    
    public function delete($key) {
        unset($this->storage[$key]);
    }
    
    public function getAllKeys() {
        return array_keys($this->storage);
    }
}

class Person {
    private $name;
    private $age;
    private $hobbies;
    
    public function __construct($name, $age, $hobbies = []) {
        $this->name = $name;
        $this->age = $age;
        $this->hobbies = $hobbies;
    }
    
    public function toArray() {
        return [
            'name' => $this->name,
            'age' => $this->age,
            'hobbies' => $this->hobbies
        ];
    }
}

function generateRandomNumbers($count, $max = 100) {
    $numbers = [];
    for ($i = 0; $i < $count; $i++) {
        $numbers[] = rand(1, $max);
    }
    return $numbers;
}

function quickSort($arr) {
    if (count($arr) <= 1) {
        return $arr;
    }
    
    $pivot = $arr[count($arr) / 2];
    $left = $right = $equal = [];
    
    foreach ($arr as $value) {
        if ($value < $pivot) {
            $left[] = $value;
        } elseif ($value > $pivot) {
            $right[] = $value;
        } else {
            $equal[] = $value;
        }
    }
    
    return array_merge(quickSort($left), $equal, quickSort($right));
}

// Demo execution
$circle = new Circle(5);
$rectangle = new Rectangle(4, 6);

echo "<h2>Shape Areas:</h2>";
echo "Circle area: " . $circle->area() . "<br>";
echo "Rectangle area: " . $rectangle->area() . "<br>";

$stack = new Stack();
for ($i = 1; $i <= 5; $i++) {
    $stack->push($i);
}

echo "<h2>Stack Demo:</h2>";
while (!$stack->isEmpty()) {
    echo "Popped: " . $stack->pop() . "<br>";
}

$db = new Database();
$person1 = new Person("John", 30, ["reading", "hiking"]);
$person2 = new Person("Alice", 25, ["painting", "music"]);

$db->save("user1", $person1->toArray());
$db->save("user2", $person2->toArray());

echo "<h2>Database Demo:</h2>";
echo "User1: " . $db->get("user1")["name"] . "<br>";
echo "User2: " . $db->get("user2")["name"] . "<br>";

$numbers = generateRandomNumbers(10);
echo "<h2>Random Numbers:</h2>";
echo implode(", ", $numbers) . "<br>";

$sortedNumbers = quickSort($numbers);
echo "<h2>Sorted Numbers:</h2>";
echo implode(", ", $sortedNumbers) . "<br>";

// Error handling demo
try {
    throw new Exception("This is a test exception");
} catch (Exception $e) {
    echo "<h2>Exception Handling:</h2>";
    echo "Caught exception: " . $e->getMessage() . "<br>";
} finally {
    echo "Finally block executed<br>";
}

// File handling demo
$filename = "test.txt";
file_put_contents($filename, "Hello, File!");
echo "<h2>File Content:</h2>";
echo file_get_contents($filename) . "<br>";

// Array operations
$fruits = ["apple", "banana", "orange"];
$vegetables = ["carrot", "broccoli"];
$merged = array_merge($fruits, $vegetables);

echo "<h2>Array Operations:</h2>";
echo "Merged arrays: " . implode(", ", $merged) . "<br>";
echo "Filtered array: " . implode(", ", array_filter($merged, fn($item) => strlen($item) > 5)) . "<br>";

// Date and time
echo "<h2>Date and Time:</h2>";
echo "Current date: " . date("Y-m-d H:i:s") . "<br>";
echo "Timestamp: " . time() . "<br>";

echo "<h2>Demo completed successfully!</h2>";
?>