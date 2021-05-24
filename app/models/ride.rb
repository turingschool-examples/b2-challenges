class Ride < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :mechanics, through: :ride_mechanics

  def self.by_thrill_rating
    order(thrill_rating: :desc)
  end

  def self.open_only
    where(open: true)
  end
end
