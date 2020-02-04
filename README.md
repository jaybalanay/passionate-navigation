# Coding Challenge 'Passionate Navigation'

## Stack
- Rails 6.0
- Ruby 2.6
- Postgres
- Puma
- Devise
- JWT

## Setup (assuming your local machine is already setup with rails/ruby)
- Clone this repository
  ```
    git clone git@github.com:jaybalanay/passionate-navigation.git
  ```
- Go to your cloned directory
  ```
    cd passionate-navigation
  ```
- Install gems listed in Gemfile
  ```
    bundle install
  ```
- Setup your database
  ```
    bundle exec rake db:setup
  ```
  OR
  ```
    bundle exec rake db:create db:migrate db:seed
  ```
- Verify that the seed file executed properly (Vertical.count should result to an integer not equal to 0)
  ```
    bundle exec rails c
    Vertical.count
  ```
- Test your app
  ```
    bundle exec rails s
  ```

## Questions
- How does your solution perform?
  - My solution performs well. The codebase is as minimal as I can code it. And I've added enough validations and conditions to properly handle every request and to avoid invalid records in the database.

- How does your solution scale?
  - I think my solution will scale. I've used Service Objects to perform single actions for different objects. Adding more features / extra business logic means adding more Service Objects.

- What would improve next?
  - I'm thinking of improving the URLs to use UUID instead of just ID to make it more secure. And probably add proper user registration process, because right now, adding new user will require rails console to setup.
