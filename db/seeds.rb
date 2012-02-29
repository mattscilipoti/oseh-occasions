# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'
DatabaseCleaner.clean_with :truncation

# default admin user for rails_admin
User.create(
      :email => "admin",
      :password => "oseh_shalom"
    )

# demo data
# TODO: need correct date
hh = Factory.create(:event_full, :name => 'High Holidays')
#TODO: rough approximations
Factory.create(:event_full, :name => 'Rosh Hashanah', :start_date => hh.start_date, :parent => hh)
Factory.create(:event_full, :name => 'Yom Kippur', :start_date => hh.start_date + 10, :parent => hh)

5.times { Factory :event_full }



solomon = Factory.create :household, :family_name => 'Solomon'

Factory.create :person_full,
        :full_name  => "Linda Solomon",
        :main_email => 'ls@example.com',
        :household => solomon,
        :head_of_household => true

Factory.create :person_full,
        :full_name  => "Art Solomon",
        :main_email => 'as@example.com',
        :household => solomon,
        :head_of_household => true


Factory.create :person_full,
        :full_name => "Cynthia Elizabeth"

5.times do
  household = Factory.create :household
  rand(6).times do
    Factory.create :person_full, :household_id => household.id
  end
end

puts "DB cleaned & seeded."
