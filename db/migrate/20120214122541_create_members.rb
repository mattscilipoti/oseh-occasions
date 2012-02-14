class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :name_suffix
      t.string :main_phone
      t.string :main_email

      t.timestamps
    end
  end
end
