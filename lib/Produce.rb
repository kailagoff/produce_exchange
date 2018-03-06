class Produce < ActiveRecord::Base
  has_and_belongs_to_many(:users)
  validates(:produce_type,  {:presence => true})
  validates(:description, {:presence => true, :length => {maximum: 150}})
  validates(:trade, {:presence => true})
end
