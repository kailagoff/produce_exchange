class User < ActiveRecord::Base
  has_and_belongs_to_many(:events)
  has_and_belongs_to_many(:produces)
  validates(:name,  {:uniqueness => true, :presence => true, :length => {maximum: 20}})
  validates(:password, {:presence => true})

  private
end
