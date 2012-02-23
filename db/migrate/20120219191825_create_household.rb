class CreateHousehold < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :family_name
      t.string :main_phone
    end
  end
end
