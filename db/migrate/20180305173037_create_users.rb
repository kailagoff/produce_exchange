class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|
      t.column(:name, :string)
      t.column(:password, :string)
      t.column(:quadrant, :string)
      t.column(:profile, :string)

      t.timestamps()
    end
  end
end
