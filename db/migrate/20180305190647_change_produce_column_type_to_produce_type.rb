class ChangeProduceColumnTypeToProduceType < ActiveRecord::Migration[5.1]
  def change
    rename_column :produces, :type, :produce_type
  end
end
