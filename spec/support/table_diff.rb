# A simple library for use in testing to compare an actual and expected table. Compatible with Cucumber, Rspec, and Turnip
# see: https://github.com/davelyon/table_diff
require 'table_diff'

RSpec.configure do |config|
  config.include TableDiff::Turnip
end
