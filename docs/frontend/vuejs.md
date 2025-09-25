---
layout: default
title: Vue.js
permalink: /docs/frontend/vuejs/
redirect_from:
  - /docs/frontend/vuejs.html
---

# Vue.js

## Core Concepts

### 1. Reactivity System

**Answer:** Vue 2 uses `Object.defineProperty`, Vue 3 uses `Proxy` → better performance.

**Example:**
```javascript
const state = Vue.reactive({ count: 0 });
state.count++; // automatically tracked
```

### 2. Lifecycle Hooks (Detailed)

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

### 3. State Management (Vuex/Pinia)

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

### 4. Directives

**Answer:** `v-if` removes/adds from DOM, `v-show` just toggles CSS.

**Example:**
```html
<p v-if="visible">Shown if true</p>
<p v-show="visible">Always in DOM, just hidden</p>
```

### 5. Vue Router

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

### 6. Vue 3 Composition API

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

### 7. Performance Optimizations

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

### 8. Custom Directives

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

### 9. Mixins vs Composables

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

---

**Next:** [Angular](angular.md) | [React](react.md) | [JavaScript & TypeScript](javascript-typescript.md)
