class Mechanic < ApplicationRecord
  has_many :mechanics_and_rides
  has_many :rides, through: :mechanics_and_rides

  def self.average_years_experience
    average(:years_of_experience)
  end


end
