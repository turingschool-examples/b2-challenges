class Mechanic < ApplicationRecord
  has_many :rides, dependent: :destroy

  def self.avg_yrs_exp
    average(:years_experience)
  end
end
