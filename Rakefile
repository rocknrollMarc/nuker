require "bundler/gem_tasks"

task :sample do
  sh "bin/nuker push http://localhost:4567/projects/project1 features/"
end

task :nuke do
  sh "nuker push://localhost:4567/projects/#{ARGV[0]} features/"
end
