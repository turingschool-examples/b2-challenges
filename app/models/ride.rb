class Ride < ApplicationRecord
  belongs_to :mechanic

  def self.open_rides_by_thrill
    where('open = true').order(thrill_rating: :desc)
  end
end
