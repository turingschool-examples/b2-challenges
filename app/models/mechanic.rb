class Mechanic < ApplicationRecord

  has_many :mechanic_rides, dependent: :delete_all #added extra stuff here, but not else where. WHY?
  has_many :rides, through: :mechanic_rides

  def self.average_exp
    exp_sum = self.sum do |mechanic|
      mechanic.experiance
    end
    exp_sum.to_f/self.all.length
  end

  def open_rides
    self.rides.find_all do |ride|
      ride.open == true
    end 
  end
end
