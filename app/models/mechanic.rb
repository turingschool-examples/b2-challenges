class Mechanic < ApplicationRecord

  def self.exp_in_years_average 
    average(:exp_in_years)
  end
end