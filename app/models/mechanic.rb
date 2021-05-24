class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years
    average(:years_experience)
  end

  def add_ride(mechanic, ride)
    if mechanic.rides.exists?(ride.id)
      return nil
    else
      mechanic.rides << ride
    end
  end
end