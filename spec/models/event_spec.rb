require 'spec_helper'

describe Event do

  describe ".household_attendee_ids" do
    it "should delete household members not in list" do
      # have 3 household members
      household = Factory :household, :family_name => "foo"
      first_person = Factory :person, :household => household
      second_person = Factory :person, :household => household
      third_person = Factory :person, :household => household

      # assign all 3
      subject.attendee_ids = household.member_ids
      # delete 2nd (or assign 1,3)
      # forms/controller send ids as strings
      subject.household_attendee_ids=[first_person.id.to_s,third_person.id]
      subject.attendees.should_not include(second_person)

    end

    it "should add new household members from the list" do
      # have 3 household members
      household = Factory :household, :family_name => "foo"
      first_person = Factory :person, :household => household
      second_person = Factory :person, :household => household
      third_person = Factory :person, :household => household

      # assign all 3
      subject.attendee_ids = household.member_ids
      # delete 2nd (or assign 1,3)
      # forms/controller send ids as strings
      subject.household_attendee_ids=[first_person.id.to_s,third_person.id]
      subject.attendees.should include(first_person)

    end

  end
end
