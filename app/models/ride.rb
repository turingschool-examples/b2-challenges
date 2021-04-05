class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.order_desc_by_thrill_rating_and_open
    where('open = ?', true).order(thrill_rating: :desc)
  end
end
