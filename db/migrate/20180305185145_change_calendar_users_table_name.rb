class ChangeCalendarUsersTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table(:calendars_users, :events_users)
  end
end
