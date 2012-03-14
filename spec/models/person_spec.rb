require 'spec_helper'

describe Person do
  describe '.full_name=' do
    {'Linda Solomon' => { :first_name => 'Linda', :last_name => 'Solomon', :middle_name => nil, :name_suffix => nil, :title => nil },
      'John Q. Public Jr.' => { :first_name => 'John', :last_name => 'Public', :middle_name => 'Q.', :name_suffix => 'Jr.', :title => nil },
      'Gen. Douglas MacArthur' => { :first_name => 'Douglas', :last_name => 'MacArthur', :title => 'Gen.', :middle_name => nil, :name_suffix => nil }
    }.each do |full_name, parts|
      parts.each do |column_name, expected_value|
        it "should parse #{column_name}=='#{expected_value}' from #{full_name}" do
          subject.full_name = full_name
          subject.send(column_name).should == expected_value
        end
      end
    end
  end

  it "should combine name parts into full_name" do
    subject.title       = 'Hon.'
    subject.first_name  = 'John'
    subject.middle_name = 'Q.'
    subject.last_name   = 'Public'
    subject.name_suffix = 'Esq.'

    subject.full_name.should == "Hon. John Q. Public Esq."
  end
end

describe Person, '(scopes)' do
  before :each do
    # Rabbi Doug already exists
    [ 'Gen. Douglas MacArthur',
      'Ben Hur',
      'Abraham'
    ].each {|full_name| Factory :person, :full_name => full_name }
  end

  describe '#full_names' do
    { 'D'      => ['Gen. Douglas MacArthur', 'Rabbi Douglas T. Heifetz'],
      'Doug'   => ['Gen. Douglas MacArthur', 'Rabbi Douglas T. Heifetz'],
      'Hu'     => ['Ben Hur', 'Gen. Douglas MacArthur'],
      'D. Arthur'  => ['Gen. Douglas MacArthur'],
      'D. MacArthur'  => ['Gen. Douglas MacArthur'],
      'J. MacArthur'  => ['Gen. Douglas MacArthur'],
      'B. Hur'  => ['Ben Hur', 'Gen. Douglas MacArthur'],
      'Ben Hur' => ['Ben Hur', 'Gen. Douglas MacArthur'],
      'Tom Hur' => ['Ben Hur', 'Gen. Douglas MacArthur']
    }.each do |query, expected_names|
      it "should return #{expected_names} names when querying '#{query}'" do
        Person.full_names(query).should == expected_names
      end
    end
  end
end


