require 'spec_helper'

describe Member do
  it "should parse full_name into components" do
    subject.full_name = "Mr. John Q. Public"
    subject.title.should == "Mr."
    subject.first_name.should == 'John'
    subject.middle_name.should == 'Q.'
    subject.last_name.should == 'Public'
  end

  it "should combine name parts into full_name" do
    subject.first_name = 'John'
    subject.middle_name = 'Q.'
    subject.last_name = 'Public'

    subject.full_name.should == "John Q. Public"
  end
end
