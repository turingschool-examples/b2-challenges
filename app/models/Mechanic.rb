class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def open_thrill
    rides.where('open = true').order(thrill_rating: :desc)
  end

end
