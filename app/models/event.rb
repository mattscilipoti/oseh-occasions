class Event < ActiveRecord::Base
  scope :upcoming, lambda {|limit|
    limit ||= 5
    where("start_date > #{Date.today}").order(:start_date).limit(limit)
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
#

