class Mechanic < ApplicationRecord   
  has_many :maintenances
  has_many :rides, through: :maintenances    

  def self.average_years_experience
    average(:years_experience)  
  end
end