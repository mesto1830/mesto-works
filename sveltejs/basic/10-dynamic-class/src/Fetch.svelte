<script>
  import { onMount } from "svelte";
  let final = [];
  onMount(async () => {
    const result = await fetch("https://jsonplaceholder.typicode.com/users");
    final = await result.json();
  });
  const writeName = (param) => {
    console.log(param)
  }
  let isGreen = true
</script>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Username</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
    {#if final}
      {#each final as item (item.id)}
        <tr>
          <td on:click={() => writeName(item.name)}>{item.name}</td>
          <td class:red={item.username === 'Bret'}>{item.username}</td>
          <td>{item.email}</td>
        </tr>
      {/each}
    {:else}
      <p>No Datas</p>
    {/if}
  </tbody>
</table>

<style>
  .red{
    color: red;
  }
</style>
