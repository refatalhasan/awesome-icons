<script>
  let name = "World";
  let count = 0;
  let todos = [];
  let newTodo = "";
  
  function handleClick() {
    count += 1;
  }

  function addTodo() {
    todos = [...todos, newTodo];
    newTodo = "";
  }

  function removeTodo(index) {
    todos = todos.filter((_, i) => i !== index);
  }
  
  $: doubled = count * 2;
</script>

<h1>Hello {name}!</h1>
<button on:click={handleClick}>Clicks: {count}</button>
<p>Doubled: {doubled}</p>

<div class="todo-container">
  <input bind:value={newTodo} placeholder="Add todo">
  <button on:click={addTodo}>Add</button>
  
  <ul>
    {#each todos as todo, i}
      <li>
        {todo}
        <button on:click={() => removeTodo(i)}>❌</button>
      </li>
    {/each}
  </ul>
</div>

<style>
  h1 {
    color: teal;
    font-family: sans-serif;
  }
  
  .todo-container {
    margin-top: 20px;
  }

  input {
    padding: 8px;
    margin-right: 8px;
  }

  ul {
    list-style: none;
    padding: 0;
  }

  li {
    display: flex;
    justify-content: space-between;
    padding: 8px;
    margin: 4px 0;
    background: #f0f0f0;
    border-radius: 4px;
  }

  button {
    padding: 8px 16px;
    background: teal;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
</style>