class AddRidesAmusementParks < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :amusement_park_id, :integer
    add_index  :rides, :amusement_park_id
  end
end
