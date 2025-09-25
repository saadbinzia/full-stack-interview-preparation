---
layout: default
title: Python
permalink: /docs/backend/python/
redirect_from:
  - /docs/backend/python.html
---

# Python

## Core Concepts

### 1. Data Structures & Time Complexity

**Answer:** Python's built-in data structures have different time complexities for operations. Understanding these is crucial for choosing the right data structure.

**Examples:**
```python
# Lists - O(1) access, O(n) insertion/deletion
my_list = [1, 2, 3, 4, 5]
my_list.append(6)        # O(1) amortized
my_list.insert(0, 0)     # O(n)
my_list[2]               # O(1)

# Tuples - Immutable, O(1) access
my_tuple = (1, 2, 3, 4, 5)
my_tuple[2]              # O(1)

# Sets - O(1) average for add/remove/lookup
my_set = {1, 2, 3, 4, 5}
my_set.add(6)            # O(1)
6 in my_set              # O(1)

# Dictionaries - O(1) average for get/set/delete
my_dict = {'a': 1, 'b': 2, 'c': 3}
my_dict['d'] = 4         # O(1)
my_dict.get('a')         # O(1)
```

### 2. Decorators

**Answer:** Decorators are functions that modify or enhance other functions without changing their code. They're commonly used for logging, caching, authentication, and validation.

**Examples:**
```python
# Basic Decorator
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print("Before function call")
        result = func(*args, **kwargs)
        print("After function call")
        return result
    return wrapper

@my_decorator
def greet(name):
    print(f"Hello, {name}!")

# Real-world: Logging Decorator
import functools
import time

def log_execution_time(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        print(f"{func.__name__} executed in {end_time - start_time:.4f} seconds")
        return result
    return wrapper

@log_execution_time
def slow_function():
    time.sleep(1)
    return "Done"

# Real-world: Caching Decorator
def memoize(func):
    cache = {}
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        key = str(args) + str(kwargs)
        if key not in cache:
            cache[key] = func(*args, **kwargs)
        return cache[key]
    return wrapper

@memoize
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

### 3. Generators & Iterators

**Answer:** Generators are memory-efficient iterators that yield values one at a time. They use the `yield` keyword and are perfect for large datasets.

**Examples:**
```python
# Generator Function
def number_generator(n):
    for i in range(n):
        yield i * i

# Using Generator
gen = number_generator(5)
for num in gen:
    print(num)  # 0, 1, 4, 9, 16

# Generator Expression
squares = (x*x for x in range(10))
print(list(squares))  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# Memory Efficiency Example
def read_large_file(filename):
    with open(filename, 'r') as file:
        for line in file:
            yield line.strip()

# This doesn't load the entire file into memory
for line in read_large_file('huge_file.txt'):
    process(line)

# Iterator Protocol
class CountDown:
    def __init__(self, start):
        self.start = start
    
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.start <= 0:
            raise StopIteration
        self.start -= 1
        return self.start + 1

for num in CountDown(5):
    print(num)  # 5, 4, 3, 2, 1
```

### 4. Object-Oriented Programming

**Answer:** Python supports full OOP with classes, inheritance, polymorphism, and special methods (magic methods).

**Examples:**
```python
# Basic Class
class Animal:
    def __init__(self, name, species):
        self.name = name
        self.species = species
    
    def __str__(self):
        return f"{self.name} is a {self.species}"
    
    def __repr__(self):
        return f"Animal('{self.name}', '{self.species}')"
    
    def make_sound(self):
        return "Some generic sound"

# Inheritance
class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name, "Dog")
        self.breed = breed
    
    def make_sound(self):  # Polymorphism
        return "Woof!"
    
    def fetch(self):
        return f"{self.name} is fetching!"

# Property Decorators
class Circle:
    def __init__(self, radius):
        self._radius = radius
    
    @property
    def radius(self):
        return self._radius
    
    @radius.setter
    def radius(self, value):
        if value < 0:
            raise ValueError("Radius cannot be negative")
        self._radius = value
    
    @property
    def area(self):
        return 3.14159 * self._radius ** 2

