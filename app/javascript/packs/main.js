import Vue from 'vue/dist/vue.esm'
import Todo from '../todo.vue'
window.axios = require('axios');
// import axios from 'axios';
// import vueAxios from 'vue-axios';
// Vue.use(vueAxios,axios);


Vue.use(axios)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: { Todo }
  })
})