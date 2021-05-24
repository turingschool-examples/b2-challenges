class RemoveAmusementparksidFromRides < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :amusement_parks_id, :integer
  end
end
