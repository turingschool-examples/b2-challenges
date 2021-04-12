class Mechanic < ApplicationRecord
   has_many :mechanic_rides
   has_many :rides, through: :mechanic_rides

   def self.avg_exp
     average(:years_experience)
   end

# REFACTOR BELOW
   def open_rides
    rides.where(ride_open: true)
   end

   def open_rides_by_thrill
     rides.where(ride_open: true)
          .order(thrill_rating: :desc)
   end
end
