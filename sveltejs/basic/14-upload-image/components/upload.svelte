<script>
  let files;
</script>

<label for="images">Upload a picture:</label>
<input
	accept="image/png, image/jpeg"
	bind:files
	id="images"
	name="images"
	type="file"
/>
{#if files}
	<h2>Selected files:</h2>
  <img src="{URL.createObjectURL(files[0])}" alt="" width="100" height="100">
{/if}
