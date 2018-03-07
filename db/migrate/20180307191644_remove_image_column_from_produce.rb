class RemoveImageColumnFromProduce < ActiveRecord::Migration[5.1]
  def change
    remove_column(:produces, :image, :int)
  end
end
