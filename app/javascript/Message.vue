<template>
  <!-- had add an additional parent div to debog  -->
  <div>
    <div v-bind:key="entry.id" v-for="entry in message.entries_attributes"  >
      <!-- <Entry v-bind:entry="entry" /> -->
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
  name: 'Message',
  
  components: {
    Entry,
  },

  

  props: [ "entry", "message"],

  methods: {

    consoleLog: function(){
      console.log(message)
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

