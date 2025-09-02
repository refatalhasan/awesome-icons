// Basic JavaScript Demo

console.log("Welcome to the JavaScript Demo!");

// Variables and types
let name = "JavaScript";
let version = 2022;
let isFun = true;

console.log(`Language: ${name}, Version: ${version}, Fun: ${isFun}`);

// Arrays
let numbers = [1, 2, 3, 4, 5];
console.log("Numbers:", numbers);

// Objects
let ages = { Alice: 30, Bob: 25 };
console.log("Ages:", ages);

// Functions
function greet(person) {
    console.log(`Hello, ${person}!`);
}
greet("Alice");

// Looping
for (let i = 1; i <= 5; i++) {
    console.log(`Loop ${i}`);
}

// Conditionals
let x = 10;
if (x > 5) {
    console.log(`${x} is greater than 5`);
} else {
    console.log(`${x} is not greater than 5`);
}

// Array map and filter
let squares = numbers.map(n => n * n);
console.log("Squares:", squares);

let evens = numbers.filter(n => n % 2 === 0);
console.log("Evens:", evens);

// String interpolation
let msg = `The answer is ${42}`;
console.log(msg);

// Working with Date
let now = new Date();
console.log("Current date and time:", now);

// Try-catch error handling
try {
    throw new Error("This is an error!");
} catch (e) {
    console.log("Caught error:", e.message);
}

// End