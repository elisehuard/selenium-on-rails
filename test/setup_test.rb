require File.dirname(__FILE__) + '/test_helper'

class SetupTest < ActionController::TestCase
  tests SeleniumController

  def setup
    @controller.extend(SeleniumOnRails::PathsTestHelper)
    SeleniumController.any_instance.stubs(:clear_tables).returns([])
    SeleniumController.any_instance.stubs(:layout_path).returns(false)
  end

  def test_session_reset
    @request.session['key'] = 'value'
    get :setup
    assert_nil session['key']
    assert_response :success
    assert_tag :content => 'The session is wiped clean.'
  end
  
  def test_session_no_reset
    @request.session['key'] = 'value'
    get :setup, :keep_session => true
    assert_equal 'value', session['key']
    assert_response :success
    assert_no_tag :content => 'The session is wiped clean.'
  end
end
