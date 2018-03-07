class CreateOfferTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:offers) do |t|
      t.column(:trade_item, :string)
      t.column(:description, :string)
      t.column(:produce_id, :int)
      t.column(:user_id, :int)

      t.timestamps()
    end
  end
end
