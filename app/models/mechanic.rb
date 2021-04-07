class Mechanic < ApplicationRecord
  has_many :mechanics_and_rides
  has_many :rides, through: :mechanics_and_rides

  def self.average_years_experience
    average(:years_of_experience)
  end

  def open_rides_by_thrills
    rides.where(open: true).order(thrill_score: :desc)
  end

end
