class AmusementPark < ApplicationRecord
  has_many :mechanics
  has_many :rides, through: :mechanics
end