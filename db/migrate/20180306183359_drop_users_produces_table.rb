class DropUsersProducesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:produces_users)
  end
end
