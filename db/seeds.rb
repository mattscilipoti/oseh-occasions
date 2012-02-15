# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'
DatabaseCleaner.clean_with :truncation

Factory :member_full,
  :full_name => "Linda Solomon",
  :main_email => 'lksolomon@comcast.net'

49.times do
  Factory :member_full
end

puts "DB cleaned & seeded."
