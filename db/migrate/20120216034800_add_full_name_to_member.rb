class AddFullNameToMember < ActiveRecord::Migration
  def change
    add_column :members, :full_name, :string
    add_index  :members, :full_name
  end
end
