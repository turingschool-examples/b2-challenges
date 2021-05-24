class AmusementPark < ApplicationRecord
  has_many :rides

  def ordered_rides
    self.rides.order(:name)
  end

  def avg_thrill
    self.rides.average(:thrill_rating).round 
  end

end
