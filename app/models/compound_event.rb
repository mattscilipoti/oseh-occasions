# A Compound Event is an event that hosts other events
class CompoundEvent < Event

  def self.attendees_count
    events.inject {|count, event| count += event.attendees_count }
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

