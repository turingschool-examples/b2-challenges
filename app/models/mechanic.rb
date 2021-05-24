class Mechanic < ApplicationRecord
  def self.average_years
    average(:years_experience)
  end
end