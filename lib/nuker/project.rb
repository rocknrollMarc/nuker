module Nuker 
  class Project
    include MongoMapper::Document

    key :name, String
    many :features, :class => Nuker::Feature
  end
end
