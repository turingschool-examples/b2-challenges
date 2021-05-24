class AddFKtoRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :amusement_park, index: true
  end
end
