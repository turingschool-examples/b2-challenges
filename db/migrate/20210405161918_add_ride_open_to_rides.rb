class AddRideOpenToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :ride_open, :boolean
  end
end
