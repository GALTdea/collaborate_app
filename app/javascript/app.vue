<template>
  <div id="app  w-100 p-3">
    
      <input style="" class="  w-98 pt-1 pl-1 pr-1 propped-challenge form-control" type="text" v-model="challenge.title"
      placeholder=""
       />
    
   
    <AddEntry v-on:add-entry="addEntry" />
    <Challenge v-bind:challenge="challenge"  />
   
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

  props: ['mytitle'] ,

  data(){
      return {
        challenge:{
            title: this.mytitle,
            entries_attributes: [ ]
          }
        }

      
      
  },

  

  
  methods: {

    // updateTitle: function() {
    //   this.challenge.title = 'updated'
      
    //   console.log(this.$el.textContent)  // =>'not updated'
    //   this.$nextTick(function () {
    //     console.log(this.$el.textContent) // => 'updated'
    //   })
    // },

    addEntry: function(newEntry) {
      
        
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

input:focus, input.form-control:focus {

    outline:none !important;
    outline-width: 0 !important;
    box-shadow: none;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
}



.propped-challenge {
    width: 100% !important;
    /*margin-left: .25rem;*/
    /*margin-top : .5rem;*/
   

}


.msg-btn{
    border: none !important;
    margin-top: 2em;
    margin-bottom: 0px;
}
.msg-btn:hover{
    border: none !important;
    margin-top: 2em;
    background-color: rgba(0, 0, 0, 0.03) !important;
    color: grey;

}


</style>







