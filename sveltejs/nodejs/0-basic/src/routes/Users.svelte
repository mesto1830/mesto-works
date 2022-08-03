<script>
  import { onMount } from "svelte";
  let final = [];
  onMount(async () => {
    const result = await fetch("/api/users");
    final = await result.json();
  });
  async function addNewUser(e) {

const formData = new FormData(e.target)
const data = { };
for (let field of formData) {
    const [key, value] = field;
data[key] = value;    
}
await fetch('http://localhost:4000/api/todos/',{
    method:'POST',
body: JSON.stringify(data),
}).then(
    () => {
    window.location.href = '/';
    }
)     
}
  async function deleteTodo(param) {
    const response = await fetch("http://localhost:3000/api/users/delete", {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        id: param,
      }),
    });
    const data = await response.json();
    if (data.users) {
      console.log(data)
      // window.location.href = "/";
    }
  }
</script>

<button href="/users/add" >Add New User</button>
<table class="table table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Username</th>
      <th>Email</th>
      <th>Proccess</th>
    </tr>
  </thead>
  <tbody>
    <!-- {#if final}
      {#each final as item (item.id)}
        <tr>
          <td>{item.name}</td>
          <td>{item.username}</td>
          <td>{item.email}</td>
        </tr>
      {/each}
    {:else}
      <p>No Datas</p>
    {/if} -->

    <!-- destructer mode -->
    {#if final.users}
      {#each final.users as { name, username, email, id } (id)}
        <tr>
          <td class="col-4">{name}</td>
          <td class="col-4">{username}</td>
          <td class="col-4">{email}</td>
          <td class="col-2">
            <div
              class="btn-group"
              role="group"
              aria-label="Basic mixed styles example"
            >
              <a href="#/users/details/2" class="btn btn-primary text-light"
                >Details</a
              >
              <a href="#/users/edit/2" class="btn btn-warning">Edit</a>
              <button
                type="button"
                on:click={deleteTodo(id)}
                class="btn btn-danger btn-block">Delete</button
              >
            </div>
          </td>
        </tr>
      {/each}
    {:else}
      <p>No Datas</p>
    {/if}
  </tbody>
</table>

<style></style>
