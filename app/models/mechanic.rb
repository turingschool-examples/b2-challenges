class Mechanic < ApplicationRecord
  validates :name, presence: true

  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_experience
    average(:years_of_experience)
  end
end
