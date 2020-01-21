<template >
  <div class="challenge-form overflow-auto">
    <div v-bind:key="entry.id" v-for="entry in dailyPost.entries_attributes"  >
      <div class="listing-page overflow-auto">
        <ol class="mt-3 ">
          <li >
            <span class="listing" >{{entry.title}}</span>
          </li>
        </ol>
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

  

  props: [ "entry", "dailyPost"],

  methods: {

    consoleLog: function(){
      
    }
    
  }

}
</script>

<style scoped>
  .listing{
    font-size: 1em;
  }

  

  
</style>

