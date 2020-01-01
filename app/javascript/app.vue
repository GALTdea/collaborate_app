<template>
  <div id="app  w-100   ">
   <span class="timer float-right">{{ countDown }}</span> 
    <div class="prompter1 ">
      <input style="" class="  w-98 pt-1 pl-1 pr-1 propped-challenge form-control" type="text" v-model="challenge.title"
      placeholder=""
       />
      <AddEntry  v-on:add-entry="addEntry" v-on:activate-challenge="activating" />
      <Challenge v-bind:challenge="challenge"  />
    </div>
    <!-- <span class="prompter2 align-middle text-center" v-if="!isActive"   >
      <h1 class="prompter-h1" >click here to get started</h1>
    </span> -->
  
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
        // counter: 0,
        isActive: false,
        countDown : 100,
        challenge:{
            title: this.mytitle,
            entries_attributes: [ ]
          }
        }    
  },

  methods: {
    countDownTimer: function() {
      if(this.countDown > 0) {
          setTimeout(() => {
              this.countDown -= 1
              this.countDownTimer()
          }, 1000)
      }
    },

    activating: function(){
      this.countDownTimer()
      this.isActive = !this.isActive

    },
            

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
  },

  // created: {
          // this.countDownTimer()
  // }

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
    margin-top: 0em;
    margin-bottom: 0px;
}
.msg-btn:hover{
    border: none !important;
    margin-top: 0em;
    background-color: rgba(0, 0, 0, 0.03) !important;
    color: grey;

}

.app{
  position:relative;
}

.prompter1 {
    height: 400px;
    /*background: black; */
    position:relative;

}

.prompter2 {
    height: 6em;
    width:100%;
    background-color: rgb(206, 232, 235, .5);    
    color: rgb(06, 109, 110, .5);    
    position:absolute;
    top:0;
}


.timer{
  color: red;
}



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


/*.container{
    height: 800px;
    background-color: blue;
    z-index: 20;
}*/

</style>







