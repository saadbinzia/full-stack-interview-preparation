---
layout: default
title: Angular
permalink: /docs/frontend/angular/
---

# Angular

## Core Concepts & Architecture

### 1. Core Concepts & Architecture

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

### 2. Component Communication

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

### 3. Dependency Injection (DI)

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

### 4. RxJS: Observable vs Subject vs Promise

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

### 5. Data Binding Types

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

### 6. RxJS Operators

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

### 7. Advanced Dependency Injection

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

### 8. Angular Modules Deep Dive

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

### 9. Angular Forms (Reactive vs Template-driven)

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

### 10. Angular Testing

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

---

**Next:** [React](react.md) | [Vue.js](vuejs.md) | [JavaScript & TypeScript](javascript-typescript.md)
