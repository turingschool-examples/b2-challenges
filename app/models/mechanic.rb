class Mechanic <ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_exp
    years_experience = (self.pluck(:years_experience))
    (years_experience.sum/years_experience.size)
  end
end