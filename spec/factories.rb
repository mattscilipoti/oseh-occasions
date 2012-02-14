# Conventions
# ===============
#
# Factories named after the model should be
# the minimal required to create a valid model.
# More complex factories need clarifying names (:user_with_x)
#
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name  { Faker::Name.last_name }
  end
end

