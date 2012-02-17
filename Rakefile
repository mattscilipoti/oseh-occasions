#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake/hooks'

OsehOccasions::Application.load_tasks

desc 'These are the steps that should be run whenever the db schema is changed.'
task 'db:after_schema_change' do
  if Rails.env.development?
    # TODO: add annotate
    #puts "INFO: Running 'annotate'"
    #`annotate`

    puts "INFO: Dumping schema.  Preparing test db."
    Rake::Task['db:test:prepare'].invoke
  end
end

include Rake::Hooks
# if we find ourselves wanting the "simple" migrate,
#   we should create a new task
after 'db:migrate' do
  Rake::Task['db:after_schema_change'].invoke
end

