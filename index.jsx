import React, { useState } from "react";

// Demo component showcasing basic React features
function DemoApp() {
  const [count, setCount] = useState(0);
  const [theme, setTheme] = useState("light");
  const [users, setUsers] = useState([
    { name: "Alice", age: 30 },
    { name: "Bob", age: 25 }
  ]);
  const [input, setInput] = useState("");

  const handleThemeToggle = () => {
    setTheme(theme === "light" ? "dark" : "light");
  };

  const handleAddUser = () => {
    if (input.trim()) {
      setUsers([...users, { name: input, age: 20 }]);
      setInput("");
    }
  };

  return (
    <div className={`app ${theme}`}>
      <h1>React Demo App</h1>
      <p>Theme: {theme}</p>
      <button onClick={handleThemeToggle}>
        Toggle Theme
      </button>
      <hr />
      <h2>Counter</h2>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>
      <button onClick={() => setCount(count - 1)}>
        Decrement
      </button>
      <hr />
      <h2>Users</h2>
      <ul>
        {users.map((user, idx) => (
          <li key={idx}>
            {user.name} ({user.age})
          </li>
        ))}
      </ul>
      <input
        value={input}
        onChange={e => setInput(e.target.value)}
        placeholder="Add user name"
      />
      <button onClick={handleAddUser}>
        Add User
      </button>
      <hr />
      <footer>
        <small>Demo complete!</small>
      </footer>
    </div>
  );
}

export default DemoApp;