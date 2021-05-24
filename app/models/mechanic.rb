class Mechanic < ApplicationRecord
  def self.average_years_experience
    self.average(:years_of_experience)
  end
end
