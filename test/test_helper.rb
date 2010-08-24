ENV["RAILS_ENV"] = "test"

# note: there's a test rails application in test/rails_root to test the gem plugin with
require File.expand_path(File.dirname(__FILE__) + "/rails_root/config/environment")

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'selenium_on_rails/suite_renderer'
require 'selenium_on_rails/fixture_loader'
require 'selenium_helper'
require File.expand_path(File.dirname(__FILE__) + "/../app/controllers/selenium_controller")
require File.expand_path(File.dirname(__FILE__) + "/../config/routes")
require 'action_controller/test_process'

require 'mocha/api'
require 'mocha/parameter_matchers'
require 'mocha/integration/test_unit/ruby_version_186_and_above'

class SeleniumController
  attr_accessor :layout_override
  # Re-raise errors caught by the controller.
  def rescue_action e
    raise e
  end
      
  def render options = nil
    if override_layout? options
      options[:layout] = false
      super options
      return response.body = @layout_override.gsub('@content_for_layout', response.body)
    end
    super options
  end
  
  private
    def override_layout? options
      return false unless @layout_override
      if options[:action] or options[:template]
        options[:layout] != false #for action and template the default layout is used if not explicitly disabled
      else
        not [nil, false].include? options[:layout] #otherwise a layout has to be specified
      end
    end

end

class Test::Unit::TestCase
# mocha is included via bundler in the test rails application
# for some reason this stops essential modules from being loaded
# TODO investigate for cleaner solution, maybe in mocha itself
  include Mocha::API
  include Mocha::ParameterMatchers
  include Mocha::Integration::TestUnit::RubyVersion186AndAbove

  def assert_text_equal expected, actual
    assert_equal clean_text(expected), clean_text(actual)
  end
  
  def clean_text text
    text.gsub("\t", '  ').gsub("\r", '').gsub("\n", '').gsub(/ *</, '<')
  end
end

module SeleniumOnRails::PathsTestHelper
  def selenium_tests_path
    File.expand_path(File.dirname(__FILE__) + '/../test_data')
  end
end

class TestView < ActionView::Base
  include SeleniumOnRails::PartialsSupport
end
