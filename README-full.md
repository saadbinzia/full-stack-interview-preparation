# Full-Stack Interview Preparation Guide 🚀

> **Comprehensive interview preparation covering JavaScript, TypeScript, Vue.js, Angular, Python, system design, and more. 3000+ lines of examples and explanations for senior-level positions.**

[![GitHub stars](https://img.shields.io/github/stars/yourusername/full-stack-interview-preparation?style=social)](https://github.com/yourusername/full-stack-interview-preparation)
[![GitHub forks](https://img.shields.io/github/forks/yourusername/full-stack-interview-preparation?style=social)](https://github.com/yourusername/full-stack-interview-preparation)
[![GitHub issues](https://img.shields.io/github/issues/yourusername/full-stack-interview-preparation)](https://github.com/yourusername/full-stack-interview-preparation/issues)

## 📚 Table of Contents

### [Part 1: General Interview Preparation Strategy](#part-1-general-interview-preparation-strategy)
- [Problem-Solving Approach](#problem-solving-approach)
- [Soft Skills & Experience (10+ Years)](#soft-skills--experience-10-years)

### [Part 2: JavaScript & TypeScript](#part-2-javascript--typescript)
- [Execution Context & Hoisting](#1-execution-context--hoisting)
- [Closures](#2-closures)
- [Prototypes & Classes](#3-prototypes--classes)
- [this Keyword](#4-this-keyword)
- [Event Loop](#5-event-loop)
- [Promises vs async/await](#6-promises-vs-asyncawait)
- [ES6+ Features](#7-es6-features)
- [Modules (import/export)](#8-modules-importexport)
- [Iterators and Generators](#9-iterators-and-generators)
- [Advanced Closures & Use Cases](#10-advanced-closures--use-cases)
- [Prototype Chain Deep Dive](#11-prototype-chain-deep-dive)
- [Promises Deep Dive](#12-promises-deep-dive)

### [Part 3: TypeScript Deep Dive](#part-3-typescript-deep-dive)
- [Core TypeScript Concepts](#1-core-typescript-concepts)
- [Interfaces vs Type Aliases](#2-interfaces-vs-type-aliases)
- [Advanced Types](#3-advanced-types)
- [Object-Oriented Programming in TypeScript](#4-object-oriented-programming-in-typescript)

### [Part 4: Frameworks](#part-4-frameworks)

#### [Vue.js](#vuejs)
- [Reactivity System](#1-reactivity)
- [Lifecycle Hooks (Detailed)](#2-lifecycle-hooks-detailed)
- [State Management (Vuex/Pinia)](#3-state-management-vuexpinia)
- [Directives](#4-directives)
- [Vue Router](#5-vue-router)
- [Vue 3 Composition API](#6-vue-3-composition-api)
- [Performance Optimizations](#7-performance-optimizations)
- [Custom Directives](#8-custom-directives)
- [Mixins vs Composables](#9-mixins-vs-composables)

#### [Angular](#angular)
- [Core Concepts & Architecture](#1-core-concepts--architecture)
- [Component Communication](#2-component-communication)
- [Dependency Injection (DI)](#3-dependency-injection-di)
- [RxJS: Observable vs Subject vs Promise](#4-rxjs-observable-vs-subject-vs-promise)
- [Data Binding Types](#5-data-binding-types)
- [RxJS Operators](#6-rxjs-operators)
- [Advanced Dependency Injection](#7-advanced-dependency-injection)
- [Angular Modules Deep Dive](#8-angular-modules-deep-dive)
- [Angular Forms (Reactive vs Template-driven)](#9-angular-forms-reactive-vs-template-driven)
- [Angular Testing](#10-angular-testing)

#### [React](#react)
- [Core Concepts & JSX](#1-core-concepts--jsx)
- [Hooks (useState, useEffect, useContext)](#2-hooks-usestate-useeffect-usecontext)
- [State Management (Redux, Context API, Zustand)](#3-state-management-redux-context-api-zustand)
- [Performance Optimization](#4-performance-optimization)
- [React Testing](#5-react-testing)

#### [Nuxt.js](#nuxtjs)
- [Core Concepts & SSR](#1-core-concepts--ssr)
- [File-based Routing](#2-file-based-routing)
- [Middleware & Plugins](#3-middleware--plugins)

#### [Next.js](#nextjs)
- [Core Concepts & App Router](#1-core-concepts--app-router)
- [Data Fetching (SSR, SSG, ISR)](#2-data-fetching-ssr-ssg-isr)
- [API Routes](#3-api-routes)

### [Part 5: Python & Back-End Development](#part-5-python--back-end-development)

#### [Python Core Concepts](#python-core-concepts)
- [Data Structures & Time Complexity](#1-data-structures--time-complexity)
- [Decorators](#2-decorators)
- [Generators & Iterators](#3-generators--iterators)
- [Object-Oriented Programming](#4-object-oriented-programming)
- [Concurrency in Python](#5-concurrency-in-python)

#### [Laravel](#laravel)
- [MVC Architecture & Core Concepts](#1-mvc-architecture--core-concepts)
- [Eloquent ORM & Relationships](#2-eloquent-orm--relationships)
- [Middleware & Authentication](#3-middleware--authentication)
- [Laravel Testing](#4-laravel-testing)
- [Laravel Queues & Jobs](#5-laravel-queues--jobs)

#### [Back-End Concepts & System Design](#back-end-concepts--system-design)
- [RESTful APIs](#1-restful-apis)
- [Database Knowledge](#2-database-knowledge)
- [Authentication & Authorization](#3-authentication--authorization)
- [System Design Principles](#4-system-design-principles)

### [Part 6: Preparation Portals & Study Strategies](#part-6-preparation-portals--study-strategies)
- [Recommended Learning Platforms](#recommended-learning-platforms)
- [Study Action Plan](#study-action-plan)
- [Key Success Strategies](#key-success-strategies)
- [System Design Interview Process](#system-design-interview-process)
- [Common System Design Questions](#common-system-design-questions)
- [Final Preparation Checklist](#final-preparation-checklist)

---

## 🎯 Quick Start

This guide is designed for developers with **10+ years of experience** preparing for senior-level positions. Each topic includes:
- ✅ **Clear explanations** of core concepts
- ✅ **Practical code examples** with real-world applications
- ✅ **Interview-ready answers** with "why" and "when" explanations
- ✅ **Time complexity analysis** where applicable
- ✅ **System design patterns** and best practices

## 🚀 How to Use This Guide

1. **Start with Part 1** for general interview strategy
2. **Focus on your strengths** - Frontend (Parts 2-3) or Backend (Part 4)
3. **Practice daily** using the study action plan
4. **Use the checklist** to track your progress
5. **Contribute** by adding examples or fixing issues

## 🤝 Contributing

Found an error or want to add more examples? Contributions are welcome!
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

# Interview Prep — Answers + Examples

## Part 1: General Interview Preparation Strategy

### Problem-Solving Approach

**1. Understand the "Why"**
- For every technical concept, don't just know "what it is"
- Understand why it exists, when you would use it, and what its trade-offs are
- Example: Instead of just defining closures, explain their common use cases (private variables, memoization)

**2. Practice Problem-Solving**
- Show your ability to think through a problem systematically
- This is about logical thinking, not complex algorithms

**3. The Interview Process**
- **Clarify:** Ask clarifying questions about inputs, outputs, and edge cases
- **Outline:** Explain your thought process before coding
- **Code:** Write clean, readable code
- **Test:** Walk through test cases including edge cases

### Soft Skills & Experience (10+ Years)

**Behavioral Questions to Prepare:**
- Past projects: What was your role? What technical challenges did you face?
- Team collaboration: Code reviews, Agile environment experience
- System design: Scalability and performance optimization discussions
- Leadership: Mentoring junior developers, technical decision making

**Key Areas to Discuss:**
- Code review processes and best practices
- Working in Agile/Scrum environments
- Handling technical debt and refactoring
- Performance optimization strategies
- Cross-team collaboration and communication

## Part 2: JavaScript & TypeScript

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

## Part 3: TypeScript Deep Dive

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

## Part 4: Frameworks

### Vue.js

#### 1. Reactivity

**Answer:** Vue 2 uses `Object.defineProperty`, Vue 3 uses `Proxy` → better performance.

**Example:**
```javascript
const state = Vue.reactive({ count: 0 });
state.count++; // automatically tracked
```

#### 2. Lifecycle Hooks (Detailed)

**Answer:** Hooks let you run code at specific stages of component lifecycle.

**Vue 2 Lifecycle:**
```javascript
export default {
  beforeCreate() {
    // Before instance is created
    console.log('beforeCreate');
  },
  created() {
    // Instance created, data reactive
    console.log('created');
  },
  beforeMount() {
    // Before DOM mounting
    console.log('beforeMount');
  },
  mounted() {
    // DOM mounted, component ready
    console.log('mounted');
  },
  beforeUpdate() {
    // Before re-rendering
    console.log('beforeUpdate');
  },
  updated() {
    // After re-rendering
    console.log('updated');
  },
  beforeDestroy() {
    // Before destruction
    console.log('beforeDestroy');
  },
  destroyed() {
    // Component destroyed
    console.log('destroyed');
  }
};
```

**Vue 3 Composition API:**
```javascript
import { onMounted, onUpdated, onUnmounted } from 'vue';

export default {
  setup() {
    onMounted(() => {
      console.log('Component mounted');
    });
    
    onUpdated(() => {
      console.log('Component updated');
    });
    
    onUnmounted(() => {
      console.log('Component unmounted');
    });
  }
};
```

#### 3. State Management (Vuex/Pinia)

**Answer:**
- **State:** data
- **Getters:** computed data
- **Mutations:** sync updates
- **Actions:** async updates

**Example (Pinia):**
```javascript
const useStore = defineStore("main", {
  state: () => ({ count: 0 }),
  actions: { 
    increment() { 
      this.count++ 
    } 
  }
});
```

#### 4. Directives

**Answer:** `v-if` removes/adds from DOM, `v-show` just toggles CSS.

**Example:**
```html
<p v-if="visible">Shown if true</p>
<p v-show="visible">Always in DOM, just hidden</p>
```

#### 5. Vue Router

**Answer:** Supports nested routes & guards. Guards check access before navigation.

**Example:**
```javascript
const routes = [
  { 
    path: "/user", 
    component: User,
    children: [{ path: "profile", component: Profile }]
  }
];

router.beforeEach((to, from, next) => {
  if (!isLoggedIn) next("/login"); 
  else next();
});
```

#### 6. Vue 3 Composition API

**Answer:** Composition API provides better code organization and reusability compared to Options API.

**Examples:**
```javascript
// Composition API with reactive data
import { ref, reactive, computed, watch } from 'vue';

export default {
  setup() {
    // Reactive references
    const count = ref(0);
    const user = reactive({ name: 'John', age: 30 });
    
    // Computed properties
    const doubleCount = computed(() => count.value * 2);
    
    // Watchers
    watch(count, (newVal, oldVal) => {
      console.log(`Count changed from ${oldVal} to ${newVal}`);
    });
    
    // Methods
    const increment = () => {
      count.value++;
    };
    
    return {
      count,
      user,
      doubleCount,
      increment
    };
  }
};
```

#### 7. Performance Optimizations

**Answer:** Vue provides several techniques to optimize application performance.

**Examples:**
```javascript
// v-memo for expensive list rendering
<div v-for="item in list" :key="item.id" v-memo="[item.id, item.name]">
  {{ item.name }}
</div>

// Lazy loading components
const AsyncComponent = defineAsyncComponent(() => import('./HeavyComponent.vue'));

// Keep-alive for component caching
<keep-alive>
  <component :is="currentComponent" />
</keep-alive>

// Virtual scrolling for large lists
<VirtualList :items="largeList" :item-height="50" />
```

#### 8. Custom Directives

**Answer:** Custom directives allow you to create reusable DOM manipulation logic.

**Examples:**
```javascript
// Global directive
app.directive('focus', {
  mounted(el) {
    el.focus();
  }
});

// Local directive with arguments
export default {
  directives: {
    highlight: {
      mounted(el, binding) {
        el.style.backgroundColor = binding.value;
      },
      updated(el, binding) {
        el.style.backgroundColor = binding.value;
      }
    }
  }
};

// Usage
<input v-focus />
<div v-highlight="'yellow'">Highlighted text</div>
```

#### 9. Mixins vs Composables

**Answer:** Mixins (Vue 2) and Composables (Vue 3) provide code reuse, but Composables are more flexible.

**Mixins (Vue 2):**
```javascript
const userMixin = {
  data() {
    return { user: null };
  },
  methods: {
    fetchUser() {
      // fetch user logic
    }
  }
};

export default {
  mixins: [userMixin]
};
```

**Composables (Vue 3):**
```javascript
// useUser.js
import { ref } from 'vue';

export function useUser() {
  const user = ref(null);
  
  const fetchUser = async () => {
    // fetch user logic
  };
  
  return {
    user,
    fetchUser
  };
}

// Component
import { useUser } from './useUser';

export default {
  setup() {
    const { user, fetchUser } = useUser();
    return { user, fetchUser };
  }
};
```

### Angular

#### 1. Core Concepts & Architecture

**Answer:** Angular apps built from components, modules, services, DI, and data binding.

**Main Building Blocks:**
- **Components:** UI building blocks with templates, styles, and logic
- **Modules:** Organize application into cohesive blocks of functionality
- **Services:** Singleton objects for data sharing and business logic
- **Dependency Injection:** Framework-managed object creation and injection
- **Data Binding:** Automatic synchronization between model and view

**Example:**
```typescript
// app.module.ts
@NgModule({
  declarations: [AppComponent, UserComponent],
  imports: [BrowserModule, HttpClientModule],
  providers: [UserService],
  bootstrap: [AppComponent]
})
export class AppModule { }

// user.service.ts
@Injectable({ providedIn: 'root' })
export class UserService {
  private users: User[] = [];
  
  getUsers(): Observable<User[]> {
    return of(this.users);
  }
}
```

#### 2. Component Communication

**Answer:**
- **Parent → Child:** `@Input()`
- **Child → Parent:** `@Output()` with `EventEmitter`

**Example:**
```typescript
// child.component.ts
@Input() title!: string;
@Output() notify = new EventEmitter<string>();

// parent template
<app-child [title]="parentTitle" (notify)="onNotify($event)"></app-child>
```

#### 3. Dependency Injection (DI)

**Answer:** Angular injects service instances automatically instead of manually creating them. Benefits: testable, reusable, loosely coupled.

**Example:**
```typescript
@Injectable({ providedIn: "root" })
export class UserService { 
  getUsers() { 
    return ["Ali", "Sara"]; 
  } 
}

constructor(private userService: UserService) {}
```

#### 4. RxJS: Observable vs Subject vs Promise

**Answer:**
- **Observable** → async stream, lazy, cancellable
- **Subject** → Observable + Observer (multicast)
- **Promise** → eager, one-time, not cancellable

**Example:**
```typescript
const obs = new Observable(sub => sub.next("Hello"));
obs.subscribe(val => console.log(val)); // Hello

const subject = new Subject();
subject.subscribe(v => console.log("A:", v));
subject.next("Hi"); // A: Hi
```

#### 5. Data Binding Types

**Answer:** Angular provides four types of data binding for different scenarios.

**Examples:**
```typescript
// Interpolation (Component to DOM)
@Component({
  template: `<h1>{{ title }}</h1>`
})
export class AppComponent {
  title = 'Hello World';
}

// Property Binding (Component to DOM)
@Component({
  template: `<img [src]="imageUrl" [alt]="imageAlt">`
})
export class ImageComponent {
  imageUrl = 'path/to/image.jpg';
  imageAlt = 'Description';
}

// Event Binding (DOM to Component)
@Component({
  template: `<button (click)="onClick()">Click me</button>`
})
export class ButtonComponent {
  onClick() {
    console.log('Button clicked!');
  }
}

// Two-way Binding (Component ↔ DOM)
@Component({
  template: `<input [(ngModel)]="name" placeholder="Enter name">`
})
export class FormComponent {
  name = '';
}
```

#### 6. RxJS Operators

**Answer:** RxJS provides powerful operators for transforming, filtering, and combining observables.

**Examples:**
```typescript
import { map, filter, switchMap, debounceTime, distinctUntilChanged } from 'rxjs';

// Map operator
this.users$.pipe(
  map(users => users.filter(user => user.active))
).subscribe(activeUsers => {
  console.log(activeUsers);
});

// Search with debounce
this.searchControl.valueChanges.pipe(
  debounceTime(300),
  distinctUntilChanged(),
  switchMap(term => this.userService.searchUsers(term))
).subscribe(results => {
  this.searchResults = results;
});

// Combining multiple observables
combineLatest([
  this.users$,
  this.selectedUserId$
]).pipe(
  map(([users, selectedId]) => 
    users.find(user => user.id === selectedId)
  )
).subscribe(selectedUser => {
  this.selectedUser = selectedUser;
});
```

#### 7. Advanced Dependency Injection

**Answer:** Angular's DI system supports hierarchical injection, custom providers, and injection tokens.

**Examples:**
```typescript
// Injection Token
export const API_URL = new InjectionToken<string>('apiUrl');

// Custom Provider
@NgModule({
  providers: [
    { provide: API_URL, useValue: 'https://api.example.com' },
    { provide: UserService, useClass: UserService },
    { provide: 'CACHE_SIZE', useValue: 100 }
  ]
})
export class AppModule { }

// Factory Provider
export function userServiceFactory(http: HttpClient, apiUrl: string) {
  return new UserService(http, apiUrl);
}

@NgModule({
  providers: [
    {
      provide: UserService,
      useFactory: userServiceFactory,
      deps: [HttpClient, API_URL]
    }
  ]
})
export class AppModule { }

// Hierarchical Injection
@Component({
  selector: 'parent',
  providers: [UserService] // Provides to children
})
export class ParentComponent { }

@Component({
  selector: 'child'
})
export class ChildComponent {
  constructor(private userService: UserService) {
    // Gets instance from parent
  }
}
```

#### 8. Angular Modules Deep Dive

**Answer:** Modules organize Angular applications and control dependency injection scope.

**Examples:**
```typescript
// Feature Module
@NgModule({
  declarations: [UserListComponent, UserDetailComponent],
  imports: [CommonModule, UserRoutingModule],
  providers: [UserService],
  exports: [UserListComponent] // Export for other modules
})
export class UserModule { }

// Shared Module
@NgModule({
  declarations: [ButtonComponent, ModalComponent],
  imports: [CommonModule, FormsModule],
  exports: [ButtonComponent, ModalComponent, CommonModule, FormsModule]
})
export class SharedModule { }

// Lazy Loading Module
const routes: Routes = [
  {
    path: 'users',
    loadChildren: () => import('./user/user.module').then(m => m.UserModule)
  }
];
```

#### 9. Angular Forms (Reactive vs Template-driven)

**Answer:** Angular provides two approaches to forms with different use cases.

**Reactive Forms:**
```typescript
// Component
export class UserFormComponent {
  userForm = this.fb.group({
    name: ['', Validators.required],
    email: ['', [Validators.required, Validators.email]],
    age: [0, [Validators.min(18), Validators.max(100)]]
  });

  constructor(private fb: FormBuilder) {}

  onSubmit() {
    if (this.userForm.valid) {
      console.log(this.userForm.value);
    }
  }
}
```

**Template:**
```html
<form [formGroup]="userForm" (ngSubmit)="onSubmit()">
  <input formControlName="name" placeholder="Name">
  <input formControlName="email" placeholder="Email">
  <input formControlName="age" type="number" placeholder="Age">
  <button type="submit" [disabled]="userForm.invalid">Submit</button>
</form>
```

**Template-driven Forms:**
```html
<form #userForm="ngForm" (ngSubmit)="onSubmit(userForm)">
  <input name="name" ngModel required placeholder="Name">
  <input name="email" ngModel required email placeholder="Email">
  <input name="age" ngModel type="number" placeholder="Age">
  <button type="submit" [disabled]="userForm.invalid">Submit</button>
</form>
```

#### 10. Angular Testing

**Answer:** Angular provides comprehensive testing utilities for components, services, and integration testing.

**Examples:**
```typescript
// Component Testing
describe('UserComponent', () => {
  let component: UserComponent;
  let fixture: ComponentFixture<UserComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UserComponent],
      providers: [UserService]
    });
    fixture = TestBed.createComponent(UserComponent);
    component = fixture.componentInstance;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should display user name', () => {
    component.user = { name: 'John', email: 'john@example.com' };
    fixture.detectChanges();
    expect(fixture.nativeElement.querySelector('h1').textContent).toContain('John');
  });
});

// Service Testing
describe('UserService', () => {
  let service: UserService;
  let httpMock: HttpTestingController;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [UserService]
    });
    service = TestBed.inject(UserService);
    httpMock = TestBed.inject(HttpTestingController);
  });

  it('should fetch users', () => {
    const mockUsers = [{ id: 1, name: 'John' }];
    
    service.getUsers().subscribe(users => {
      expect(users).toEqual(mockUsers);
    });

    const req = httpMock.expectOne('/api/users');
    expect(req.request.method).toBe('GET');
    req.flush(mockUsers);
  });
});
```

### React

#### 1. Core Concepts & JSX

**Answer:** React is a library for building user interfaces using components and JSX (JavaScript XML).

**Examples:**
```jsx
// Functional Component with JSX
import React from 'react';

const Welcome = ({ name, age }) => {
  return (
    <div className="welcome">
      <h1>Hello, {name}!</h1>
      <p>You are {age} years old</p>
    </div>
  );
};

// Class Component
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  increment = () => {
    this.setState({ count: this.state.count + 1 });
  }

  render() {
    return (
      <div>
        <p>Count: {this.state.count}</p>
        <button onClick={this.increment}>Increment</button>
      </div>
    );
  }
}
```

#### 2. Hooks (useState, useEffect, useContext)

**Answer:** Hooks allow functional components to use state and lifecycle methods.

**Examples:**
```jsx
import React, { useState, useEffect, useContext, useReducer } from 'react';

// useState Hook
const Counter = () => {
  const [count, setCount] = useState(0);
  const [name, setName] = useState('');

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>+</button>
      <input 
        value={name} 
        onChange={(e) => setName(e.target.value)} 
        placeholder="Enter name"
      />
    </div>
  );
};

// useEffect Hook
const DataFetcher = ({ userId }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchUser = async () => {
      setLoading(true);
      try {
        const response = await fetch(`/api/users/${userId}`);
        const userData = await response.json();
        setUser(userData);
      } catch (error) {
        console.error('Error fetching user:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchUser();
  }, [userId]); // Dependency array

  if (loading) return <div>Loading...</div>;
  return <div>{user?.name}</div>;
};

// useContext Hook
const ThemeContext = React.createContext();

const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState('light');
  
  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

const ThemedButton = () => {
  const { theme, setTheme } = useContext(ThemeContext);
  
  return (
    <button 
      onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}
      className={theme}
    >
      Toggle Theme
    </button>
  );
};

// useReducer Hook
const initialState = { count: 0 };

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 };
    case 'decrement':
      return { count: state.count - 1 };
    case 'reset':
      return { count: 0 };
    default:
      throw new Error();
  }
}

const CounterWithReducer = () => {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <div>
      <p>Count: {state.count}</p>
      <button onClick={() => dispatch({ type: 'increment' })}>+</button>
      <button onClick={() => dispatch({ type: 'decrement' })}>-</button>
      <button onClick={() => dispatch({ type: 'reset' })}>Reset</button>
    </div>
  );
};
```

#### 3. State Management (Redux, Context API, Zustand)

**Answer:** Different approaches to manage application state in React applications.

**Redux Example:**
```jsx
// Redux Store
import { createStore } from 'redux';

const initialState = {
  users: [],
  loading: false,
  error: null
};

function userReducer(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_USERS_START':
      return { ...state, loading: true, error: null };
    case 'FETCH_USERS_SUCCESS':
      return { ...state, loading: false, users: action.payload };
    case 'FETCH_USERS_ERROR':
      return { ...state, loading: false, error: action.payload };
    default:
      return state;
  }
}

const store = createStore(userReducer);

// React-Redux Hooks
import { useSelector, useDispatch } from 'react-redux';

const UserList = () => {
  const { users, loading, error } = useSelector(state => state);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch({ type: 'FETCH_USERS_START' });
    fetchUsers()
      .then(users => dispatch({ type: 'FETCH_USERS_SUCCESS', payload: users }))
      .catch(error => dispatch({ type: 'FETCH_USERS_ERROR', payload: error.message }));
  }, [dispatch]);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <ul>
      {users.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
};
```

**Context API Example:**
```jsx
// Context for User Management
const UserContext = createContext();

export const UserProvider = ({ children }) => {
  const [users, setUsers] = useState([]);
  const [currentUser, setCurrentUser] = useState(null);

  const addUser = (user) => {
    setUsers(prev => [...prev, { ...user, id: Date.now() }]);
  };

  const updateUser = (id, updates) => {
    setUsers(prev => prev.map(user => 
      user.id === id ? { ...user, ...updates } : user
    ));
  };

  const deleteUser = (id) => {
    setUsers(prev => prev.filter(user => user.id !== id));
  };

  const value = {
    users,
    currentUser,
    setCurrentUser,
    addUser,
    updateUser,
    deleteUser
  };

  return (
    <UserContext.Provider value={value}>
      {children}
    </UserContext.Provider>
  );
};

export const useUsers = () => {
  const context = useContext(UserContext);
  if (!context) {
    throw new Error('useUsers must be used within UserProvider');
  }
  return context;
};
```

#### 4. Performance Optimization

**Answer:** React provides several techniques to optimize application performance.

**Examples:**
```jsx
import React, { memo, useMemo, useCallback, lazy, Suspense } from 'react';

// React.memo for preventing unnecessary re-renders
const ExpensiveComponent = memo(({ data, onUpdate }) => {
  console.log('ExpensiveComponent rendered');
  return (
    <div>
      {data.map(item => (
        <div key={item.id}>{item.name}</div>
      ))}
      <button onClick={onUpdate}>Update</button>
    </div>
  );
});

// useMemo for expensive calculations
const DataProcessor = ({ items }) => {
  const processedData = useMemo(() => {
    console.log('Processing data...');
    return items
      .filter(item => item.active)
      .sort((a, b) => a.name.localeCompare(b.name))
      .map(item => ({ ...item, processed: true }));
  }, [items]);

  return (
    <div>
      {processedData.map(item => (
        <div key={item.id}>{item.name}</div>
      ))}
    </div>
  );
};

// useCallback for stable function references
const ParentComponent = () => {
  const [count, setCount] = useState(0);
  const [items, setItems] = useState([]);

  const handleUpdate = useCallback(() => {
    setItems(prev => [...prev, { id: Date.now(), name: 'New Item' }]);
  }, []);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
      <ExpensiveComponent data={items} onUpdate={handleUpdate} />
    </div>
  );
};

// Lazy Loading Components
const LazyComponent = lazy(() => import('./HeavyComponent'));

const App = () => {
  const [showLazy, setShowLazy] = useState(false);

  return (
    <div>
      <button onClick={() => setShowLazy(true)}>
        Load Heavy Component
      </button>
      {showLazy && (
        <Suspense fallback={<div>Loading...</div>}>
          <LazyComponent />
        </Suspense>
      )}
    </div>
  );
};

// Virtual Scrolling for Large Lists
const VirtualList = ({ items, itemHeight = 50, containerHeight = 400 }) => {
  const [scrollTop, setScrollTop] = useState(0);
  
  const visibleItems = useMemo(() => {
    const startIndex = Math.floor(scrollTop / itemHeight);
    const endIndex = Math.min(
      startIndex + Math.ceil(containerHeight / itemHeight) + 1,
      items.length
    );
    
    return items.slice(startIndex, endIndex).map((item, index) => ({
      ...item,
      index: startIndex + index
    }));
  }, [items, scrollTop, itemHeight, containerHeight]);

  return (
    <div
      style={{ height: containerHeight, overflow: 'auto' }}
      onScroll={(e) => setScrollTop(e.target.scrollTop)}
    >
      <div style={{ height: items.length * itemHeight, position: 'relative' }}>
        {visibleItems.map(item => (
          <div
            key={item.id}
            style={{
              position: 'absolute',
              top: item.index * itemHeight,
              height: itemHeight,
              width: '100%'
            }}
          >
            {item.name}
          </div>
        ))}
      </div>
    </div>
  );
};
```

#### 5. React Testing

**Answer:** Testing React components using Jest and React Testing Library.

**Examples:**
```jsx
import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import Counter from './Counter';

// Component Testing
describe('Counter Component', () => {
  test('renders counter with initial value', () => {
    render(<Counter />);
    expect(screen.getByText('Count: 0')).toBeInTheDocument();
  });

  test('increments counter when button is clicked', () => {
    render(<Counter />);
    const button = screen.getByText('Increment');
    fireEvent.click(button);
    expect(screen.getByText('Count: 1')).toBeInTheDocument();
  });

  test('handles multiple clicks', () => {
    render(<Counter />);
    const button = screen.getByText('Increment');
    fireEvent.click(button);
    fireEvent.click(button);
    fireEvent.click(button);
    expect(screen.getByText('Count: 3')).toBeInTheDocument();
  });
});

// Async Testing
describe('DataFetcher Component', () => {
  test('displays loading state initially', () => {
    render(<DataFetcher userId="1" />);
    expect(screen.getByText('Loading...')).toBeInTheDocument();
  });

  test('displays user data after fetch', async () => {
    // Mock fetch
    global.fetch = jest.fn(() =>
      Promise.resolve({
        json: () => Promise.resolve({ name: 'John Doe' })
      })
    );

    render(<DataFetcher userId="1" />);
    
    await waitFor(() => {
      expect(screen.getByText('John Doe')).toBeInTheDocument();
    });
  });

  test('handles fetch error', async () => {
    global.fetch = jest.fn(() => Promise.reject(new Error('Fetch failed')));

    render(<DataFetcher userId="1" />);
    
    await waitFor(() => {
      expect(screen.getByText('Error: Fetch failed')).toBeInTheDocument();
    });
  });
});

// Custom Hook Testing
import { renderHook, act } from '@testing-library/react';
import { useCounter } from './useCounter';

describe('useCounter Hook', () => {
  test('initializes with default value', () => {
    const { result } = renderHook(() => useCounter());
    expect(result.current.count).toBe(0);
  });

  test('increments counter', () => {
    const { result } = renderHook(() => useCounter());
    
    act(() => {
      result.current.increment();
    });
    
    expect(result.current.count).toBe(1);
  });

  test('resets counter', () => {
    const { result } = renderHook(() => useCounter());
    
    act(() => {
      result.current.increment();
      result.current.increment();
    });
    
    expect(result.current.count).toBe(2);
    
    act(() => {
      result.current.reset();
    });
    
    expect(result.current.count).toBe(0);
  });
});
```

### Nuxt.js

#### 1. Core Concepts & SSR

**Answer:** Nuxt.js is a Vue.js framework that provides SSR, static site generation, and automatic routing.

**Examples:**
```vue
<!-- pages/index.vue -->
<template>
  <div>
    <h1>{{ title }}</h1>
    <p>{{ description }}</p>
    <ul>
      <li v-for="post in posts" :key="post.id">
        <NuxtLink :to="`/posts/${post.slug}`">
          {{ post.title }}
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  async asyncData({ $content }) {
    const posts = await $content('posts')
      .sortBy('createdAt', 'desc')
      .fetch()
    
    return {
      title: 'My Blog',
      description: 'Welcome to my blog',
      posts
    }
  },
  
  head() {
    return {
      title: this.title,
      meta: [
        { hid: 'description', name: 'description', content: this.description }
      ]
    }
  }
}
</script>
```

#### 2. File-based Routing

**Answer:** Nuxt.js automatically generates routes based on file structure.

**Examples:**
```
pages/
  index.vue          # /
  about.vue          # /about
  contact.vue        # /contact
  posts/
    index.vue        # /posts
    _id.vue          # /posts/:id
    _slug.vue        # /posts/:slug
  admin/
    index.vue        # /admin
    users.vue        # /admin/users
    settings.vue     # /admin/settings
```

**Dynamic Routes:**
```vue
<!-- pages/posts/_slug.vue -->
<template>
  <div>
    <h1>{{ post.title }}</h1>
    <div v-html="post.content"></div>
  </div>
</template>

<script>
export default {
  async asyncData({ params, $content }) {
    const post = await $content('posts', params.slug).fetch()
    return { post }
  },
  
  validate({ params }) {
    return /^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(params.slug)
  }
}
</script>
```

#### 3. Middleware & Plugins

**Answer:** Middleware runs before rendering pages, plugins extend Nuxt functionality.

**Examples:**
```javascript
// middleware/auth.js
export default function ({ store, redirect, route }) {
  if (!store.state.auth.loggedIn) {
    return redirect(`/login?redirect=${route.fullPath}`)
  }
}

// plugins/axios.js
export default function ({ $axios, redirect }) {
  $axios.onError(error => {
    if (error.response.status === 401) {
      redirect('/login')
    }
  })
}

// nuxt.config.js
export default {
  plugins: [
    '~/plugins/axios',
    { src: '~/plugins/vue-notifications', mode: 'client' }
  ],
  
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    '@nuxtjs/pwa'
  ],
  
  auth: {
    strategies: {
      local: {
        endpoints: {
          login: { url: '/api/auth/login', method: 'post' },
          logout: { url: '/api/auth/logout', method: 'post' },
          user: { url: '/api/auth/user', method: 'get' }
        }
      }
    }
  }
}
```

### Next.js

#### 1. Core Concepts & App Router

**Answer:** Next.js is a React framework with SSR, SSG, and file-based routing.

**Examples:**
```jsx
// app/page.js (App Router)
export default function HomePage() {
  return (
    <div>
      <h1>Welcome to Next.js</h1>
      <p>This is the home page</p>
    </div>
  )
}

// app/about/page.js
export default function AboutPage() {
  return (
    <div>
      <h1>About Us</h1>
      <p>Learn more about our company</p>
    </div>
  )
}

// app/posts/[slug]/page.js (Dynamic Route)
export default function PostPage({ params }) {
  return (
    <div>
      <h1>Post: {params.slug}</h1>
    </div>
  )
}
```

#### 2. Data Fetching (SSR, SSG, ISR)

**Answer:** Next.js provides multiple data fetching strategies for different use cases.

**Examples:**
```jsx
// Static Site Generation (SSG)
export async function getStaticProps() {
  const posts = await fetch('https://api.example.com/posts')
    .then(res => res.json())
  
  return {
    props: { posts },
    revalidate: 60 // ISR: revalidate every 60 seconds
  }
}

// Server-Side Rendering (SSR)
export async function getServerSideProps({ params, query }) {
  const post = await fetch(`https://api.example.com/posts/${params.slug}`)
    .then(res => res.json())
  
  return {
    props: { post }
  }
}

// Client-Side Data Fetching
import { useState, useEffect } from 'react'

export default function ClientSidePage() {
  const [data, setData] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetch('/api/data')
      .then(res => res.json())
      .then(data => {
        setData(data)
        setLoading(false)
      })
  }, [])

  if (loading) return <div>Loading...</div>
  return <div>{JSON.stringify(data)}</div>
}
```

#### 3. API Routes

**Answer:** Next.js allows creating API endpoints within the same project.

**Examples:**
```javascript
// app/api/users/route.js
export async function GET() {
  const users = await fetch('https://jsonplaceholder.typicode.com/users')
    .then(res => res.json())
  
  return Response.json(users)
}

export async function POST(request) {
  const body = await request.json()
  
  // Validate data
  if (!body.name || !body.email) {
    return Response.json(
      { error: 'Name and email are required' },
      { status: 400 }
    )
  }
  
  // Save user (example)
  const newUser = {
    id: Date.now(),
    name: body.name,
    email: body.email,
    createdAt: new Date().toISOString()
  }
  
  return Response.json(newUser, { status: 201 })
}

// app/api/posts/[id]/route.js
export async function GET(request, { params }) {
  const post = await fetch(`https://jsonplaceholder.typicode.com/posts/${params.id}`)
    .then(res => res.json())
  
  return Response.json(post)
}

export async function PUT(request, { params }) {
  const body = await request.json()
  
  // Update post logic
  const updatedPost = {
    id: params.id,
    ...body,
    updatedAt: new Date().toISOString()
  }
  
  return Response.json(updatedPost)
}
```

## Part 5: Python & Back-End Development

### Python Core Concepts

#### 1. Data Structures & Time Complexity

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

#### 2. Decorators

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

#### 3. Generators & Iterators

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

#### 4. Object-Oriented Programming

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
```

#### 5. Concurrency in Python

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

### Laravel

#### 1. MVC Architecture & Core Concepts

**Answer:** Laravel follows the MVC pattern with elegant syntax and powerful features for rapid development.

**Examples:**
```php
// Model (app/Models/User.php)
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class User extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'name',
        'email',
        'password',
    ];
    
    protected $hidden = [
        'password',
        'remember_token',
    ];
    
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
    
    // Relationships
    public function posts()
    {
        return $this->hasMany(Post::class);
    }
    
    public function profile()
    {
        return $this->hasOne(Profile::class);
    }
}

// Controller (app/Http/Controllers/UserController.php)
<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{
    public function index(): JsonResponse
    {
        $users = User::with('posts')->paginate(10);
        return response()->json($users);
    }
    
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
        ]);
        
        $user = User::create($validated);
        
        return response()->json($user, 201);
    }
    
    public function show(User $user): JsonResponse
    {
        return response()->json($user->load('posts'));
    }
    
    public function update(Request $request, User $user): JsonResponse
    {
        $validated = $request->validate([
            'name' => 'sometimes|string|max:255',
            'email' => 'sometimes|email|unique:users,email,' . $user->id,
        ]);
        
        $user->update($validated);
        
        return response()->json($user);
    }
    
    public function destroy(User $user): JsonResponse
    {
        $user->delete();
        return response()->json(null, 204);
    }
}

// View (resources/views/users/index.blade.php)
@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Users</h1>
    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Posts Count</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($users as $user)
            <tr>
                <td>{{ $user->name }}</td>
                <td>{{ $user->email }}</td>
                <td>{{ $user->posts_count }}</td>
                <td>
                    <a href="{{ route('users.show', $user) }}" class="btn btn-sm btn-primary">View</a>
                    <a href="{{ route('users.edit', $user) }}" class="btn btn-sm btn-secondary">Edit</a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    
    {{ $users->links() }}
</div>
@endsection
```

#### 2. Eloquent ORM & Relationships

**Answer:** Eloquent provides an elegant ActiveRecord implementation for working with databases.

**Examples:**
```php
// Basic Eloquent Usage
$users = User::all();
$user = User::find(1);
$user = User::where('email', 'john@example.com')->first();

// Creating Records
$user = User::create([
    'name' => 'John Doe',
    'email' => 'john@example.com',
    'password' => Hash::make('password')
]);

// Updating Records
$user = User::find(1);
$user->name = 'Jane Doe';
$user->save();

// Or using update
User::where('id', 1)->update(['name' => 'Jane Doe']);

// Deleting Records
$user = User::find(1);
$user->delete();

// Soft Deletes
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Model
{
    use SoftDeletes;
    
    protected $dates = ['deleted_at'];
}

// Relationships
class Post extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
    
    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }
}

class Comment extends Model
{
    public function post()
    {
        return $this->belongsTo(Post::class);
    }
    
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}

// Querying with Relationships
$posts = Post::with(['user', 'comments', 'tags'])->get();
$user = User::with('posts.comments')->find(1);

// Eager Loading
$users = User::with(['posts' => function($query) {
    $query->where('published', true);
}])->get();

// Lazy Eager Loading
$users = User::all();
$users->load('posts');

// Advanced Queries
$users = User::whereHas('posts', function($query) {
    $query->where('published', true);
})->get();

$posts = Post::whereDoesntHave('comments')->get();

// Scopes
class Post extends Model
{
    public function scopePublished($query)
    {
        return $query->where('published', true);
    }
    
    public function scopeByUser($query, $userId)
    {
        return $query->where('user_id', $userId);
    }
}

// Usage
$publishedPosts = Post::published()->get();
$userPosts = Post::byUser(1)->published()->get();
```

#### 3. Middleware & Authentication

**Answer:** Middleware provides a convenient mechanism for filtering HTTP requests entering your application.

**Examples:**
```php
// Creating Middleware
php artisan make:middleware CheckAge

// app/Http/Middleware/CheckAge.php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckAge
{
    public function handle(Request $request, Closure $next)
    {
        if ($request->age <= 200) {
            return redirect('home');
        }

        return $next($request);
    }
}

// Registering Middleware
// app/Http/Kernel.php
protected $middleware = [
    // Global middleware
];

protected $middlewareGroups = [
    'web' => [
        \App\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \App\Http\Middleware\VerifyCsrfToken::class,
    ],
    
    'api' => [
        'throttle:api',
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ],
];

protected $routeMiddleware = [
    'auth' => \App\Http\Middleware\Authenticate::class,
    'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
    'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class,
    'can' => \Illuminate\Auth\Middleware\Authorize::class,
    'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
    'password.confirm' => \Illuminate\Auth\Middleware\RequirePassword::class,
    'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class,
    'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
    'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
];

// Using Middleware
Route::get('/admin', function () {
    //
})->middleware('auth');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    });
});

// Authentication
// config/auth.php
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],
    'api' => [
        'driver' => 'sanctum',
        'provider' => 'users',
    ],
],

// Login Controller
class LoginController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->intended('/dashboard');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ]);
    }
    
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }
}

// API Authentication with Sanctum
// app/Http/Controllers/Api/AuthController.php
class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('auth-token')->plainTextToken;
            
            return response()->json([
                'user' => $user,
                'token' => $token,
            ]);
        }

        return response()->json(['message' => 'Invalid credentials'], 401);
    }
    
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out successfully']);
    }
}
```

#### 4. Laravel Testing

**Answer:** Laravel provides excellent testing support with PHPUnit and additional testing helpers.

**Examples:**
```php
// Feature Test
// tests/Feature/UserTest.php
<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;

class UserTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_create_user()
    {
        $userData = [
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ];

        $response = $this->post('/api/users', $userData);

        $response->assertStatus(201)
                ->assertJsonStructure([
                    'id',
                    'name',
                    'email',
                    'created_at',
                    'updated_at'
                ]);

        $this->assertDatabaseHas('users', [
            'email' => 'john@example.com',
        ]);
    }

    public function test_can_get_users()
    {
        User::factory()->count(3)->create();

        $response = $this->get('/api/users');

        $response->assertStatus(200)
                ->assertJsonCount(3, 'data');
    }

    public function test_can_update_user()
    {
        $user = User::factory()->create();

        $updateData = [
            'name' => 'Updated Name',
            'email' => 'updated@example.com',
        ];

        $response = $this->put("/api/users/{$user->id}", $updateData);

        $response->assertStatus(200)
                ->assertJsonFragment($updateData);

        $this->assertDatabaseHas('users', [
            'id' => $user->id,
            'name' => 'Updated Name',
        ]);
    }

    public function test_can_delete_user()
    {
        $user = User::factory()->create();

        $response = $this->delete("/api/users/{$user->id}");

        $response->assertStatus(204);

        $this->assertDatabaseMissing('users', [
            'id' => $user->id,
        ]);
    }
}

// Unit Test
// tests/Unit/UserTest.php
<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

class UserTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_has_posts()
    {
        $user = User::factory()->create();
        $post = $user->posts()->create([
            'title' => 'Test Post',
            'content' => 'Test content',
        ]);

        $this->assertTrue($user->posts->contains($post));
    }

    public function test_user_full_name_accessor()
    {
        $user = new User([
            'first_name' => 'John',
            'last_name' => 'Doe',
        ]);

        $this->assertEquals('John Doe', $user->full_name);
    }
}

// Database Testing
class DatabaseTest extends TestCase
{
    use RefreshDatabase;

    public function test_database_has_users()
    {
        User::factory()->count(5)->create();

        $this->assertDatabaseCount('users', 5);
    }

    public function test_user_soft_deletes()
    {
        $user = User::factory()->create();
        $user->delete();

        $this->assertSoftDeleted('users', [
            'id' => $user->id,
        ]);
    }
}

// API Testing
class ApiTest extends TestCase
{
    public function test_api_returns_json()
    {
        $response = $this->get('/api/users');

        $response->assertHeader('content-type', 'application/json');
    }

    public function test_api_handles_validation_errors()
    {
        $response = $this->post('/api/users', []);

        $response->assertStatus(422)
                ->assertJsonValidationErrors(['name', 'email']);
    }
}

// Testing with Authentication
class AuthenticatedTest extends TestCase
{
    public function test_authenticated_user_can_access_dashboard()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)
                        ->get('/dashboard');

        $response->assertStatus(200);
    }

    public function test_guest_cannot_access_dashboard()
    {
        $response = $this->get('/dashboard');

        $response->assertRedirect('/login');
    }
}
```

#### 5. Laravel Queues & Jobs

**Answer:** Laravel queues allow you to defer the processing of time-consuming tasks.

**Examples:**
```php
// Creating a Job
php artisan make:job SendEmailJob

// app/Jobs/SendEmailJob.php
<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class SendEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $user;
    protected $emailData;

    public function __construct($user, $emailData)
    {
        $this->user = $user;
        $this->emailData = $emailData;
    }

    public function handle()
    {
        Mail::to($this->user->email)->send(new WelcomeEmail($this->emailData));
    }
}

// Dispatching Jobs
// In a Controller
public function sendWelcomeEmail(User $user)
{
    $emailData = [
        'name' => $user->name,
        'welcome_message' => 'Welcome to our platform!',
    ];

    SendEmailJob::dispatch($user, $emailData);
    
    return response()->json(['message' => 'Email queued successfully']);
}

// Delayed Jobs
SendEmailJob::dispatch($user, $emailData)->delay(now()->addMinutes(10));

// Job Chaining
ProcessPodcast::withChain([
    new OptimizePodcast,
    new ReleasePodcast,
])->dispatch($podcast);

// Queue Configuration
// config/queue.php
'connections' => [
    'database' => [
        'driver' => 'database',
        'table' => 'jobs',
        'queue' => 'default',
        'retry_after' => 90,
    ],
    
    'redis' => [
        'driver' => 'redis',
        'connection' => 'default',
        'queue' => env('REDIS_QUEUE', 'default'),
        'retry_after' => 90,
        'block_for' => null,
    ],
],

// Running Queue Workers
php artisan queue:work
php artisan queue:work --queue=high,default
php artisan queue:work --tries=3 --timeout=60
```

### Back-End Concepts & System Design

#### 1. RESTful APIs

**Answer:** REST (Representational State Transfer) is an architectural style for designing web services using HTTP methods and status codes.

**Examples:**
```python
from flask import Flask, request, jsonify

app = Flask(__name__)

# RESTful Endpoints
@app.route('/users', methods=['GET'])
def get_users():
    # GET /users - Get all users
    return jsonify({"users": [{"id": 1, "name": "John"}, {"id": 2, "name": "Jane"}]})

@app.route('/users', methods=['POST'])
def create_user():
    # POST /users - Create new user
    data = request.get_json()
    return jsonify({"message": "User created", "user": data}), 201

@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    # GET /users/123 - Get specific user
    return jsonify({"user_id": user_id, "name": "John Doe"})

@app.route('/users/<int:user_id>', methods=['PUT'])
def update_user(user_id):
    # PUT /users/123 - Update entire user
    data = request.get_json()
    return jsonify({"message": f"User {user_id} updated", "user": data})

@app.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    # DELETE /users/123 - Delete user
    return jsonify({"message": f"User {user_id} deleted"}), 204

# HTTP Status Codes
"""
200 OK - Success
201 Created - Resource created
204 No Content - Success, no content returned
400 Bad Request - Invalid request
401 Unauthorized - Authentication required
403 Forbidden - Access denied
404 Not Found - Resource not found
500 Internal Server Error - Server error
"""
```

#### 2. Database Knowledge

**Answer:** Understanding different database types and their trade-offs is crucial for system design.

**Relational Databases (ACID):**
```python
# PostgreSQL with SQLAlchemy
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)
    email = Column(String(100), unique=True)
    posts = relationship("Post", back_populates="author")

class Post(Base):
    __tablename__ = 'posts'
    id = Column(Integer, primary_key=True)
    title = Column(String(100), nullable=False)
    content = Column(String(1000))
    author_id = Column(Integer, ForeignKey('users.id'))
    author = relationship("User", back_populates="posts")

# ACID Properties:
# Atomicity - All or nothing
# Consistency - Valid state transitions
# Isolation - Concurrent transactions don't interfere
# Durability - Committed data persists
```

**NoSQL Databases (BASE):**
```python
# MongoDB with PyMongo
from pymongo import MongoClient
from bson import ObjectId

client = MongoClient('mongodb://localhost:27017/')
db = client['blog_db']
users = db['users']

# Document structure
user_doc = {
    "_id": ObjectId(),
    "name": "John Doe",
    "email": "john@example.com",
    "posts": [
        {"title": "My First Post", "content": "Hello World!"},
        {"title": "Python Tips", "content": "Use list comprehensions"}
    ]
}

# Insert document
users.insert_one(user_doc)

# BASE Properties:
# Basically Available - System is available most of the time
# Soft state - System state may change over time
# Eventually Consistent - System will become consistent over time
```

#### 3. Authentication & Authorization

**Answer:** Authentication verifies identity, authorization controls access. Different methods serve different security needs.

**JWT Authentication:**
```python
import jwt
import datetime
from functools import wraps

SECRET_KEY = "your-secret-key"

def generate_token(user_id):
    payload = {
        'user_id': user_id,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24),
        'iat': datetime.datetime.utcnow()
    }
    return jwt.encode(payload, SECRET_KEY, algorithm='HS256')

def verify_token(token):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
        return payload['user_id']
    except jwt.ExpiredSignatureError:
        return None
    except jwt.InvalidTokenError:
        return None

def require_auth(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return {'message': 'Token missing'}, 401
        
        user_id = verify_token(token)
        if not user_id:
            return {'message': 'Invalid token'}, 401
        
        return f(user_id, *args, **kwargs)
    return decorated_function
```

#### 4. System Design Principles

**Answer:** System design involves creating scalable, reliable, and maintainable architectures.

**High-Level Architecture:**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Load Balancer │────│   Web Servers   │────│   API Gateway   │
│   (HAProxy)     │    │   (Multiple)    │    │   (Rate Limit)  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                                        │
                       ┌─────────────────┐    ┌─────────────────┐
                       │   Microservices │────│   Message Queue │
                       │   (Auth, User,  │    │   (RabbitMQ)    │
                       │    Payment)     │    └─────────────────┘
                       └─────────────────┘
                                │
                       ┌─────────────────┐    ┌─────────────────┐
                       │   Database      │────│   Cache Layer   │
                       │   (PostgreSQL)  │    │   (Redis)       │
                       └─────────────────┘    └─────────────────┘
```

**Scalability Patterns:**
```python
# Horizontal Scaling
class LoadBalancer:
    def __init__(self, servers):
        self.servers = servers
        self.current = 0
    
    def get_server(self):
        # Round-robin load balancing
        server = self.servers[self.current]
        self.current = (self.current + 1) % len(self.servers)
        return server

# Caching Strategy
class CacheManager:
    def __init__(self):
        self.cache = {}
        self.ttl = {}
    
    def get(self, key):
        if key in self.cache and time.time() < self.ttl.get(key, 0):
            return self.cache[key]
        return None
    
    def set(self, key, value, ttl_seconds=300):
        self.cache[key] = value
        self.ttl[key] = time.time() + ttl_seconds
```

## Part 6: Preparation Portals & Study Strategies

### Recommended Learning Platforms

#### 1. LeetCode
- **Focus:** Data structures and algorithms
- **Strategy:** Start with easy problems, work up to medium/hard
- **Company-specific:** Filter by target companies
- **Time Management:** Practice with time constraints

#### 2. HackerRank
- **Skills Section:** Get certified in specific technologies
- **Problem Categories:** SQL, Python, JavaScript challenges
- **Interview Prep:** Mock interviews available

#### 3. GeeksforGeeks
- **Theory:** Comprehensive explanations of CS concepts
- **Practice:** Coding problems with detailed solutions
- **Articles:** In-depth technical articles

#### 4. InterviewBit
- **Structured Learning:** Curated problem lists by topic
- **Progressive Difficulty:** Builds up complexity gradually
- **Mock Interviews:** Practice with real interview scenarios

### Study Action Plan

#### Daily Schedule (2-3 hours)
- **Hour 1:** Review core concepts (JavaScript/Python)
- **Hour 2:** Practice coding problems (LeetCode/HackerRank)
- **Hour 3:** System design or framework-specific topics

#### Weekly Focus Areas
- **Week 1:** JavaScript fundamentals + Vue.js
- **Week 2:** TypeScript + Angular
- **Week 3:** Python + Back-end concepts
- **Week 4:** System design + Mock interviews

#### Mock Interview Preparation
```python
# Practice explaining your thought process
def two_sum(nums, target):
    """
    Problem: Find two numbers that add up to target
    Approach: Use hash map for O(n) solution
    Time Complexity: O(n)
    Space Complexity: O(n)
    """
    num_map = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_map:
            return [num_map[complement], i]
        num_map[num] = i
    return []
```

### Key Success Strategies

1. **Understand the "Why":** Always explain why you chose a particular approach
2. **Think Out Loud:** Verbalize your problem-solving process
3. **Consider Edge Cases:** Always discuss edge cases and error handling
4. **Optimize Gradually:** Start with brute force, then optimize
5. **Ask Questions:** Clarify requirements before coding
6. **Practice System Design:** Draw diagrams and explain trade-offs

### System Design Interview Process

#### 1. Clarify Requirements
- **Functional Requirements:** What features does the system need?
- **Non-Functional Requirements:** Scale, performance, availability
- **Constraints:** Users, data size, latency requirements

#### 2. High-Level Design
- **Draw the main components**
- **Show data flow**
- **Identify key services**

#### 3. Deep Dive
- **Database design**
- **Caching strategy**
- **Load balancing**
- **Security considerations**

#### 4. Scale the Design
- **Horizontal vs Vertical scaling**
- **Database sharding**
- **CDN implementation**
- **Microservices architecture**

### Common System Design Questions

1. **Design a URL Shortener (like bit.ly)**
2. **Design a Chat System (like WhatsApp)**
3. **Design a Social Media Feed (like Twitter)**
4. **Design a Video Streaming Service (like YouTube)**
5. **Design a Search Engine (like Google)**
6. **Design a Ride-sharing Service (like Uber)**
7. **Design a File Storage System (like Dropbox)**
8. **Design a Notification System**

### Final Preparation Checklist

- [ ] **Core Concepts:** JavaScript, TypeScript, Python fundamentals
- [ ] **Frameworks:** Vue.js and Angular deep knowledge
- [ ] **Back-end:** APIs, databases, authentication, system design
- [ ] **Coding Practice:** 50+ LeetCode problems solved
- [ ] **System Design:** 5+ system design problems practiced
- [ ] **Mock Interviews:** 3+ mock interviews completed
- [ ] **Behavioral Prep:** STAR method for behavioral questions
- [ ] **Company Research:** Understand target company's tech stack
- [ ] **Portfolio Ready:** Recent projects and achievements prepared
- [ ] **Questions Ready:** Thoughtful questions about the role/company

---

✅ **Comprehensive interview preparation covering all major topics for senior-level positions!**

---

