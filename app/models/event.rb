class Event < ActiveRecord::Base
  belongs_to :parent, :class_name => Event.name
  has_and_belongs_to_many :attendees, :class_name => 'Person' do
    def from_household(household)
      where(:household_id => household)
    end
  end
  has_many :sub_events, :class_name => Event.name, :foreign_key => 'parent_id'

  scope :upcoming, lambda {|limit|
    limit ||= 5
    where("start_date > ?", Date.today).order(:start_date).limit(limit)
  }

  validates_presence_of :name, :start_date
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
#

