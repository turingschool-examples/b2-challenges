class Mechanic < ApplicationRecord
  def self.average_years_exp
    all.average(:years_experience)
  end
end
