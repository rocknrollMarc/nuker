$:.unshift(File.join(File.dirname(__FILE__), "../lib"))
ENV['RACK_ENV'] = 'test'
require "rack/test"
require "fakefs/spec_helpers"
require "fileutils"
require "nuker"

before do
  ARGV.clear
  ARGV << "application-features"
end

RSpec.configure do |config|
  config.after :each do
    Nuker::Project.delete_all
  end
end

def project name
  project = Nuker::Project.first(:name => name)
  unless project
    project = Nuker::Project.create(:name => name)
  end
  project
end

def create_feature project_name, path, content
  project = project(project_name)
  feature = Nuker::Feature.new({
    :path => path,
    :gherkin => Nuker::ParsesFeatures.new.parse(content)
  })
  project.features << feature
  project.save
end
