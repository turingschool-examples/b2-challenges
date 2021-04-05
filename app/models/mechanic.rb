class Mechanic < ApplicationRecord
  validates :name, presence: true
  validates :years_of_experience, presence: true

  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_experience
    average(:years_of_experience)
  end
end
