#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "yard"

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

desc "Run test app"
task :testapp do
  require "rack"
  Rack::Server.start :config => File.expand_path("./spec/support/pretty_json.ru", File.dirname(__FILE__))
end

YARD::Rake::YardocTask.new do |t|
  t.options = %w()
end
