class AddLodgingToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :lodging, :string
  end
end
