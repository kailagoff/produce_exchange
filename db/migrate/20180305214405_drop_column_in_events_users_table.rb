class DropColumnInEventsUsersTable < ActiveRecord::Migration[5.1]
  def change
    rename_column(:events_users, :calendar_id, :event_id)
  end
end
