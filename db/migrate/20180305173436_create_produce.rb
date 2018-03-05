class CreateProduce < ActiveRecord::Migration[5.1]
  def change
    create_table(:produce) do |t|
      t.column(:type, :string)
      t.column(:description, :string)
      t.column(:trade, :string)

      t.timestamps()
    end
  end
end
