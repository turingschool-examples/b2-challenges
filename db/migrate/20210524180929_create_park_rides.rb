class CreateParkRides < ActiveRecord::Migration[5.2]
  def change
    create_table :park_rides do |t|
      t.references :amusement_park, foreign_key: true
      t.references :ride, foreign_key: true
      t.timestamps
    end
  end
end
