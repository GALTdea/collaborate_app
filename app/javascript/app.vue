<template>
  <div id="app">
    <input class="form-control form-control-lg mt-5" type="text" v-model="message.title" />
    <br>
    <br>
    <AddEntry v-on:add-entry="addEntry" />
    <Message v-bind:message="message"  />
    <br>
    <button class="btn form-control btn-outline-secondary btn-block msg-btn" v-on:click="saveMessage">Save Message </button>
  </div>
</template>

<script>
import Message from 'Message';
import AddEntry from 'AddEntry';
// import VueResource from "vue-resource";

export default {
  name: 'app',

  components: {
    Message,
    AddEntry,
  },

  data(){
      return {
        message: {
          title: '',
          entries_attributes: [ ]
        }

      }
      console.log(message)
  },

  methods: {
    addEntry: function(newEntry) {
      const { entry } = newEntry;
        
        this.message.entries_attributes.push( newEntry)
        
      },
    
    saveMessage: function(){
      // const { message } = newMessage;
      this.$http.post('/messages', { message: this.message }).then(response => {
        Turbolinks.visit(`messages/${response.body.id}`)
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







