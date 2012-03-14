require 'spec_helper'

describe Person do
  describe '.full_name=' do
    {'Linda Solomon' => { :first_name => 'Linda', :last_name => 'Solomon' }
    }.each do |full_name, parts|
      it "should parse the name parts from #{full_name}" do
        subject.full_name = full_name
        parts.each do |column_name, expected_value|
          subject.send(column_name).should == expected_value
        end
      end
    end
  end
end
