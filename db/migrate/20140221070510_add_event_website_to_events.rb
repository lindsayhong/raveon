class AddEventWebsiteToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_website, :string
  end
end
