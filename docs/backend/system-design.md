---
layout: default
title: System Design
permalink: /docs/backend/system-design/
redirect_from:
  - /docs/backend/system-design.html
---

# System Design

## Back-End Concepts & System Design

### 1. RESTful APIs

**Answer:** RESTful APIs follow REST principles for designing web services.

**Examples:**
```javascript
// HTTP Methods
GET    /api/users          // Get all users
GET    /api/users/1        // Get user by ID
POST   /api/users          // Create new user
PUT    /api/users/1        // Update user (full)
PATCH  /api/users/1        // Update user (partial)
DELETE /api/users/1        // Delete user

// Status Codes
200 OK                    // Success
201 Created              // Resource created
400 Bad Request          // Client error
401 Unauthorized         // Authentication required
403 Forbidden            // Access denied
404 Not Found            // Resource not found
500 Internal Server Error // Server error

// API Response Format
{
  "status": "success",
  "data": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com"
  },
  "message": "User retrieved successfully"
}

// Error Response Format
{
  "status": "error",
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "email": ["The email field is required"],
      "password": ["The password must be at least 8 characters"]
    }
  }
}
```

### 2. Database Knowledge

**Answer:** Understanding different database types and their use cases is crucial for system design.

**Relational Databases (ACID):**
```sql
-- ACID Properties
-- Atomicity: All operations succeed or all fail
-- Consistency: Database remains in valid state
-- Isolation: Concurrent transactions don't interfere
-- Durability: Committed data survives system failures

-- Example: User and Posts relationship
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Query with JOIN
SELECT u.name, p.title, p.created_at
FROM users u
JOIN posts p ON u.id = p.user_id
WHERE u.email = 'john@example.com';
```

**NoSQL Databases (BASE):**
```javascript
// MongoDB Example (Document Database)
// Basically Available, Soft state, Eventual consistency

// User Collection
{
  _id: ObjectId("507f1f77bcf86cd799439011"),
  name: "John Doe",
  email: "john@example.com",
  posts: [
    {
      title: "My First Post",
      content: "This is my first blog post",
      created_at: ISODate("2023-01-01T00:00:00Z")
    }
  ],
  created_at: ISODate("2023-01-01T00:00:00Z")
}

// Redis Example (Key-Value Store)
// Cache frequently accessed data
SET user:1 '{"name":"John","email":"john@example.com"}'
EXPIRE user:1 3600  // Expire after 1 hour

GET user:1
// Returns: {"name":"John","email":"john@example.com"}

// Caching Strategy
const getUser = async (userId) => {
  // Try cache first
  let user = await redis.get(`user:${userId}`);
  
  if (user) {
    return JSON.parse(user);
  }
  
  // If not in cache, get from database
  user = await db.users.findById(userId);
  
  // Store in cache for 1 hour
  await redis.setex(`user:${userId}`, 3600, JSON.stringify(user));
  
  return user;
};
```

### 3. Authentication & Authorization

**Answer:** Different authentication methods provide different levels of security and use cases.

**JWT (JSON Web Tokens):**
```javascript
// JWT Structure: header.payload.signature
// Example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c

// Creating JWT
const jwt = require('jsonwebtoken');

const createToken = (user) => {
  return jwt.sign(
    { 
      userId: user.id, 
      email: user.email,
      role: user.role 
    },
    process.env.JWT_SECRET,
    { expiresIn: '24h' }
  );
};

// Verifying JWT
const verifyToken = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');
  
  if (!token) {
    return res.status(401).json({ message: 'No token provided' });
  }
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    res.status(401).json({ message: 'Invalid token' });
  }
};

// OAuth 2.0 Flow
// 1. User clicks "Login with Google"
// 2. Redirect to Google OAuth
// 3. User authorizes application
// 4. Google redirects back with authorization code
// 5. Exchange code for access token
// 6. Use access token to get user info

const oauth2Client = new google.auth.OAuth2(
  process.env.GOOGLE_CLIENT_ID,
  process.env.GOOGLE_CLIENT_SECRET,
  process.env.GOOGLE_REDIRECT_URI
);

// Session-based Authentication
const session = require('express-session');

app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: { 
    secure: process.env.NODE_ENV === 'production',
    maxAge: 24 * 60 * 60 * 1000 // 24 hours
  }
}));

// Login
app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email });
  
  if (user && await bcrypt.compare(password, user.password)) {
    req.session.userId = user.id;
    res.json({ message: 'Login successful' });
  } else {
    res.status(401).json({ message: 'Invalid credentials' });
  }
});
```

### 4. System Design Principles

**Answer:** Key principles for designing scalable, maintainable systems.

**High-Level Architecture:**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Load Balancer │────│   Web Servers   │────│   App Servers   │
│   (HAProxy)     │    │   (Nginx)       │    │   (Node.js)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │   Database      │
                       │   (PostgreSQL)  │
                       └─────────────────┘
```

**Scalability Patterns:**
```javascript
// Horizontal Scaling
// Add more servers instead of upgrading hardware

