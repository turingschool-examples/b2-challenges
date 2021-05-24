class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.sort_by_thrill_filter_open
    where(open: true).order(thrill_rating: :desc)
  end
end