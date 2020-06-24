<template>
  <div class>
    <div class="tabs is-centered">
      <div class="columns">
        <div class="column">
          <ul>
            <li class="is-active">
              <a>All</a>
            </li>
            <li>
              <a>In progress</a>
            </li>
            <li>
              <a>Completed</a>
            </li>
          </ul>
          <div v-for="item in items" :key=item.id class="card">
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
              <a href="#" class="card-footer-item">Delete</a>
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
      items: []
    };
  },
  created: function() {
    let self = this
    axios
      .get("/items.json")
      .then(function(response) {
        self.items = response.data;
        console.log(response);
        console.log('data')
        console.log(self.items)
      })
      .catch(function(error) {
        console.log(error);
      })
      .then(function() {
        // always executed
      });
  }
};
</script>

<style scoped>
@import "bulma/css/bulma.min.css";
</style>
