<template>
  <div class="challenge-form ">
    <div v-bind:key="entry.id" v-for="entry in challenge.entries_attributes"  >
      <div class="listing-page">
        <ul class="mt-3 ml-1">
          <li>
            <span class="listing">{{entry.title}}</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import Entry from './Entry';
export default {
  name: 'Challenge',
  
  components: {
    Entry,
  },

  

  props: [ "entry", "challenge"],

  methods: {

    consoleLog: function(){
      console.log(challenge)
    }
    //   addEntry: function() {
    //     this.message.entry.push({
    //       id: null,
    //       title: "",
    //       //position: "",a
    //       // _destroy: null
    //   })
    // },
  }

}
</script>

<style scoped>
  .listing{
    font-size: 1.5em;
  }

  /*.listing-page{
    width: 70%;

    overflow-y: scroll;
    padding-bottom: 30px;

    background-color: pink;

  }*/

  
</style>

