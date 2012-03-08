class EventHasManyAttendees < ActiveRecord::Migration
  def change
    create_table :events_people, :id => false do |t|
      t.belongs_to :event
      t.belongs_to :person
    end

    add_index :events_people, [:event_id, :person_id]
    add_index :events_people, [:person_id, :event_id]
  end
end
