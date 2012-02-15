require 'rspec/core'
require 'rspec/core/rake_task'

namespace :spec do
  spec_prereq = Rails.configuration.generators.options[:rails][:orm] == :active_record ?  "db:test:prepare" : :noop
  task :noop do; end

  [:acceptance].each do |sub|
    desc "Run the code examples in spec/#{sub}"
    RSpec::Core::RakeTask.new(sub => spec_prereq) do |t|
      t.pattern = "./spec/#{sub}/**/*.feature"
    end
  end
end

task :spec => 'spec:acceptance'
