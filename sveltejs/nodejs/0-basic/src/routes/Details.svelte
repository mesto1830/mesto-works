<script>
  import { onMount } from "svelte";
  let url = location.href.split("/");
  let param = url[url.length - 1];
  let final = [];
  onMount(async () => {
    const result = await fetch("/api/users/details/" + param);
    final = await result.json();
  });
</script>

{#if final.users}
  <h2>{final.users}</h2>
{:else}
  <p>No Datas</p>
{/if}
