---
layout: default
title: Laravel
permalink: /docs/backend/laravel/
redirect_from:
  - /docs/backend/laravel.html
---

# Laravel

## MVC Architecture & Core Concepts

### 1. MVC Architecture & Core Concepts

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

### 2. Eloquent ORM & Relationships

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

### 3. Middleware & Authentication

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

### 4. Laravel Testing

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

### 5. Laravel Queues & Jobs

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

