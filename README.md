# README

Generated with command

`rails new books-rails-benchmark -T --database=postgresql --javascript=esbuild --css tailwind`

For socket updates you have to run

`bundle exec rake solid_queue:start`

Ruby version: 3.3.0
Rails 7.1.3

This is simple project to try out the new Rails 7 features such as Hotwire, Stimulus, and Websockets streaming. Project contains a simple CRUD for books and authors.

For search functionality, I used Ransack gem and all views using Hotwire Turbo, Stimulus, and Tailwind CSS. Both views subscribe to the same stream and update in real-time when a new book and author is created.

To run the project in development, you need to have Ruby 3.3.0 and Postgres installed. After cloning the project, run the following commands:

```bash
bundle install
yarn install
rails db:create db:migrate db:seed
bin/dev
```


https://github.com/tomkra/books-rails-benchmark/assets/9742214/a220772a-be3c-406b-8a26-e0f530d1ee50

