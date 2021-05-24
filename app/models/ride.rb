class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  validates_presence_of :name, :thrill_rating
  validates :open, inclusion: [true, false]
  validates :open, exclusion: [nil]

  def self.ride_names_for_rides_worked_on(block_variable)
    where('id = ?', block_variable.ride_id).pluck(:name)
  end
end
