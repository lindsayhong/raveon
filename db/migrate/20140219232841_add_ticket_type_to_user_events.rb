class AddTicketTypeToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :ticket_type, :string
  end
end
