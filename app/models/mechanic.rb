class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  validates_presence_of :name, :years_experience

  def self.average_years_experience
    (Mechanic.all.first.years_experience + Mechanic.all.last.years_experience).div(2)
  end

  def params
  end
end
