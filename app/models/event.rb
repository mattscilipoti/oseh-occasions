class Event < ActiveRecord::Base
  scope :upcoming, lambda {|limit|
    limit ||= 5
    where("start_date > #{Date.today}").order(:start_date).limit(limit)
  }
end