# Abstract Base Class
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass
    
    @abstractmethod
    def perimeter(self):
        pass

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height
    
    def perimeter(self):
        return 2 * (self.width + self.height)
```

### 5. Concurrency in Python

**Answer:** Python's GIL (Global Interpreter Lock) limits true parallelism with threads, but different concurrency models serve different purposes.

**Examples:**
```python
import threading
import multiprocessing
import asyncio
import time

# Threading (I/O bound tasks)
def io_task(name, delay):
    print(f"Task {name} starting")
    time.sleep(delay)  # Simulate I/O
    print(f"Task {name} completed")

# Threading Example
threads = []
for i in range(3):
    thread = threading.Thread(target=io_task, args=(f"Thread-{i}", 1))
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()

# Multiprocessing (CPU bound tasks)
def cpu_task(n):
    result = 0
    for i in range(n):
        result += i ** 2
    return result

# Multiprocessing Example
if __name__ == "__main__":
    with multiprocessing.Pool() as pool:
        results = pool.map(cpu_task, [1000000, 2000000, 3000000])
    print(results)

# Asyncio (Async I/O)
async def async_task(name, delay):
    print(f"Async task {name} starting")
    await asyncio.sleep(delay)
    print(f"Async task {name} completed")

# Asyncio Example
async def main():
    tasks = [
        async_task("Task-1", 1),
        async_task("Task-2", 2),
        async_task("Task-3", 1)
    ]
    await asyncio.gather(*tasks)

# Run asyncio
asyncio.run(main())

# GIL Explanation
# The GIL prevents true parallelism with threads for CPU-bound tasks
# Use multiprocessing for CPU-bound tasks
# Use threading for I/O-bound tasks
# Use asyncio for async I/O operations
```

## Advanced Python Concepts

### 1. Context Managers

**Answer:** Context managers ensure proper resource management using the `with` statement.

**Examples:**
```python
# Built-in context manager
with open('file.txt', 'r') as file:
    content = file.read()
# File automatically closed

# Custom context manager
class DatabaseConnection:
    def __enter__(self):
        print("Connecting to database")
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print("Closing database connection")
        if exc_type:
            print(f"Exception occurred: {exc_val}")
        return False  # Don't suppress exceptions

# Using custom context manager
with DatabaseConnection() as db:
    print("Performing database operations")
    # raise Exception("Something went wrong")

# Using contextlib
from contextlib import contextmanager

@contextmanager
def timer():
    start = time.time()
    try:
        yield
    finally:
        end = time.time()
        print(f"Execution time: {end - start:.2f} seconds")

with timer():
    time.sleep(1)
```

### 2. Metaclasses

**Answer:** Metaclasses are classes whose instances are classes. They control class creation.

**Examples:**
```python
# Simple metaclass
class SingletonMeta(type):
    _instances = {}
    
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]

class Singleton(metaclass=SingletonMeta):
    def __init__(self, value):
        self.value = value

# Both instances are the same
s1 = Singleton("first")
s2 = Singleton("second")
print(s1 is s2)  # True
```

### 3. Descriptors

**Answer:** Descriptors are objects that define how attribute access is handled.

**Examples:**
```python
class ValidatedProperty:
    def __init__(self, validator):
        self.validator = validator
        self.name = None
    
    def __set_name__(self, owner, name):
        self.name = name
    
    def __get__(self, instance, owner):
        if instance is None:
            return self
        return instance.__dict__.get(self.name)
    
    def __set__(self, instance, value):
        if not self.validator(value):
            raise ValueError(f"Invalid value: {value}")
        instance.__dict__[self.name] = value

def is_positive(value):
    return isinstance(value, (int, float)) and value > 0

class Rectangle:
    width = ValidatedProperty(is_positive)
    height = ValidatedProperty(is_positive)
    
    def __init__(self, width, height):
        self.width = width
        self.height = height

# Usage
rect = Rectangle(5, 3)  # OK
# rect.width = -1  # Raises ValueError
```

---

**Next:** [Laravel](laravel.md) | [System Design](system-design.md) | [JavaScript & TypeScript](../frontend/javascript-typescript.md)
