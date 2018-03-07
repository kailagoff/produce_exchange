class AddColumnImageToProduceTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:produces, :image, :int)
  end
end
