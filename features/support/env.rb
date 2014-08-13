$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))
ENV['RACK_ENV'] = 'test'
require "nuker"
require "fileutils"
require "capybara/cucumber"
require "rspec"
require "fakefs/spec_helpers"

Capybara.app = Sinatra::Application

After do
  Nuker::Project.delete_all
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :selenium_chrome

def project name
  project = Nuker::Project.first(:name => name)
  unless project
    project = Nuker::Project.create(:name => name)
  end
  project
end

def create_feature project, path, content
  project = project(project)
  feature = Nuker::Feature.new(:path => path, :gherkin => Nuker::ParsesFeatures.new.parse(content))
  project.features << feature
  project.save
end
