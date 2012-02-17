class RenameMembersToPeople < ActiveRecord::Migration
  def change
    remove_index :members, :full_name
    rename_table :members, :people
    add_index :people, :full_name
  end
end
