class Ride < ApplicationRecord
  belongs_to :mechanic
  belongs_to :park

  def self.open_rides_by_thrill
    where('open = true').order(thrill_rating: :desc)
  end

  def self.rides_by_name
    order(:name)
  end

  def self.avg_thrill
    average(:thrill_rating).round(2)
  end
end
