import Vue from 'vue/dist/vue.esm'
import Todo from '../todo.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: { Todo }
  })
})