# README

## develop environment

ruby: 2.6.4
> You can use [rbenv](https://github.com/rbenv/rbenv) to install ruby.

node.js: v12.10.0
yarn: 1.19.0 

### develop setup

1. install foreman
`gem install foreman`
2. install dependencies
`bundle install`
`yarn install`
3. database migration
`rails db:migrate`
4. create fake data
`rails db:seed`
5. run server
`foreman start`
6. open `localhost:3000`
You can see the index page, list 4 items

### deploy project

1. write dockerfile to dockerize this project, and push to docker registry
2. ssh into remote server
3. docker pull project-docker-full-name
4. docker run -p 8080:3000
5. open serverhost:8080

Notes: This project use sqlite currently.