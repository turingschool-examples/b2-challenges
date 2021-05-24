class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.only_open
    where(open: true)
  end

  def self.thrillers_first
    order(rating: :desc)
  end
end
