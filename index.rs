use std::collections::HashMap;
use std::fs::{File, OpenOptions};
use std::io::{Read, Write};
use std::sync::{Arc, Mutex};
use std::thread;
use std::time::Duration;

trait Shape {
    fn area(&self) -> f64;
}

struct Circle {
    radius: f64,
}

impl Circle {
    fn new(radius: f64) -> Self {
        Circle { radius }
    }
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius * self.radius
    }
}

struct Rectangle {
    width: f64,
    height: f64,
}

impl Rectangle {
    fn new(width: f64, height: f64) -> Self {
        Rectangle { width, height }
    }
}

impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
}

#[derive(Debug)]
struct Person {
    name: String,
    age: u32,
    hobbies: Vec<String>,
}

impl Person {
    fn new(name: &str, age: u32, hobbies: Vec<String>) -> Self {
        Person {
            name: name.to_string(),
            age,
            hobbies,
        }
    }
}

struct Stack<T> {
    elements: Vec<T>,
}

impl<T> Stack<T> {
    fn new() -> Self {
        Stack { elements: Vec::new() }
    }

    fn push(&mut self, item: T) {
        self.elements.push(item);
    }

    fn pop(&mut self) -> Option<T> {
        self.elements.pop()
    }

    fn peek(&self) -> Option<&T> {
        self.elements.last()
    }

    fn is_empty(&self) -> bool {
        self.elements.is_empty()
    }
}

struct Database {
    storage: HashMap<String, String>,
}

impl Database {
    fn new() -> Self {
        Database {
            storage: HashMap::new(),
        }
    }

    fn save(&mut self, key: &str, value: &str) {
        self.storage.insert(key.to_string(), value.to_string());
    }

    fn get(&self, key: &str) -> Option<&String> {
        self.storage.get(key)
    }

    fn delete(&mut self, key: &str) {
        self.storage.remove(key);
    }
}

fn generate_random_numbers(count: usize) -> Vec<i32> {
    use rand::Rng;
    let mut rng = rand::thread_rng();
    (0..count).map(|_| rng.gen_range(1..101)).collect()
}

fn quick_sort(arr: &mut [i32]) {
    if arr.len() <= 1 {
        return;
    }

    let pivot = arr[arr.len() / 2];
    let mut left = 0;
    let mut right = arr.len() - 1;

    while left <= right {
        while arr[left] < pivot {
            left += 1;
        }
        while arr[right] > pivot {
            right -= 1;
        }
        if left <= right {
            arr.swap(left, right);
            left += 1;
            right = right.wrapping_sub(1);
        }
    }

    if right > 0 {
        quick_sort(&mut arr[..=right]);
    }
    if left < arr.len() {
        quick_sort(&mut arr[left..]);
    }
}

fn main() -> std::io::Result<()> {
    println!("Rust Demo Started");

    let circle = Circle::new(5.0);
    let rectangle = Rectangle::new(4.0, 6.0);

    println!("Circle area: {:.2}", circle.area());
    println!("Rectangle area: {:.2}", rectangle.area());

    let mut stack = Stack::new();
    for i in 1..6 {
        stack.push(i);
    }

    println!("\nStack Demo:");
    while let Some(value) = stack.pop() {
        println!("Popped: {}", value);
    }

    let mut db = Database::new();
    let person1 = Person::new(
        "John",
        30,
        vec!["reading".to_string(), "hiking".to_string()],
    );
    let person2 = Person::new(
        "Alice",
        25,
        vec!["painting".to_string(), "music".to_string()],
    );

    db.save("user1", &person1.name);
    db.save("user2", &person2.name);

    println!("\nDatabase Demo:");
    println!("User1: {:?}", db.get("user1"));
    println!("User2: {:?}", db.get("user2"));

    let mut numbers = generate_random_numbers(10);
    println!("\nRandom numbers: {:?}", numbers);

    quick_sort(&mut numbers);
    println!("Sorted numbers: {:?}", numbers);

    let data = Arc::new(Mutex::new(vec![1, 2, 3, 4, 5]));
    let mut handles = vec![];

    for i in 0..3 {
        let data_clone = Arc::clone(&data);
        let handle = thread::spawn(move || {
            let mut data = data_clone.lock().unwrap();
            data[0] += i;
            thread::sleep(Duration::from_millis(100));
            println!("Thread {}: {:?}", i, *data);
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    let mut file = OpenOptions::new()
        .write(true)
        .create(true)
        .open("test.txt")?;

    file.write_all(b"Hello from Rust!")?;

    let mut contents = String::new();
    File::open("test.txt")?.read_to_string(&mut contents)?;
    println!("\nFile contents: {}", contents);

    println!("\nDemo completed successfully!");
    Ok(())
}