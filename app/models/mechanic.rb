class Mechanic < ApplicationRecord
  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides
  def self.average_years_experience
    self.average(:years_of_experience)
  end

  def open_rides
    self.rides.where('open = true')
  end

  def sorted_rides_thrill
    self.rides.order('thrill_rating desc')
  end
end
