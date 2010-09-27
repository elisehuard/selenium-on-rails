  Rails::Application.routes.draw do |map|
     match 'selenium/setup', :to => 'selenium#setup'
     match 'selenium/tests/*testname', :to => 'selenium#test_file'
     match 'selenium/postResults', :to => 'selenium#record'
     match 'selenium/postResults/:logFile', :to => 'selenium#record', :requirements => { :logFile => /.*/ }
     match 'selenium/*filename', :to => 'selenium#support_file'
     match 'switch_environment', :to => 'switch_environment#index'  
  end
