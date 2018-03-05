class CreateProduceUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:produce_users) do |t|
      t.column(:produce_id, :integer)
      t.column(:user_id, :integer)

      t.timestamps()
    end
  end
end
