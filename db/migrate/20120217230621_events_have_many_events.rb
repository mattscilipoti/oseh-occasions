class EventsHaveManyEvents < ActiveRecord::Migration
  def change
    add_column :events, :parent_id, :integer
    add_index :events, :parent_id
  end
end
