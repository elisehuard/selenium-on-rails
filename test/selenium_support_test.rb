require File.expand_path('../test_helper',__FILE__)

class SeleniumSupportTest < ActionController::TestCase  
  tests SeleniumController

  def setup
    @controller.extend(SeleniumOnRails::PathsTestHelper)
  end
  
  def test_route
    get :support_file, :filename => 'TestRunner.html' #initialize the controller
    assert_equal 'http://test.host/selenium/TestRunner.html', 
        @controller.url_for(:controller => 'selenium', :action => 'support_file', :filename => 'TestRunner.html')
  end
  
  def test_test_runner_existance
    get :support_file, :filename => 'TestRunner.html'
    assert_response :success
    assert @response.body.include?('Selenium')
  end
  
  def test_default_file
    get :support_file, :filename => ''
    assert_redirected_to :filename => 'TestRunner.html', :test => 'tests'
  end
    
  def test_missing_file
    get :support_file, :filename => 'missing.html'
    assert_response 404
    assert_equal 'Not found', @response.body
  end
     
end
