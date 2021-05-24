class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience
    total = sum(:experience)
    (total.to_f / self.all.count).round(2)
  end
end