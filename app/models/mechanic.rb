class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
  validates :name, presence: true
  validates :years_experience, presence: true, numericality: true

  def self.average_year_experience
    average(:years_experience)
  end
end
