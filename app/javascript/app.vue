<template>
  <div id="app">
    <input class="form-control form-control-lg mt-5" type="text" v-model="challenge.title" />
    <br>
    <br>
    <AddEntry v-on:add-entry="addEntry" />
    <Challenge v-bind:challenge="challenge"  />
    <br>
    <button class="btn form-control btn-outline-secondary btn-block msg-btn" v-on:click="saveChallenge">Save Challenge </button>
  </div>
</template>

<script>
import Challenge from 'Challenge';
import AddEntry from 'AddEntry';
// import VueResource from "vue-resource";

export default {
  name: 'app',

  components: {
    Challenge,
    AddEntry,
  },

  data(){
      return {
        challenge: {
          title: '',
          entries_attributes: [ ]
        }

      }
      console.log(challenge)
  },

  methods: {
    addEntry: function(newEntry) {
      const { entry } = newEntry;
        
        this.challenge.entries_attributes.push( newEntry )
        
      },
    
    saveChallenge: function(){
      
      this.$http.post('/challenges', { challenge: this.challenge }).then(response => {
        Turbolinks.visit(`challenges/${response.body.id}`)
      }, response => {
        console.log(response)
      })

    }
  }
}
</script>

<style >
.msg-btn{
  margin-top: 5em;
}
</style>







