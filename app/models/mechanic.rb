class Mechanic < ApplicationRecord
  def self.average_years
    average(:years_of_experience).to_f.round(1)
  end
end