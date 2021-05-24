class Mechanic < ApplicationRecord
  has_many :mechanics_ride
  has_many :rides, through: :mechanics_ride


  def self.total_years_of_experience
    sum("years_of_experience")
  end

  def self.number_of_mechanics
    self.count
  end

  def self.average_years_of_experience
    (total_years_of_experience / number_of_mechanics)
  end

end
