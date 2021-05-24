class AmusementPark < ApplicationRecord
  has_many :park_rides
  has_many :rides, through: :park_rides
  validates_presence_of :name, :admission_price
end
