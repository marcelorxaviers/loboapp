source 'https://rubygems.org'

# My gem to map the app contact to highrise entity
gem 'highrise_wrapper', '~> 0.0.9'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use postgres because heroku demands it
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Twitter bootstrap
gem "therubyracer"
gem "less-rails"
gem 'twitter-bootstrap-rails'

# Gravatar image
gem 'gravatar_image_tag'

# Turbolinks makes following links in your web application faster. 
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: 
# https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Rails forms made easy
gem 'simple_form'

# Authentication and authorization
gem 'devise'

# Environment variables
gem "figaro", ">= 0.5.3"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  # Enables STDOUT loggin in Rails 4 (needed for Heroku to interpret it)
  gem 'rails_12factor', group: :production
end

group :development do
  # Show better error messages during development
  gem 'better_errors'

  # Grab bindings from higher up the call stack and 
  # evaluate code in that context
  gem 'binding_of_caller'
end

group :test do
  # Supports testing purposes cleaning database
  gem "database_cleaner"

  # A collection of matchers for RSpec/MiniTest and Cucumber steps 
  # to make testing emails go smoothly
  gem "email_spec"
end

group :development, :test do
  # Testing framework for rails
  gem "rspec-rails"

  # Fixtures replacement with a straightforward definition syntax, 
  # support for multiple build strategies and multiple factories
  gem "factory_girl_rails"  
end