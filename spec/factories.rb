# Conventions
# ===============
#
# Factories named after the model should be
# the minimal required to create a valid model.
# More complex factories need clarifying names (:user_with_x)
#
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :compound_event do |f|
    f.name { Faker::Lorem.words(2).join(' ') }
    f.start_date { Random.rand(90).days.from_now }
  end

  factory :event do |f|
    f.name { Faker::Lorem.words(2).join(' ') }
    f.start_date { Random.rand(90).days.from_now }
  end

  factory :event_full, :parent => :event do |f|
    f.description {|event| "DESC: #{event.name}" }
  end

  factory :household do |f|

  end

  factory :person do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name  { Faker::Name.last_name }
    f.household
  end

  factory :person_full, :parent => :person do |f|
    f.main_phone  { Faker::PhoneNumber.phone_number }
    f.main_email  {|person| "#{person.full_name.parameterize}@example.com" }
  end
end

