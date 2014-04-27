source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

gem 'rails-api'
gem 'sqlite3'
gem 'devise'
gem 'pundit'
gem 'aes', '~> 0.5.0'

group :development do
  gem 'thin'
  gem 'rack-cors', :require => 'rack/cors'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner'
end

ruby "2.1.1" #for rvm / heroku

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
