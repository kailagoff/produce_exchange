class AddColumnUserNameToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column(:offers, :user_name, :string)
  end
end
