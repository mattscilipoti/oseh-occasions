class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date

      t.timestamps
    end

    add_index :events, :start_date
  end
end
