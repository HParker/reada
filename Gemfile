# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

gem 'autoprefixer-rails'
gem 'delayed_job_active_record'
gem 'normalize-rails'
gem 'pg'
gem 'puma'
gem 'rack-canonical-host'
gem 'rails'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'simple_form'
gem 'sprockets'
gem 'suspenders'
gem 'uglifier'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'bourbon'
gem 'feedjira', git: 'https://github.com/feedjira/feedjira.git'
gem 'feedbag'
gem 'font-awesome-rails'
gem 'miro'
gem 'kaminari'
gem 'httparty'
gem 'jquery-rails'
gem 'graphql'

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
  gem 'refills'
  gem 'annotate'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'byebug'
end

group :development, :staging do
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'vcr'
end

group :staging, :production do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end
