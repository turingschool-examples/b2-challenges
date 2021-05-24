class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  validates_presence_of :name, :thrill_rating
  validates :open, inclusion: [true, false]
  validates :open, exclusion: [nil]

  def self.current_rides(block_variable)
    where('id = ?', block_variable.ride_id)
  end

  def self.names_for_open_rides_ordered_by_thrill_desc
    where('open = ?', true).order(thrill_rating: :desc).pluck(:name)
  end
end
