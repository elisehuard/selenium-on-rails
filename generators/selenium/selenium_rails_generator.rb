class SeleniumRailsGenerator < Rails::Generator::Base

  def create_tasks(m = self)
    copy_template 'test_acceptance.rake', 'lib/tasks/test_acceptance.rake'
  end

  def create_template(m = self)
    copy_template 'selenium.yml.example', 'config/selenium.yml'
  end

  def copy_template(source, destination)
    src = File.open(File.join(self.source_root,source),'r').read
    File.open(destination,'w') {|f| f.write(src) }
  end

  def banner
    "Usage: #{$0} selenium-rails"
  end

  def manifest
    record do |m|
      create_tasks
      create_template
    end
  end

  def generate
    create_tasks
    create_template
  end

  def self.gem_root
    File.expand_path('../../../', __FILE__)
  end

  def self.source_root
    File.join(gem_root, 'templates')
  end

  def source_root
    self.class.source_root
  end

end
