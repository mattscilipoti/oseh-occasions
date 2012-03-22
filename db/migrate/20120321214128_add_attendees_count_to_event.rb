class AddAttendeesCountToEvent < ActiveRecord::Migration
  def up
    add_column :events, :attendees_count, :integer, :default => 0

    puts "Updating attendee counts..."
    Event.reset_column_information
    Event.all.each do |event|
      event.update_attribute :attendees_count, event.attendees.length # use length to avoid circular dep
    end
  end

  def down
    remove_column :events, :attendees_count
  end
end
