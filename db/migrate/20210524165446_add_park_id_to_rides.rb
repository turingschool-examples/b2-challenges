class AddParkIdToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :park, index: true
  end
end
