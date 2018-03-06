class User < ActiveRecord::Base
  has_many(:produces)
  has_and_belongs_to_many(:events)
  validates(:name, {:presence => true, :uniqueness => true})
  validates(:password, {:presence => true})
end
