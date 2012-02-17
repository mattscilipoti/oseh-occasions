# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'
DatabaseCleaner.clean_with :truncation

# demo data
Factory :event_full, :name => 'High Holidays'
5.times { Factory :event_full }


Factory :person_full,
        :full_name  => "Linda Solomon",
        :main_email => 'ls@example.com'

Factory :person_full,
        :full_name => "Cynthia Elizabeth"

49.times do
  Factory :person_full
end

puts "DB cleaned & seeded."
