class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.display
    open = where("open = true")
    open.order(thrill_rating: :desc)
  end

end