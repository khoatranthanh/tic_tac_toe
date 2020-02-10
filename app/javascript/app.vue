<template>
  <div id="app">
    <p v-for="(cell, index) in cells" class="cell" v-on:click="move(index + 1)">
      {{cell}}
    </p>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      cells: []
    }
  },
  created() {
    axios.get('/api/v1/boards')
    .then(response => {
      this.cells = response.data.result.board.cells
      this.$cookies.set('game', response.data.result);
    })
    .catch(e => {

    })
  },
  methods: {
    move: function(input) {
      axios.post('/api/v1/users/move', { input: input })
      .then(response => {
        this.cells = response.data.result.cells
      })
      .catch(e => {

      })
    }
  }
}
</script>

<style scoped>
#app {
  width: 300px;
}
.cell {
  width: 32%;
  display: inline-block;
  height: 30px;
  border: 1px solid #f00;
}
</style>
