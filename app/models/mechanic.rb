class Mechanic < ApplicationRecord
  has_and_belongs_to_many :rides

  def self.average_experience
    Mechanic.all.average(:years_experience)
  end
end
