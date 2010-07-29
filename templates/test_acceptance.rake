require 'selenium_on_rails/acceptance_test_runner'

task :test_acceptance => 'test:acceptance'
namespace :test do
  desc 'Run Selenium tests in all browsers'
  task :acceptance do
    SeleniumOnRails::AcceptanceTestRunner.new.run
  end
end
