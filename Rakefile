require "sinatra/activerecord/rake"
require "rake/testtask"

namespace :db do
  task :load_config do
    require "./app"
  end
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
end
task :default => :test
