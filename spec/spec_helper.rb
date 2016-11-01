ENV['RAILS_ENV'] ||= 'test'
# Rails 4.1.0.rc1 and StateMachine don't play nice

require 'state_machine/version'
require 'state_machine'

unless StateMachine::VERSION == '1.2.0'
  # If you see this message, please test removing this file
  # If it's still required, please bump up the version above
  Rails.logger.warn "Please remove me, StateMachine version has changed"
end

module StateMachine::Integrations::ActiveModel
  alias_method :around_validation_protected, :around_validation
  def around_validation(*args, &block)
    around_validation_protected(*args, &block)
  end
end

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'dotenv'
Dotenv.load

require 'rspec/rails'
require 'rspec/its'
require 'ffaker'
require 'factory_girl'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara/rails'
require 'shoulda/matchers'

require 'spree/testing_support/preferences'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/factories'
require 'factories/avalara_factories'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include Spree::TestingSupport::Preferences
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::AuthorizationHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.include FactoryGirl::Syntax::Methods

  config.mock_with :rspec

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end

  require 'support/config_avatax_preferences'
end
