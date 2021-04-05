class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  # def shelter_name
  #   shelter.name
  # end
  #
  # def self.adoptable
  #   where(adoptable: true)
  # end
end
