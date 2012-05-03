#!/usr/bin/env rake
require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
rescue LoadError
  puts "RSpec tasks are unavailable."
end

task :default => :spec

desc "Run test app"
task :testapp do
  require "rack"
  Rack::Server.start :config => File.expand_path("./spec/support/pretty_json.ru", File.dirname(__FILE__))
end
