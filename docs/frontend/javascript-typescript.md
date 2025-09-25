---
layout: default
title: JavaScript & TypeScript
permalink: /docs/frontend/javascript-typescript/
redirect_from:
  - /docs/frontend/javascript-typescript.html
---

# JavaScript & TypeScript

## JavaScript Core Concepts

### 1. Execution Context & Hoisting

**Answer:** JavaScript hoists variable and function declarations before execution. `var` → hoisted & initialized as `undefined`; `let`/`const` → hoisted but in temporal dead zone. Functions hoisted fully.

**Example:**
```javascript
console.log(a); // undefined
var a = 5;

console.log(b); // ReferenceError
let b = 10;
```

### 2. Closures

**Answer:** A closure is when a function "remembers" variables from its outer scope, even after that scope has finished executing.

**Example:**
```javascript
function counter() {
  let count = 0;
  return function() {
    count++;
    return count;
  };
}
const inc = counter();
console.log(inc()); // 1
console.log(inc()); // 2
```

### 3. Prototypes & Classes

**Answer:** Objects inherit from prototypes. Classes in ES6 are syntactic sugar over prototype-based inheritance.

**Example:**
```javascript
class Animal {
  speak() { return "Sound"; }
}
class Dog extends Animal {
  speak() { return "Bark"; }
}
console.log(new Dog().speak()); // Bark
```

### 4. this Keyword

**Answer:** `this` refers to the object calling the function, but in arrow functions it's lexically bound.

**Example:**
```javascript
const obj = {
  name: "Vue",
  normal() { return this.name; },
  arrow: () => this.name
};
console.log(obj.normal()); // Vue
console.log(obj.arrow());  // undefined
```

### 5. Event Loop

**Answer:** JS executes synchronously, but async tasks are queued. Microtasks (Promises) run before macrotasks (setTimeout).

**Example:**
```javascript
console.log("A");
setTimeout(() => console.log("B"), 0);
Promise.resolve().then(() => console.log("C"));
console.log("D");
// Output: A, D, C, B
```

### 6. Promises vs async/await

**Answer:** Promises handle async work with `.then()`. `async`/`await` makes it look synchronous but is built on Promises.

**Example:**
```javascript
async function run() {
  const result = await Promise.resolve("done");
  console.log(result);
}
run(); // done
```

### 7. ES6+ Features

**Answer:** Modern JavaScript features that improve code readability and functionality.

**Examples:**
```javascript
// Arrow Functions
const add = (a, b) => a + b;

// Destructuring
const { name, age } = user;
const [first, second] = array;

// Spread/Rest Operators
const newArray = [...oldArray, newItem];
const { password, ...userWithoutPassword } = user;

// Template Literals
const message = `Hello ${name}, you are ${age} years old`;

// Default Parameters
function greet(name = "World") {
  return `Hello ${name}`;
}
```

### 8. Modules (import/export)

**Answer:** ES6 modules provide a standardized way to organize and share code between files.

**Examples:**
```javascript
// math.js
export const add = (a, b) => a + b;
export default class Calculator { }

// main.js
import Calculator, { add } from './math.js';
import * as math from './math.js';
```

### 9. Iterators and Generators

**Answer:** Iterators provide a way to access elements sequentially. Generators are functions that can be paused and resumed.

**Examples:**
```javascript
// Iterator
const iterable = [1, 2, 3];
const iterator = iterable[Symbol.iterator]();
console.log(iterator.next()); // { value: 1, done: false }

// Generator
function* numberGenerator() {
  yield 1;
  yield 2;
  yield 3;
}
const gen = numberGenerator();
console.log(gen.next()); // { value: 1, done: false }
```

### 10. Advanced Closures & Use Cases

**Answer:** Closures have practical applications beyond basic examples.

**Examples:**
```javascript
// Private Variables (Module Pattern)
const counter = (() => {
  let count = 0;
  return {
    increment: () => ++count,
    decrement: () => --count,
    getCount: () => count
  };
})();

// Memoization
const memoize = (fn) => {
  const cache = {};
  return (...args) => {
    const key = JSON.stringify(args);
    return cache[key] || (cache[key] = fn(...args));
  };
};

const expensiveFunction = memoize((n) => {
  console.log('Computing...');
  return n * n;
});
```

