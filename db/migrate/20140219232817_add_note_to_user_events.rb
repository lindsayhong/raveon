class AddNoteToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :note, :text
  end
end
