class ChangeCalendarTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table(:calendars, :events)
  end
end
