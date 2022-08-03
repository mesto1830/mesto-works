<script>
  async function addNewUser(e) {
    const formData = new FormData(e.target);
    const data = {};
    for (let field of formData) {
      const [key, value] = field;
      data[key] = value;
    }
    await fetch("http://localhost:3000/api/users/add", {
      method: "POST",
      body: JSON.stringify(data),
    }).then(() => {
      window.location.href = "/";
    });
  }
</script>

<h1>Add New User</h1>

<button on:click={addNewUser}>Add</button>
