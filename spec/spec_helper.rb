# frozen_string_literal: true

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

require 'factory_bot_rails'
require 'helpers'
require 'knapsack'
require 'webmock/rspec'
require 'shoulda/matchers'
require 'capybara/rspec'

Knapsack.tracker.config(enable_time_offset_warning: false)
Knapsack::Adapters::RSpecAdapter.bind

FactoryBot.factories.clear
FactoryBot.reload

Rails.root.glob('spec/support/**/*.rb').each { |file| require file }

Capybara.register_driver :chrome do |app|
  args = %w[no-sandbox disable-gpu disable-dev-shm-usage]
  args << (ENV['HEADLESS'] == 'true' ? 'headless' : 'non-headless')
  options = Selenium::WebDriver::Chrome::Options.new(args:)
  Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
end

Capybara.configure do |config|
  config.javascript_driver = :chrome
  config.always_include_port = true
  config.default_max_wait_time = 10
  config.default_normalize_ws = true
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include Helpers
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Capybara::RSpecMatchers, type: :component
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::IntegrationHelpers, type: :feature

  config.before do
    ActionMailer::Base.deliveries.clear
  end

  config.before(:each, type: :system) do
    driven_by(:chrome)
  end
end
