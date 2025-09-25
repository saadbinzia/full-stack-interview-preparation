---
layout: default
title: Nuxt.js & Next.js
permalink: /docs/frontend/nuxt-nextjs/
redirect_from:
  - /docs/frontend/nuxt-nextjs.html
---

# Nuxt.js & Next.js

## Nuxt.js

### 1. Core Concepts & SSR

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

### 2. File-based Routing

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

### 3. Middleware & Plugins

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

## Next.js

### 1. Core Concepts & App Router

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

### 2. Data Fetching (SSR, SSG, ISR)

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

### 3. API Routes

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

## Performance Optimization

### 1. Image Optimization

**Answer:** Both frameworks provide built-in image optimization.

**Nuxt.js:**
```vue
<template>
  <div>
    <NuxtImg
      src="/images/hero.jpg"
      alt="Hero image"
      width="800"
      height="600"
      loading="lazy"
      placeholder
    />
  </div>
</template>
```

**Next.js:**
```jsx
import Image from 'next/image'

export default function Hero() {
  return (
    <div>
      <Image
        src="/images/hero.jpg"
        alt="Hero image"
        width={800}
        height={600}
        loading="lazy"
        placeholder="blur"
        blurDataURL="data:image/jpeg;base64,..."
      />
    </div>
  )
}
```

### 2. Code Splitting

**Answer:** Both frameworks automatically split code for optimal loading.

**Nuxt.js:**
```javascript
// nuxt.config.js
export default {
  build: {
    splitChunks: {
      layouts: true,
      pages: true,
      commons: true
    }
  }
}
```

**Next.js:**
```jsx
// Automatic code splitting
import dynamic from 'next/dynamic'

const HeavyComponent = dynamic(() => import('./HeavyComponent'), {
  loading: () => <p>Loading...</p>
})

export default function Page() {
  return <HeavyComponent />
}
```

### 3. Caching Strategies

**Answer:** Both frameworks provide various caching mechanisms.

**Nuxt.js:**
```javascript
// nuxt.config.js
export default {
  render: {
    static: {
      maxAge: 1000 * 60 * 60 * 24 * 7 // 7 days
    }
  },
  
  cache: {
    pages: ['/about', '/contact']
  }
}
```

**Next.js:**
```javascript
// next.config.js
module.exports = {
  async headers() {
    return [
      {
        source: '/api/:path*',
        headers: [
          {
            key: 'Cache-Control',
            value: 's-maxage=60, stale-while-revalidate'
          }
        ]
      }
    ]
  }
}
```

## Deployment

### 1. Vercel (Next.js)

**Answer:** Vercel provides seamless deployment for Next.js applications.

**Configuration:**
```json
// vercel.json
{
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/next"
    }
  ],
  "env": {
    "DATABASE_URL": "@database_url"
  }
}
```

### 2. Netlify (Nuxt.js)

**Answer:** Netlify provides excellent support for Nuxt.js applications.

**Configuration:**
```toml
# netlify.toml
[build]
  command = "npm run generate"
  publish = "dist"

[build.environment]
  NODE_VERSION = "18"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

---

**Next:** [Python]({{ '/docs/backend/python/' | relative_url }}) | [Laravel]({{ '/docs/backend/laravel/' | relative_url }}) | [React]({{ '/docs/frontend/react/' | relative_url }})
