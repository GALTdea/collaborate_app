<template>
  <div class="overflow-auto" >
   <span class="timer float-right">{{ countDown }}</span> 
   <span> Entries Submited: <span class="timer ">{{ challengeCount }}</span> </span> 

      <input style="" class="  w-98 pt-1 pl-1 pr-1 propped-challenge form-control" type="text" v-model="challenge.title"
      placeholder=""
       />
      <AddEntry  v-on:add-entry="addEntry" v-on:activate-challenge="activating" />
       <Challenge class="" v-bind:challenge="challenge"  />

       <button class="  btn-outline-secondary btn-block msg-btn" v-on:click="saveChallenge">Save Challenge </button>  
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

  props: ['mytitle', 'user'] ,

  data(){
      return {
        challengeCount: 0,
        isActive: false,
        countDown : 100,
        currentUser: 2,
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
        this.challengeCount = this.challenge.entries_attributes.length
        // console.log(this.challenge.entries_attributes.length)
      },
    
    saveChallenge: function(){
     const user = this.user
      this.$http.post('/challenges', { challenge: this.challenge }).then(response => {
        // success callback 
        Turbolinks.visit(user)
        console.log(response.body.id)
      }, response => {
        // error call back goes here
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

/*.prompter1 {
    height: 400px;
    background: black; 
    position:relative;

}*/

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







