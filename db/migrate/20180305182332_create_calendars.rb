class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table(:calendars) do |t|
      t.column(:title, :string)
      t.column(:date, :string)
      t.column(:description, :text)
      t.column(:quadrant, :text)

      t.timestamps()
    end
  end
end
