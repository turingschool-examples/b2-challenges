class Mechanic < ApplicationRecord
  belongs_to :amusement_park
  has_many :rides 

  def self.exp_in_years_average 
    average(:exp_in_years)
  end
end