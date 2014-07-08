ruby '2.1.2'

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby



# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',        group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',      group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem "devise", ">= 3.2.3"
gem "obfuscate_id", github: "namick/obfuscate_id"
gem "requirejs-rails", github: "ptb/requirejs-rails"
gem "slim-rails", ">= 2.1.0"
gem "bootstrap-sass", ">= 3.1.1.0"
gem 'haml_coffee_assets', github: 'ptb/haml_coffee_assets', branch: 'patch-2'
gem "rabl", ">= 0.9.3"
gem "oj", ">= 2.5.5"
gem "js-routes", ">= 0.9.7"
gem "execjs", ">= 2.0.2"
group :development do
  gem "guard-bundler", ">= 2.0.0"
  gem "guard-livereload", ">= 2.1.1"
  gem "guard-rspec", ">= 4.2.8"
  gem "guard-rubocop", ">= 1.0.2"
  gem "guard-teaspoon", ">= 0.0.4"
  gem "terminal-notifier-guard", ">= 1.5.3"
  gem "rb-fsevent", ">= 0.9.4", require: false
  gem "magic_encoding", github: "prodis/magic_encoding"
end

group :development, :test do
  gem "thin", ">= 1.6.2"
  gem "rspec-rails", ">= 2.14.1"
  gem "factory_girl_rails", ">= 4.4.1"
  gem "capybara", ">= 2.2.1"
  gem "launchy", ">= 2.4.2"
  gem "selenium-webdriver", ">= 2.40.0"
  gem "poltergeist", ">= 1.5.0"
  gem 'teaspoon', github: 'ptb/teaspoon'
end

group :test do
  gem "database_cleaner", ">= 1.2.0"
  gem "shoulda-matchers", ">= 2.5.0"
  gem "simplecov", ">= 0.8.2", require: false
  gem "simplecov-vim", ">= 0.0.1"
end

group :production do
end
