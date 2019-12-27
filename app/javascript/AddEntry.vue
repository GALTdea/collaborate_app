<template>
  <div class=" entry-form " >
    <form autocomplete="off" @submit.prevent="addEntry" >
        <div class="  ">
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

.entry-input {
  border-top: none !important;
  border-left: none !important;
  border-right: none !important;
  border-bottom: 2px solid grey;

  padding-bottom: 0px !important;
  padding-top: 0px !important;

  border-radius: 0;
  
  width: 100% !important;
  outline: none;
  /*opacity: 1.0;*/
  /*font-weight: 100;*/
  
}


.entry-input:focus {
  border-top: none !important;
  border-left: none !important;
  border-right: none !important;
  border-bottom: 2px solid grey;
  width: 100% !important;
  padding-bottom: 0px !important;
  padding-top: 0px !important;
  
  outline: none !important;
  /*opacity: 1.0;*/
  /*font-weight: 100;*/

  transition: none !important;
  
}


</style>

<!-- this.team.players_attributes.push({
            id: null,
            name: "", -->