# app/models/ride_mechanic.rb
class RideMechanic < ApplicationRecord
  belongs_to :mechanic
  belongs_to :ride
end
