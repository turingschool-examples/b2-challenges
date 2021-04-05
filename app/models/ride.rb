class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
  has_many :amusement_park_rides
  has_many :amusement_parks, through: :amusement_park_rides

  def self.desc_thrill_rating
    order(thrill_rating: :DESC)
  end

  def self.alpha_names
    order(:name)
  end

  def self.avg_thrill_rating
    average(:thrill_rating).round(1)
  end
end