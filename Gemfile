source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.18'

gem 'pg'
gem 'pry'
gem 'httparty'
gem 'strong_parameters'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'

group :development, :test do
  gem 'rspec-rails', '=2.14'
  gem 'factory_girl_rails', "~> 4.2.1"
  gem 'faker'
end

group :test do
	gem "rake"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.39.0"
end
# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.1'

# Use unicorn as the app server
gem 'unicorn'

group :production do
  gem 'rails_12factor'
end

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
