require 'spec_helper'

describe Event do
  before :each do
    # have 3 household members
    household = Factory :household, :family_name => "foo"
    @first_person = Factory :person, :first_name => 'FIRST', :household => household
    @second_person = Factory :person, :first_name => 'SECOND', :household => household
    @third_person = Factory :person, :first_name => 'THIRD', :household => household

    # assign all 3
    subject.attendee_ids = household.member_ids
    # delete 2nd (or assign 1,3)
    # forms/controller send ids as strings
    subject.household_attendee_ids=[@first_person.id.to_s,@third_person.id]
  end

  describe ".household_attendee_ids" do
    it "should delete household members not in list" do
      subject.attendees.should_not include(@second_person)
    end

    it "should add new household members from the list" do
      subject.attendees.should =~ [@first_person, @third_person]
    end
  end
end
