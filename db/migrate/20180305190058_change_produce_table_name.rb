class ChangeProduceTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table(:produce, :produces)
  end
end
