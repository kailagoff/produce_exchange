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

  def self.findproduce(search_term)
    @allproduce = Produce.all
    @results_array = []
      @allproduce.each() do |produce|
        if produce.produce_type == search_term
          @results_array.push(produce)
        end
      end
    @results_array = []
  end
end
