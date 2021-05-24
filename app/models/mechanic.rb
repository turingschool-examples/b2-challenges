class Mechanic < ApplicationRecord
  has_many :rides 

  def self.exp_in_years_average 
    average(:exp_in_years)
  end
end