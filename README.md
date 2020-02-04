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

## Sample commands using cURL
- Authenticate a user
  ```
    curl -X POST "http://localhost:3000/api/v1/authenticate" -H "content-type: multipart/form-data" -F "email=johndoe@example.com" -F "password=password"
  ```
  - Sample Response
  ```
    {"token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcnkiOjE1ODA5MDA4MTF9.t61eEzmJkhWwdFC9xR65B72t8p0OpldfVXXLg9vPdb0"}
  ```
- Make any calls for Vertical, Category, Courses
  ```
    curl -X GET "http://localhost:3000/api/v1/verticals" -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcnkiOjE1ODA5MDA4MTF9.t61eEzmJkhWwdFC9xR65B72t8p0OpldfVXXLg9vPdb0'
  ```
  - Sample Response
  ```
    {"verticals":[{"id":1,"name":"Health \u0026 Fitness","created_at":"2020-02-04T06:09:11.298Z","updated_at":"2020-02-04T06:09:11.298Z"},{"id":2,"name":"Business","created_at":"2020-02-04T06:09:11.306Z","updated_at":"2020-02-04T06:09:11.306Z"},{"id":3,"name":"Music","created_at":"2020-02-04T06:09:11.332Z","updated_at":"2020-02-04T06:09:11.332Z"}]}
  ```

## Questions
- How does your solution perform?
  - My solution performs well. The codebase is as minimal as I can code it. I've added enough validations and conditions to properly handle every request and to avoid invalid records in the database.

- How does your solution scale?
  - I think my solution will scale. I've used Services to execute single actions for different objects (create, update, destroy). Adding more features / extra business logic means adding more Services. I've also added concerns to used across objects requiring the same logic/validation/condition.

- What would improve next?
  - I'm thinking of improving the URLs to use UUID instead of just ID to make it more secure. And probably add proper user registration process, because right now, adding new user will require rails console to setup. Additionally, I'd like to add full test coverage of the app. Currently, only models are covered by test.
