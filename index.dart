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

int addNumbers(int a, int b) {
  return a + b;
}

void main() {
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
  var sum = addNumbers(7, 13);
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
}
