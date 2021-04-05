class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics


  def self.average_years
    average(:years_of_experience).to_f.round(1)
  end
end