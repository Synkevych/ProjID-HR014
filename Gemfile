source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Materializecss - modern responsive front-end framework based on Material Design.
gem 'materialize-sass', '~> 1.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Pagination library for Rails, Sinatra, Merb, DataMapper, and more
gem 'will_paginate', '~> 3.1.0'
# A simple Rails wrapper for Google Material Icons
gem 'material_icons'
# jQuery for materialize-sass UI plagin
gem 'jquery-rails', '~> 4.4'
# Flexible authentication solution for Rails with Warden.
gem 'devise', '~> 4.7', '>= 4.7.2'
# avascript library for Gnome / Growl type non-blocking notifications. jQuery is required. 
gem 'toastr-rails', '~> 1.0', '>= 1.0.3'


# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # rspec-rails is a testing framework for Rails 5+
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  # factory_bot_rails provides integration between factory_bot and rails
  gem 'factory_bot_rails', '~> 5.2'
  # Shoulda Matchers provides RSpec-compatible one-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 4.3'
  # Extracting `assigns` and `assert_template` from ActionDispatch
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  # Nokogiri based 'have_tag' and 'with_tag' matchers for rspec 3
  gem 'rspec-html-matchers', '~> 0.9.2'
  # Set of matchers and helpers to allow you test your APIs responses like a pro.
  gem 'rspec-json_expectations', '~> 1.2'
  # Faker is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.11'

  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov', '~> 0.18.5', require: false
  # Simple console output formatter for SimpleCov
  gem 'simplecov-console', '~> 0.7.2', require: false
  # Hosted code coverage
  gem 'codecov', '~> 0.1.17', require: false
  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'database_cleaner', '~> 1.8.5'
  # Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website
  gem 'capybara'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
