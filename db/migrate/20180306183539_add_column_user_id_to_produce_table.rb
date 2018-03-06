class AddColumnUserIdToProduceTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:produces, :user_id, :int)
  end
end
