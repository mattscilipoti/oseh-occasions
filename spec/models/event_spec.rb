require 'spec_helper'

describe Event do
  
  describe ".household_attendee_ids" do
    it "should delete household members not in list" do
      # have 3 household members
      household = Factory :household, :family_name => "foo"
      first_person = Factory :person, :household => household
      second_person = Factory :person, :household => household
      third_person = Factory :person, :household => household
     ap "hm=#{household.member_ids}"
     ap "h=#{household.inspect}"
      # assign all 3
      subject.attendee_ids = household.member_ids
      # delete 2nd (or assign 1,3)
      subject.household_attendee_ids=[first_person.id,third_person.id]
      subject.attendees.should_not include(second_person)
      
    end
  end
end
