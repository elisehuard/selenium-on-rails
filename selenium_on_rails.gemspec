# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name         = "selenium_on_rails"
  s.version      = '1.0.0'
  s.authors      = ["Eric Smith"]
  s.email        = "eric@8thlight.com"
  s.homepage     = "http://github.com/paytonrules/selenium-on-rails"
  s.summary      = "Selenium on Rails provides an easy way to test Rails application with SeleniumCore[http://www.openqa.org/selenium-core/]."
  s.description  = "Selenium on Rails provides an easy way to test Rails application with SeleniumCore[http://www.openqa.org/selenium-core/]."

  s.files        = Dir.glob("lib/**/*") +
                   Dir.glob("generators/**/*") +
		   Dir.glob("templates/**/*") +
                   Dir.glob("selenium-core/**/*") +
                   Dir.glob("config/**/*") +
                   Dir.glob("app/**/*") +
                   ['README.md', 'README', 'rails/init.rb']

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.required_rubygems_version = '>= 1.3.6'
end
