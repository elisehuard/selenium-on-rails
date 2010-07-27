# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name         = "selenium-on-rails"
  s.version      = '1.0.0'
  s.authors      = ["Eric Smith"]
  s.email        = "eric@8thlight.com"
  s.homepage     = "http://github.com/paytonrules/selenium-on-rails"
  s.summary      = "Selenium on Rails provides an easy way to test Rails application with SeleniumCore[http://www.openqa.org/selenium-core/]."
  s.description  = "Selenium on Rails provides an easy way to test Rails application with SeleniumCore[http://www.openqa.org/selenium-core/]."

  s.files        = Dir.glob("{lib,generators,templates}/**/*") +
	           ['README.md', 'README']
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.required_rubygems_version = '>= 1.3.6'
end