// Load Balancing
const express = require('express');
const cluster = require('cluster');
const numCPUs = require('os').cpus().length;

if (cluster.isMaster) {
  // Fork workers
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }
  
  cluster.on('exit', (worker, code, signal) => {
    console.log(`Worker ${worker.process.pid} died`);
    cluster.fork(); // Restart worker
  });
} else {
  // Worker process
  const app = express();
  app.listen(3000);
}

// Caching Strategy
const redis = require('redis');
const client = redis.createClient();

// Cache-Aside Pattern
const getCachedData = async (key) => {
  // 1. Check cache
  let data = await client.get(key);
  
  if (data) {
    return JSON.parse(data);
  }
  
  // 2. If not in cache, get from database
  data = await database.query('SELECT * FROM users WHERE id = ?', [key]);
  
  // 3. Store in cache
  await client.setex(key, 3600, JSON.stringify(data));
  
  return data;
};

// Database Sharding
// Split data across multiple databases
const getShard = (userId) => {
  return userId % 3; // 3 shards
};

const getUser = async (userId) => {
  const shard = getShard(userId);
  const db = databases[shard];
  return await db.users.findById(userId);
};
```

**Security Considerations:**
```javascript
// Input Validation
const joi = require('joi');

const userSchema = joi.object({
  name: joi.string().min(2).max(50).required(),
  email: joi.string().email().required(),
  password: joi.string().min(8).pattern(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/).required()
});

// Rate Limiting
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  message: 'Too many requests from this IP'
});

app.use('/api/', limiter);

// CORS Configuration
const cors = require('cors');

app.use(cors({
  origin: process.env.ALLOWED_ORIGINS.split(','),
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

// SQL Injection Prevention
// Use parameterized queries
const getUser = async (userId) => {
  // Good: Parameterized query
  return await db.query('SELECT * FROM users WHERE id = ?', [userId]);
  
  // Bad: String concatenation (vulnerable to SQL injection)
  // return await db.query(`SELECT * FROM users WHERE id = ${userId}`);
};
```

**Fault Tolerance:**
```javascript
// Circuit Breaker Pattern
class CircuitBreaker {
  constructor(threshold = 5, timeout = 60000) {
    this.threshold = threshold;
    this.timeout = timeout;
    this.failureCount = 0;
    this.lastFailureTime = null;
    this.state = 'CLOSED'; // CLOSED, OPEN, HALF_OPEN
  }
  
  async call(fn) {
    if (this.state === 'OPEN') {
      if (Date.now() - this.lastFailureTime > this.timeout) {
        this.state = 'HALF_OPEN';
      } else {
        throw new Error('Circuit breaker is OPEN');
      }
    }
    
    try {
      const result = await fn();
      this.onSuccess();
      return result;
    } catch (error) {
      this.onFailure();
      throw error;
    }
  }
  
  onSuccess() {
    this.failureCount = 0;
    this.state = 'CLOSED';
  }
  
  onFailure() {
    this.failureCount++;
    this.lastFailureTime = Date.now();
    
    if (this.failureCount >= this.threshold) {
      this.state = 'OPEN';
    }
  }
}

// Retry Pattern
const retry = async (fn, maxRetries = 3, delay = 1000) => {
  for (let i = 0; i < maxRetries; i++) {
    try {
      return await fn();
    } catch (error) {
      if (i === maxRetries - 1) throw error;
      await new Promise(resolve => setTimeout(resolve, delay * Math.pow(2, i)));
    }
  }
};
```

**Microservices vs Monolith:**
```javascript
// Monolithic Architecture
// Single codebase, single deployment
const express = require('express');
const app = express();

// All services in one application
app.use('/api/users', userRoutes);
app.use('/api/posts', postRoutes);
app.use('/api/comments', commentRoutes);

// Microservices Architecture
// Separate services, independent deployments

// User Service
const userService = express();
userService.use('/api/users', userRoutes);
userService.listen(3001);

// Post Service
const postService = express();
postService.use('/api/posts', postRoutes);
postService.listen(3002);

// API Gateway
const gateway = express();
gateway.use('/users', createProxyMiddleware({ target: 'http://user-service:3001' }));
gateway.use('/posts', createProxyMiddleware({ target: 'http://post-service:3002' }));
gateway.listen(3000);

// Service Communication
// HTTP/REST
const getUser = async (userId) => {
  const response = await fetch(`http://user-service:3001/api/users/${userId}`);
  return response.json();
};

// Message Queue (RabbitMQ/Redis)
const amqp = require('amqplib');

const publishMessage = async (queue, message) => {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  await channel.assertQueue(queue, { durable: true });
  channel.sendToQueue(queue, Buffer.from(JSON.stringify(message)));
  
  await channel.close();
  await connection.close();
};

const consumeMessage = async (queue, handler) => {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  await channel.assertQueue(queue, { durable: true });
  channel.consume(queue, (msg) => {
    if (msg) {
      handler(JSON.parse(msg.content.toString()));
      channel.ack(msg);
    }
  });
};
```

