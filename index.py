from typing import List, Dict, Any, Optional
import random
import time
import json
import asyncio
from dataclasses import dataclass
from abc import ABC, abstractmethod
from datetime import datetime

class Shape(ABC):
    @abstractmethod
    def area(self) -> float:
        pass

class Circle(Shape):
    def __init__(self, radius: float):
        self.radius = radius
    
    def area(self) -> float:
        return 3.14159 * self.radius * self.radius

class Rectangle(Shape):
    def __init__(self, width: float, height: float):
        self.width = width
        self.height = height
    
    def area(self) -> float:
        return self.width * self.height

@dataclass
class Person:
    name: str
    age: int
    hobbies: List[str]
    
    def to_dict(self) -> Dict[str, Any]:
        return {
            "name": self.name,
            "age": self.age,
            "hobbies": self.hobbies
        }

class Stack:
    def __init__(self):
        self._items: List[Any] = []
    
    def push(self, item: Any) -> None:
        self._items.append(item)
    
    def pop(self) -> Optional[Any]:
        return self._items.pop() if not self.is_empty() else None
    
    def peek(self) -> Optional[Any]:
        return self._items[-1] if not self.is_empty() else None
    
    def is_empty(self) -> bool:
        return len(self._items) == 0

class Database:
    def __init__(self):
        self._storage: Dict[str, Any] = {}
    
    def save(self, key: str, value: Any) -> None:
        self._storage[key] = value
    
    def get(self, key: str) -> Optional[Any]:
        return self._storage.get(key)
    
    def delete(self, key: str) -> None:
        self._storage.pop(key, None)
    
    def get_all_keys(self) -> List[str]:
        return list(self._storage.keys())

def generate_random_numbers(count: int, max_value: int = 100) -> List[int]:
    return [random.randint(1, max_value) for _ in range(count)]

def quick_sort(arr: List[int]) -> List[int]:
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quick_sort(left) + middle + quick_sort(right)

async def fetch_data(delay: float) -> str:
    await asyncio.sleep(delay)
    return f"Data fetched at {datetime.now()}"

class DataProcessor:
    def __init__(self, data: List[int]):
        self.data = data
    
    def map(self, func) -> List[Any]:
        return list(map(func, self.data))
    
    def filter(self, func) -> List[Any]:
        return list(filter(func, self.data))
    
    def reduce(self, func, initial=None):
        if initial is not None:
            return reduce(func, self.data, initial)
        return reduce(func, self.data)

async def main():
    print("Python Demo Started")
    
    # Shapes
    circle = Circle(5)
    rectangle = Rectangle(4, 6)
    print(f"Circle area: {circle.area():.2f}")
    print(f"Rectangle area: {rectangle.area():.2f}")
    
    # Stack
    stack = Stack()
    for i in range(1, 6):
        stack.push(i)
    
    print("\nStack Demo:")
    while not stack.is_empty():
        print(f"Popped: {stack.pop()}")
    
    # Database
    db = Database()
    person1 = Person("John", 30, ["reading", "hiking"])
    person2 = Person("Alice", 25, ["painting", "music"])
    
    db.save("user1", person1.to_dict())
    db.save("user2", person2.to_dict())
    
    print("\nDatabase Demo:")
    print(f"User1: {db.get('user1')['name']}")
    print(f"User2: {db.get('user2')['name']}")
    
    # Random numbers and sorting
    numbers = generate_random_numbers(10)
    print(f"\nRandom numbers: {numbers}")
    
    sorted_numbers = quick_sort(numbers)
    print(f"Sorted numbers: {sorted_numbers}")
    
    # Async operations
    print("\nAsync Demo:")
    result = await fetch_data(1.0)
    print(result)
    
    # Data processing
    processor = DataProcessor([1, 2, 3, 4, 5])
    squared = processor.map(lambda x: x * x)
    evens = processor.filter(lambda x: x % 2 == 0)
    
    print("\nData Processing:")
    print(f"Squared numbers: {squared}")
    print(f"Even numbers: {evens}")
    
    # Error handling
    try:
        raise ValueError("This is a test exception")
    except ValueError as e:
        print(f"\nCaught exception: {e}")
    finally:
        print("Finally block executed")
    
    print("\nDemo completed successfully!")

if __name__ == "__main__":
    asyncio.run(main())