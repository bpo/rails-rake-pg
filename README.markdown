# rails-rake-pg #

This little gem will build a local postgresql database for you from your Rails
database config.

## Installation ##

In your `Gemfile`:

    gem 'rails-rake-pg', group: ['development', 'test']

## Use ##

To build a local postgresql cluster:

    rake db:cluster:create

Username and password will be taken `config/database.yml` for the current Rails
environment. 

To run your cluster:

    rake db:cluster:run
