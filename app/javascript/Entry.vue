<template>
  <div class="entry-item">
    
     {{entry.title}}
     <button class="del">x</button>
    </p>
  </div>
</template>

<script>
export default {
  name: 'Entry',
  props: ["entry"],

  methods: {
    addMessage: function(){
      const newMessage = {
        title: this.title,
      }
      // Send up to parent
      this.$emit('add-todo', newTodo);

      this.title = '';
    }
    }
  
}
</script>

<style scoped>
.todo-item {
    background: #f4f4f4;
    padding: 10px;
    border-bottom: 1px #ccc dotted;
  }

  .is-complete {
    text-decoration: line-through;
  }

  .del {
    background: #ff0000;
    color: #fff;
    border: none;
    padding: 5px 9px;
    border-radius: 50%;
    cursor: pointer;
    float: right;
  }
</style>

<!-- this.team.players_attributes.push({
            id: null,
            name: "", -->