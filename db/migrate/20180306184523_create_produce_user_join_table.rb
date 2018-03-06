class CreateProduceUserJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table(:users, :produces)
  end
end
