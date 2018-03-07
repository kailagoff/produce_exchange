class Produce < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :offers
  validates(:produce_type,  {:presence => true})
  validates(:description, {:presence => true, :length => {maximum: 150}})
  validates(:trade, {:presence => true})
  before_save(:normalize)

  private
  def normalize
    self.produce_type = produce_type.downcase.titleize
  end

  def self.findproduce(search_name)
    @allproduce = Produce.all
    results_array = []
    @allproduce.each() do |produce|
      if produce.produce_type.downcase == search_name.downcase
        results_array.push(produce)
      end
    end
    results_array
  end


end
