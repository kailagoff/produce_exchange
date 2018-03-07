class Offer < ActiveRecord::Base
  belongs_to :produce, dependent: :destroy
end
