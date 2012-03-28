# encoding: utf-8
#
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
User.create!(:email => "admin@oseh_shalom.org", :password => "oseh_shalom")
#User.create!(:email => "matt@scilipoti.name",   :password => "oseh_shalom")

# demo data
# TODO: need correct date

Factory.create(:event_full, :name => 'Congressional Shabbat Dinner', :start_date => '2012/09/02 06:00pm', :description => 'Join us for a congregational Shabbat Dinner before “Labor on the Bimah”')
Factory.create(:event_full, :name => 'Labor on the Bimah',           :start_date => '2012/09/02 07:30pm', :description => %(Cantor Bernhardt and Rabbi Heifetz will lead our annual observance of Labor on the Bima. This year we will
focus on the importance of organized labor and the problems faced by workers who come together to seek
dignity on the job. With laws being proposed around the country that threaten workers’ rights to bargain
collectively, we want to explore Judaism’s focus on the fair treatment of workers. As we did last Spring when
we observed the 100th anniversary of the Triangle Shirtwaist Factory Fire, we will remember the lessons of the
past, and learn how we can live up to our highest values.)
              )
Factory.create(:event_full, :name => 'Back to Shul Night', :start_date => '2012/09/09 7:30pm', :description => 'Come join us to reconnect with Chaverim and share your summer stories. More information to follow but please mark
your calendars now. Note that the time is ½ hour earlier than usual.')


hh = Factory.create(:compound_event, :name => 'High Holidays', :start_date => '2012/09/24')
#TODO: rough approximations
selihot = Factory.create(:compound_event, :name => 'Selihot', :start_date => '2012/09/24 9:30pm', :parent => hh)
Factory.create(:event_full, :name => 'Selihot Dessert & Coffee Social', :start_date => '2012/09/24 9:30pm', :parent => selihot)
Factory.create(:event_full, :name => 'Selihot Study and Discussion', :start_date => '2012/09/24 10:00pm', :parent => selihot)
Factory.create(:event_full, :name => 'Selihot Service', :start_date => '2012/09/24 11:30pm', :parent => selihot)


rosh = Factory.create(:compound_event, :name => 'Rosh Hashanah', :start_date => '2012/09/28', :parent => hh)
Factory.create(:event_full, :name => '1st Evening', :start_date => '2012/09/28 8:00pm', :parent => rosh)
Factory.create(:event_full, :name => '1st Day, Aleph Service', :start_date => '2012/09/29 8:45am', :parent => rosh)
Factory.create(:event_full, :name => "1st Day, Children's Services & Programs", :start_date => '2012/09/29 10:00am', :parent => rosh)
Factory.create(:event_full, :name => 'Tashlih (gather by palyground)', :start_date => '2012/09/29 12:30am', :parent => rosh)
Factory.create(:event_full, :name => '1st Day, Beit Service', :start_date => '2012/09/29 1:00pm', :parent => rosh)
Factory.create(:event_full, :name => '2nd Evening', :start_date => '2012/09/29 7:30pm', :parent => rosh)
Factory.create(:event_full, :name => '2nd Day', :start_date => '2012/09/30 9:00am', :parent => rosh)

yom = Factory.create(:event_full, :name => 'Yom Kippur', :start_date => '2012/10/08', :parent => hh)

#5.times { Factory :event_full }



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

def random_middle_name
  middel_name = Faker::Name.first_name
  case rand(4)
  when 0; middle_name
  when 1; nil
  else "#{middle_name[0]}." # middle initial
  end
end

5.times do
  household = Factory.create :household
  rand(6).times do
    Factory.create :person_full,
      :household_id => household.id,
      :middle_name => random_middle_name
  end
end

puts "DB cleaned & seeded."
