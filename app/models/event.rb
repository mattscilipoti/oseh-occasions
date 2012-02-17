class Event < ActiveRecord::Base
  scope :upcoming, lambda {|limit|
    limit ||= 5
    order('start_date desc').limit(limit)
  }
end
