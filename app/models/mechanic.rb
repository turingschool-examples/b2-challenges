class Mechanic < ApplicationRecord
  def self.avg_years_exp
    average(:years_exp).to_f
  end
end
