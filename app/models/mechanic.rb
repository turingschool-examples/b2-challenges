class Mechanic < ApplicationRecord
  has_many :rides

  def self.average_experience
    Mechanic.all.average(:years_experience).to_i
  end
end