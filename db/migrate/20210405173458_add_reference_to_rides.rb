class AddReferenceToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :park, foreign_key: true
    add_column :amusement_park_id, 0

  end
end
