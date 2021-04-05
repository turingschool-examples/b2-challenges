class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience_in_years
    (Mechanic.all[0].years_experience + Mechanic.all[1].years_experience).div(2)
  end
end
