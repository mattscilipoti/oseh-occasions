class Event < ActiveRecord::Base
  belongs_to :parent, :class_name => Event.name
  has_and_belongs_to_many :attendees, :class_name => 'Person'
  has_many :children, :class_name => Event.name, :foreign_key => 'parent_id'

  scope :upcoming, lambda {|limit|
    limit ||= 5
    where("start_date > ?", Date.today).order(:start_date).limit(limit)
  }
end


# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  start_date :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  parent_id  :integer
#

