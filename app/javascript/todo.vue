<template>
  <div class>
    <div class="tabs is-centered">
      <div class="columns">
        <div class="column">
          <ul>
            <li class="is-active">
              <a @click="fetchAllItems">All</a>
            </li>
            <li>
              <a @click="filterInProgress">In progress</a>
            </li>
            <li>
              <a>Completed</a>
            </li>
          </ul>

          <!-- new -->

          <div class="card">
            <header class="card-header">
              <h1>New item</h1>
            </header>
            <div class="card-content">
              <p class="control">Title: 
              <input v-model="newItem.title" class="input" type="text" placeholder="title">
              </p>
              <p class="control">Comment: 
              <input v-model="newItem.comment" class="input" type="text" placeholder="comment">
              </p>
              <p>deadline_at: 
                <input v-model="newItem.deadline_at" class="input" type="text" placeholder="comment">
              </p>
            </div>
            <footer class="card-footer">
              <button @click="saveNewItem" href="#" class="card-footer-item is-primary">Save</button>
              <button @click="clearNewItem" href="#" class="card-footer-item is-light">Clear</button>
            </footer>
          </div>

          <!-- list -->
          <div v-for="item in filterItems" :key=item.id class="card">
            <header class="card-header">
              <p class="card-header-title">{{item.title}}</p>
              <a href="#" class="card-header-icon" aria-label="more options">
                <span class="icon">
                  <i class="fas fa-angle-down" aria-hidden="true"></i>
                </span>
              </a>
            </header>
            <div class="card-content">
              <div class="content">
                comment: {{item.comment}}
              </div>
              <p>star: {{item.star}}</p>
              <p>created_at: {{item.created_at}}</p>
              <p>completed_at: {{item.completed_at}}</p>
              <p>deadline_at: {{item.deadline_at}}</p>
              <p>updated_at: {{item.updated_at}}</p>
            </div>
            <footer class="card-footer">
              <a href="#" class="card-footer-item">Edit</a>
              <a @click="deleteItem(item.id)" class="card-footer-item">Delete</a>
            </footer>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import "axios";
export default {
  data: function() {
    return {
      items: [],
      filterItems: [],
      newItem: {
        comment: 'new comment',
        deadline_at: '2020-06-30T07:07:23.613Z',
        title: ''
      }
    };
  },
  created: function() {
    this.fetchAllItems()
  },
  methods: {
    filterInProgress(){
      this.filterItems = this.items.filter(item => item.completed_at === null);
    },
    fetchAllItems(){
      let self = this
      axios
        .get("/items.json")
        .then(function(response) {
          self.items = response.data;
          self.items.map(item => {
            return {
              id: item.id,
              comment: item.comment,
              completed_at: Date.parse(item.completed_at),
              star: item.star,
              title: item.title,
              created_at: Date.parse(item.created_at),
            }
          })
          console.log(self.items)
          self.filterItems = self.items
        })
        .catch(function(error) {
          console.log(error);
        })
        .then(function() {
          // always executed
        });
    },
    saveNewItem(){
      let self = this
      axios
        .post("/items", this.newItem)
        .then(function(response) {
          self.items = response.data;
          self.clearNewItem()
          self.fetchAllItems()
        })
        .catch(function(error) {
          console.log(error);
        })
        .then(function() {
          // always executed
        });
    },
    clearNewItem(){
      this.newItem = {title: '', comment: '', deadline_at: ''}
    },
    deleteItem(id){
      let self = this
      const url = `/items/${id}/`
      axios
        .delete(url)
        .then(function(response) {
          self.fetchAllItems()
        })
        .catch(function(error) {
          self.fetchAllItems()
        })
        .then(function() {
          // always executed
        });
    }
  }
};
</script>

<style scoped>
@import "bulma/css/bulma.min.css";
</style>
