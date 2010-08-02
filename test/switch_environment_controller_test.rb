require File.dirname(__FILE__) + '/test_helper'

class SwitchEnvironmentControllerTest < ActionController::TestCase

  tests SwitchEnvironmentController 

  def setup
    @config = mock()
    #setup_controller_test(SwitchEnvironmentController)
  end
  
  def test_index
    SeleniumOnRailsConfig.expects(:get).with(:environments).at_least_once.returns(["hello", "dolly"])
    get :index
    assert @response.body.include?('hello, dolly')
  end
end
