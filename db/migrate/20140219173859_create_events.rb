class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :start_date
      t.integer :duration
      t.string :venue
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
