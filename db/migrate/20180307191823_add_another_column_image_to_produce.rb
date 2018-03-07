class AddAnotherColumnImageToProduce < ActiveRecord::Migration[5.1]
  def change
    add_column(:produces, :image, :binary)
  end
end
