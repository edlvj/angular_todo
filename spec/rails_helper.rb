# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'simplecov'
SimpleCov.start

%w(support).each do |folder|
  Dir[Rails.root.join("spec/#{folder}/**/*.rb")].each do |component|
    require component
  end
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  Capybara.register_driver :selenium_chrome do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 300 # <= Page Load Timeout value in seconds
    Capybara::Selenium::Driver.new(app, browser: :chrome, http_client: client)
  end

  #Capybara.default_driver = :selenium_chrome
  Capybara.javascript_driver = :selenium_chrome
  # Capybara.app_host = 'http://localhost:4000'
  # Capybara.server_host = 'localhost'
  # Capybara.server_port = '4000'
  # Capybara.always_include_port = true
  # Capybara.run_server = true
  # Capybara.default_max_wait_time = 10
  #Capybara.page.driver.browser.manage.window.maximize
#  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
