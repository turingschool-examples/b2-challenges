class Ride < ApplicationRecord
  belongs_to :park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open
    where(open: true)
  end

  def self.sort_by_thrill
    order(thrill_rating: :desc )
  end

  def self.sort_alpha
    order(name: :asc)
  end

  def self.average_thrill
    average(:thrill_rating)
  end
end