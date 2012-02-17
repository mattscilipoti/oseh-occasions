class RenameMembersToPeople < ActiveRecord::Migration
  def change
    rename_table :members, :people
  end
end
