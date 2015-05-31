# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

require 'capybara/rails'
require 'capybara/rspec'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods

end

# load factories
FactoryGirl.reload

Capybara.current_driver = :webkit

# allow connection to localhost
WebMock.disable_net_connect!(allow_localhost: true)

def show_screenshot
  path = File.join(Rails.root, "tmp/screenshot-#{Time.now.to_f}.png")
  if is_capybara_poltergeist_driver?
    page.driver.resize(1024, 1536)
    page.driver.render(path, full: true)
    Launchy.open("file://#{path}")
  elsif is_capybara_webkit_driver?
    page.driver.save_screenshot(path)
    Launchy.open("file://#{path}")
  else
    save_and_open_page
  end
end

def save_screenshot(file_name)
  target_location = File.join(Capybara.save_and_open_page_path, file_name)
  if is_capybara_poltergeist_driver?
    page.driver.render(target_location, full: true)
  elsif is_capybara_webkit_driver?
    page.driver.save_screenshot(path)
  else
    puts "save_screenshot not implemented yet for javascript driver #{Capybara.javascript_driver}"
  end
end
