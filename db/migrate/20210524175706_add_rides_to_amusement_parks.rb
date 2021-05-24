class AddRidesToAmusementParks < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :amusement_park_id, :bigint
  end
end
