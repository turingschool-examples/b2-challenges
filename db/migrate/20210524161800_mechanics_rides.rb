class MechanicsRides < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics_rides do |t|
      t.belongs_to :mechanic, index: true, foreign_key: true
      t.belongs_to :ride, index: true, foreign_key: true
    end
  end
end
