class Offer < ActiveRecord::Base
  belongs_to :produce, dependent: :destroy
  validates(:trade_item, {:presence => true})
  validates(:description, {:presence => true})
end
