class Ride < ApplicationRecord
  validates_presence_of :name, :thrill_rating #, :open
  # validates :open, presence: true

  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.ride_open
    where(open: true)
  end
end
