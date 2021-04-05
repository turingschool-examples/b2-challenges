class Ride < ApplicationRecord
  has_many :mechanics
  has_many :ride_mechanics

  # def shelter_name
  #   shelter.name
  # end
  #
  # def self.adoptable
  #   where(adoptable: true)
  # end
end
