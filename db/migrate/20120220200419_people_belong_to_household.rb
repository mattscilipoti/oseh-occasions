class PeopleBelongToHousehold < ActiveRecord::Migration
  def change
    add_column :people, :household_id, :integer
    add_column :people, :head_of_household, :boolean
  end
end
