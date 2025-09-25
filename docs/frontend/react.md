---
layout: default
title: React
permalink: /docs/frontend/react/
redirect_from:
  - /docs/frontend/react.html
---

# React

## Core Concepts & JSX

### 1. Core Concepts & JSX

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

### 2. Hooks (useState, useEffect, useContext)

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

### 3. State Management (Redux, Context API, Zustand)

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

### 4. Performance Optimization

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

### 5. React Testing

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

---

**Next:** [Nuxt.js & Next.js](nuxt-nextjs.md) | [Angular](angular.md) | [Vue.js](vuejs.md)
