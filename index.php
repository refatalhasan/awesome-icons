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
?>