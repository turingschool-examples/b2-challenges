class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def ride_names
    @rides.names
  end

  def self.average_experience
    # select(*).count(mechanics.id)
    # (@mechanics.sum {mechanic.experience}) / @mechanics.count
    # average("experience").to_i
    sum("experience")/self.count.to_i
  end
end
