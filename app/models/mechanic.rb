class Mechanic < ApplicationRecord
  has_and_belongs_to_many :rides 

  def self.avg_years_exp
    average(:years_exp).to_f
  end
end
