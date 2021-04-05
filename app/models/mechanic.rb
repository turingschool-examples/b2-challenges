class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  # def shelter_name
  #   shelter.name
  # end
  #
  # def self.adoptable
  #   where(adoptable: true)
  # end
end
