class CreateCalendarsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:calendars_users) do |t|
      t.column(:calendar_id, :integer)
      t.column(:user_id, :integer)

      t.timestamps()
    end
  end
end
