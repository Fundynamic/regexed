source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1'
gem 'dynamic_form' # allows f.error_messages
gem 'protected_attributes' # allows attr_accessible

gem 'pg', '0.15.1'

gem 'devise'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"

# jquery ui, used in tokenfield (below)
gem 'jquery-ui-rails'
gem 'underscore-rails'

# for autocomplete + tags
gem 'bootstrap_tokenfield_rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'mailgun_rails'

gem 'mailcatcher', '~> 0.6.1'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy' # for show_screenshot

  gem "webmock", "~> 1.11.0"
  gem "timecop", "~> 0.6.1"
  gem 'mocha', require: 'mocha/api'

  gem 'coveralls', require: false
  gem 'database_cleaner'

  gem 'factory_girl'

end

group :test, :development do
  gem 'faker'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
