<script>
  import { onMount } from "svelte";
  let url = location.href.split('/')
  let param = url[url.length-1]
    let final = [];
    onMount(async () => {
      const result = await fetch("/api/users/edit/" + param);
      final = await result.json();
      console.log(final)
    });
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
    {#if final.users}
     <h2>{final.users}</h2>
    {:else}
      <p>No Datas</p>
    {/if}
  </tbody>
</table>