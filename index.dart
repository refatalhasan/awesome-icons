import 'dart:async';
import 'dart:math';
import 'dart:convert';

// index.dart
// A fun Dart demo for Awesome Icons 🎨

class Animal {
  String name;
  int legs;

  Animal(this.name, this.legs);

  void describe() {
    print("$name has $legs legs.");
  }
}

class Zoo {
  List<Animal> animals = [];

  void addAnimal(Animal animal) {
    animals.add(animal);
  }

  void showAll() {
    print("🐾 Welcome to the Dart Zoo!");
    for (var a in animals) {
      a.describe();
    }
  }
}

class Shape {
  double area();
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => pi * radius * radius;
}

class Rectangle extends Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Person {
  String name;
  int age;
  List<String> hobbies;

  Person(this.name, this.age, this.hobbies);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'hobbies': hobbies,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['name'],
      json['age'],
      List<String>.from(json['hobbies']),
    );
  }
}

class Database {
  Map<String, dynamic> _storage = {};

  void save(String key, dynamic value) {
    _storage[key] = value;
  }

  dynamic get(String key) {
    return _storage[key];
  }

  void remove(String key) {
    _storage.remove(key);
  }

  List<String> getAllKeys() {
    return _storage.keys.toList();
  }
}

class StreamController<T> {
  final _controller = StreamController<T>();
  Stream<T> get stream => _controller.stream;
  void add(T data) => _controller.add(data);
  void close() => _controller.close();
}

class Calculator {
  static int add(int a, int b) => a + b;
  static int subtract(int a, int b) => a - b;
  static int multiply(int a, int b) => a * b;
  static double divide(int a, int b) => b != 0 ? a / b : double.infinity;
}

class Queue<T> {
  final List<T> _items = [];

  void enqueue(T item) => _items.add(item);
  T dequeue() => _items.removeAt(0);
  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;
}

Future<List<int>> generateRandomNumbers(int count) async {
  var random = Random();
  await Future.delayed(Duration(seconds: 1));
  return List.generate(count, (i) => random.nextInt(100));
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return '{"data": "Hello from the future!"}';
}

List<T> quickSort<T extends Comparable>(List<T> items) {
  if (items.length <= 1) return items;
  
  var pivot = items[items.length ~/ 2];
  var less = items.where((item) => item.compareTo(pivot) < 0).toList();
  var equal = items.where((item) => item.compareTo(pivot) == 0).toList();
  var greater = items.where((item) => item.compareTo(pivot) > 0).toList();
  
  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

void main() async {
  // Variables
  var language = "Dart";
  var version = 3;

  print("🚀 Hello from $language v$version!");

  // Zoo demo
  var zoo = Zoo();
  zoo.addAnimal(Animal("Dog", 4));
  zoo.addAnimal(Animal("Spider", 8));
  zoo.addAnimal(Animal("Human", 2));
  zoo.addAnimal(Animal("Kangaroo", 2));
  zoo.showAll();

  // Function demo
  var sum = Calculator.add(7, 13);
  print("✨ 7 + 13 = $sum");

  // List demo
  var fruits = ["🍎 Apple", "🍌 Banana", "🍇 Grapes", "🍍 Pineapple"];
  print("We have ${fruits.length} fruits:");
  for (var fruit in fruits) {
    print(" - $fruit");
  }

  // Map demo
  var capitals = {"Bangladesh": "Dhaka", "Japan": "Tokyo", "France": "Paris"};
  capitals.forEach((country, capital) {
    print("🏙️ $capital is the capital of $country");
  });

  print("🎉 Dart demo finished!");

  print("🚀 Extended Dart Demo");

  var shapes = [Circle(5), Rectangle(4, 6)];
  for (var shape in shapes) {
    print("Area: ${shape.area()}");
  }

  var person = Person("Alice", 25, ["reading", "hiking"]);
  var jsonString = jsonEncode(person.toJson());
  print("Person JSON: $jsonString");

  var decodedPerson = Person.fromJson(jsonDecode(jsonString));
  print("Decoded person: ${decodedPerson.name}");

  var db = Database();
  db.save("user1", person);
  print("Database keys: ${db.getAllKeys()}");

  var numberStream = StreamController<int>();
  numberStream.stream.listen((data) {
    print("Received: $data");
  });

  for (var i = 1; i <= 5; i++) {
    numberStream.add(i);
  }
  numberStream.close();

  print("Calculator demo:");
  print("Add: ${Calculator.add(10, 5)}");
  print("Subtract: ${Calculator.subtract(10, 5)}");
  print("Multiply: ${Calculator.multiply(10, 5)}");
  print("Divide: ${Calculator.divide(10, 5)}");

  var queue = Queue<String>();
  queue.enqueue("First");
  queue.enqueue("Second");
  queue.enqueue("Third");
  
  while (!queue.isEmpty) {
    print("Dequeued: ${queue.dequeue()}");
  }

  print("Generating random numbers...");
  var randomNumbers = await generateRandomNumbers(5);
  print("Random numbers: $randomNumbers");

  print("Sorting numbers...");
  var sortedNumbers = quickSort(randomNumbers);
  print("Sorted numbers: $sortedNumbers");

  print("Fetching data...");
  var result = await fetchData();
  print("Fetched: $result");

  print("🎉 Extended demo finished!");
}
