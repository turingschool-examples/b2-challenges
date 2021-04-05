class Mechanic < ApplicationRecord

  has_many :mechanic_rides, dependent: :delete_all #added extra stuff here, but not else where. WHY?
  has_many :rides, through: :mechanic_rides

end
