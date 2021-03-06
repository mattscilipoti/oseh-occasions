class Event < ActiveRecord::Base
  belongs_to :parent, :class_name => Event.name
  has_and_belongs_to_many :attendees, :class_name => 'Person' do
    def from_household(household)
      where(:household_id => household)
    end
  end

  has_many :events, :foreign_key => 'parent_id'

  scope :upcoming, lambda {|limit|
    limit ||= 5
    where("start_date > ?", Date.today).order(:start_date).limit(limit)
  }

  validates_presence_of :name, :start_date

  def household_attendee_ids=(new_attendee_ids)
    new_attendee_ids = new_attendee_ids.collect(&:to_i)
    new_attendees = Person.find(new_attendee_ids)
    household = new_attendees.first.household
    household_member_ids = household.member_ids
    # unenroll all household member
    self.attendee_ids -= household_member_ids
    # enroll only the selected household members
    self.attendee_ids += new_attendee_ids
  end
end



# == Schema Information
#
# Table name: events
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  start_date      :datetime
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  parent_id       :integer
#  description     :text
#  attendees_count :integer         default(0)
#  type            :string(255)
#

