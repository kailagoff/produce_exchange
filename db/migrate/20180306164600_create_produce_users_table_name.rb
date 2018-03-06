class CreateProduceUsersTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table(:produce_users, :produces_users)
  end
end
