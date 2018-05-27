# Album Manager API

* This is an API to manager your Albums, to go along with the [Album Manager UI](https://github.com/scottalexandra/logikull-code-challenge-ui)
* It's built using Rails with a Postgres database
* Ruby version
 `2.3.1`

## Up and Running

* Clone this repo
* `bundle install`

* Database setup
  * If you don't have Postgres setup, follow these instructions [here](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04)
  * setup your database username and password
    * `cp config/application.example.yml config/application.yml`
    * Replace the expample username and password with your database username and password
  * `rake db:setup`
  * `rake db: migrate`

* Run the tests
  `rspec`
* Start the server
  `rails s`
