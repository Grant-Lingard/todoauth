#You may copy and paste from this file

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#Use Spec DSL
require 'minitest/spec'
#Use Shoulda
require 'shoulda/matchers'
require 'capybara/rails'
require 'mocha/minitest'

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

# Shoulda::Matchers.configure do |config|
#   config.integrate do |with|
#     with.test_framework :minitest
#     with.library :rails
#   end
# end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  extend Minitest::Spec::DSL
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include AuthenticationMacros
  before(:each)  {reset_login}  
end


