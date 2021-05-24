class Mechanic < ApplicationRecord
  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides
  def self.average_years_experience
    self.average(:years_of_experience)
  end
end
