class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides
  
  def self.average_years_exp
    all.average(:years_experience)
  end

  def all_open_rides_listed_by_thrill
    self.rides.select(:name).where("open == true").order("thrill_rating desc")
  end
end
