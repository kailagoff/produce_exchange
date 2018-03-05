class User < ActiveRecord::Base
  has_and_belongs_to_many(:events)
  has_and_belongs_to_many(:produce)
  validates(:name, {:presence => true, :uniqueness => true})
  validates(:password, {:presence => true})
end
