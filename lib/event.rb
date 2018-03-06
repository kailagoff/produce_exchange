class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates(:title, {:presence => true})
  validates(:description, {:presence => true, :length => {maximum: 150}})
  # validates :in_future

  private
  # def in_future
  #   if date.present? && date < Date.today
  #     errors.add(:date, "cannot be in the past")
  #   end
  # end

end
