class Mechanic < ApplicationRecord
  def self.average_experience
    total = sum(:experience)
    (total.to_f / self.all.count).round(2)
  end
end