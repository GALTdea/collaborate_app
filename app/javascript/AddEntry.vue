<template>
  <div class=" entry-form " >
    <form autocomplete="off" @submit.prevent="addEntry" >
        <div class=" d-inline ">
          <input autofocus   class="entry-input form-control form-control" type="text"  v-model="title" name="title" placeholder="Add Entry..." autocomplete="off" >
        </div>
          <button class=" entry-btn btn btn-outline-danger btn-outline-secondary btn-sm d-inline p-2  float-right" >Add Entry</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'AddEntry',
  data() {
    return {
      title: ''
    }
  }, 


  methods: {
    addEntry: function() {
      const newEntry = {
        title: this.title,
      }
      this.$emit('add-entry', newEntry);
      this.title = ""
    }
  }
}

</script>

<style scoped>


   
.entry-btn{
    border: none !important;
}



.btn-entry{
  width: 5%;
}



</style>

<!-- this.team.players_attributes.push({
            id: null,
            name: "", -->