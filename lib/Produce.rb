class Produce < ActiveRecord::Base
  has_and_belongs_to_many(:users)
  validates(:produce_type,  {:presence => true})
  validates(:description, {:presence => true, :length => {maximum: 150}})
  validates(:trade, {:presence => true})
  before_save(:normalize)

  private
  def normalize
    self.produce_type = produce_type.downcase.titleize
  end

end
