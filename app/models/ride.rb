class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  validates_presence_of :name, :thrill_rating
  validates :open, inclusion: [true, false]
  validates :open, exclusion: [nil]
end
