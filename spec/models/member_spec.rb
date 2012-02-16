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
    subject.title       = 'Hon.'
    subject.first_name  = 'John'
    subject.middle_name = 'Q.'
    subject.last_name   = 'Public'
    subject.name_suffix = 'Esq.'

    subject.full_name.should == "Hon. John Q. Public Esq."
  end
end

describe Member, '(scopes)' do
  before :each do
    [ 'Rabbi Douglas Heifetz',
      'Gen. Douglas MacArthur',
      'Ben Hur',
      'Abraham'
    ].each {|full_name| Factory :member_full, :full_name => full_name }
  end

  describe '#with_name' do
    { 'D'      => ['Gen. Douglas MacArthur', 'Rabbi Douglas Heifetz'],
      'Doug'   => ['Gen. Douglas MacArthur', 'Rabbi Douglas Heifetz'],
      'Hu'     => ['Ben Hur', 'Gen. Douglas MacArthur'],
      'D. Arthur'  => ['Gen. Douglas MacArthur'],
      'D. MacArthur'  => ['Gen. Douglas MacArthur'],
      'J. MacArthur'  => ['Gen. Douglas MacArthur'],
      'B. Hur'  => ['Ben Hur', 'Gen. Douglas MacArthur'],
      'Ben Hur' => ['Ben Hur', 'Gen. Douglas MacArthur'],
      'Tom Hur' => ['Ben Hur', 'Gen. Douglas MacArthur']
    }.each do |query, expected_names|
      it "should return #{expected_names} names when querying '#{query}'" do
        Member.with_name(query).collect(&:full_name).should == expected_names
      end
    end
  end
end


