class Mechanic < ApplicationRecord
  def self.average_years_exp
    require "pry"; binding.pry
    all.average(:years_experience)
  end
end