### 11. Prototype Chain Deep Dive

**Answer:** Understanding the difference between `__proto__` and `prototype` is crucial for senior-level interviews.

**Examples:**
```javascript
// __proto__ vs prototype
function Person(name) {
  this.name = name;
}

Person.prototype.sayHello = function() {
  return `Hello, I'm ${this.name}`;
};

const person = new Person("Alice");

// person.__proto__ === Person.prototype (true)
// Person.prototype.constructor === Person (true)

// Prototype chain traversal
console.log(person.__proto__); // Person.prototype
console.log(person.__proto__.__proto__); // Object.prototype
console.log(person.__proto__.__proto__.__proto__); // null
```

### 12. Promises Deep Dive

**Answer:** Promises have three states and solve callback hell problems.

**Examples:**
```javascript
// Promise States
const promise = new Promise((resolve, reject) => {
  // pending state
  setTimeout(() => resolve("Success"), 1000);
});

// Promise Chaining (solving callback hell)
fetch('/api/users')
  .then(response => response.json())
  .then(users => users.filter(user => user.active))
  .then(activeUsers => console.log(activeUsers))
  .catch(error => console.error('Error:', error));

// Promise.all vs Promise.race
Promise.all([promise1, promise2, promise3])
  .then(results => console.log('All completed:', results));

Promise.race([promise1, promise2])
  .then(result => console.log('First completed:', result));
```

## TypeScript Deep Dive

### 1. Core TypeScript Concepts

**Answer:** TypeScript adds static typing to JavaScript, providing better tooling and catching errors at compile time.

**Examples:**
```typescript
// Primitive Types
let name: string = "John";
let age: number = 30;
let isActive: boolean = true;
let data: any = "anything";
let unknownData: unknown = "unknown";

// Type Assertions
const userInput = "123";
const userAge = userInput as number;
// or
const userAge2 = <number>userInput;
```

### 2. Interfaces vs Type Aliases

**Answer:** Both define object shapes, but interfaces are more extensible.

**Examples:**
```typescript
// Interface (extensible)
interface User {
  id: number;
  name: string;
}

interface User {
  email: string; // Merged with above
}

// Type Alias (not extensible)
type UserType = {
  id: number;
  name: string;
};

// Union Types
type Status = "loading" | "success" | "error";
```

### 3. Advanced Types

**Answer:** TypeScript provides powerful type manipulation utilities.

**Examples:**
```typescript
// Utility Types
interface User {
  id: number;
  name: string;
  email: string;
  password: string;
}

type UserPreview = Pick<User, "id" | "name">;
type UserUpdate = Partial<User>;
type UserCreate = Omit<User, "id">;
type ReadonlyUser = Readonly<User>;

// Conditional Types
type NonNullable<T> = T extends null | undefined ? never : T;

// Generic Constraints
interface Lengthwise {
  length: number;
}

function logLength<T extends Lengthwise>(arg: T): T {
  console.log(arg.length);
  return arg;
}
```

### 4. Object-Oriented Programming in TypeScript

**Answer:** TypeScript supports full OOP with access modifiers and abstract classes.

**Examples:**
```typescript
// Classes with Access Modifiers
class Animal {
  private name: string;
  protected age: number;
  public species: string;

  constructor(name: string, age: number, species: string) {
    this.name = name;
    this.age = age;
    this.species = species;
  }

  public speak(): string {
    return "Some sound";
  }
}

// Abstract Classes
abstract class Shape {
  abstract getArea(): number;
  
  public describe(): string {
    return `This shape has area ${this.getArea()}`;
  }
}

class Circle extends Shape {
  constructor(private radius: number) {
    super();
  }
  
  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}

// Generics
class Container<T> {
  private items: T[] = [];
  
  add(item: T): void {
    this.items.push(item);
  }
  
  get(index: number): T | undefined {
    return this.items[index];
  }
}
```

---

**Next:** [Vue.js]({{ '/docs/frontend/vuejs/' | relative_url }}) | [Angular]({{ '/docs/frontend/angular/' | relative_url }}) | [React]({{ '/docs/frontend/react/' | relative_url }})
