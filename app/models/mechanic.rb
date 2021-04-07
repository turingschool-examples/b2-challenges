class Mechanic < ApplicationRecord
   has_many :mechanic_rides
   has_many :rides, through: :mechanic_rides

   def self.avg_exp
     average(:years_experience)
   end

# REFACTOR BELOW (REMOVE FROM RIDES MODEL)
   # def self.open_rides
   #  rides.where(open: true)
   # end
   #
   # def self.open_rides_by_thrills
   #   rides.where(open: true)
   #        .order(thrill_rating: :desc)
   # end
end
