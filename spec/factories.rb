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

  factory :member_full, :parent => :member do |f|
    f.middle_name {
      middle_name = Faker::Name.first_name
      case rand(4)
      when 0; middle_name
      when 1; nil
      else "#{middle_name[0]}." # middle initial
      end
    }
    f.main_phone  { Faker::PhoneNumber.phone_number }
    f.main_email  {|member| "#{member.full_name.parameterize}@example.com" }
  end
end

