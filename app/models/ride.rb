class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  validates :name, presence: true
  validates :thrill_rating, presence: true, numericality: true
  # validates :open, inclusion: [true, false]
end
