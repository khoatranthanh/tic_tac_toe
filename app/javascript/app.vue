<template>
  <div id="app" class="container mt-5">
    <div class="row" v-if="!over">
      <div v-for="(cell, index) in cells" class="col-4 pl-3" v-on:click="move(index + 1)">
        <div class="card mt-3">
          <div class="card-body text-center">
            <h3>{{cell}}</h3>
          </div>
        </div>
      </div>
    </div>
    <div class="row" v-if="over">
      <div v-for="(cell, index) in cells" class="col-4 pl-3">
        <div class="card mt-3">
          <div class="card-body text-center">
            <h3>{{cell}}</h3>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <h2>You X</h2>
        <h2>Computer O</h2>
        <h2 v-if="over">
          Winner is: {{winner}}
        </h2>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      cells: [],
      over: false,
      winner: ""
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
        if(response.data.result.final == "Over") {
          this.over = true
          this.winner = response.data.result.winner
        }
      })
      .catch(e => {

      })
    }
  }
}
</script>

<style scoped>
.card {
  height: 100px;
}
</style>
