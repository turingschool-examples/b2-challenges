class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  # def self.is_open
  #   where(open: true)
  # end

  def self.isort_by_most_thrills_and_open
    where(open: true).order(rating: :desc)
  end
end
