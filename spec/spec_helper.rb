ENV['RACK_ENV'] = 'test'
ENV['CODECLIMATE_REPO_TOKEN'] = '178816c233ae568d47209f11a2c2bd639d6c8d4d4597a05d0fb4eb40b5c794fd'
require 'codeclimate-test-reporter'
require 'database_cleaner'
require 'capybara/rspec'
CodeClimate::TestReporter.start

require_relative '../app/server'


Capybara.app = Sinatra::Application

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
