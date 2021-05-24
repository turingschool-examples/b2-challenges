class CreateMechanicsRides < ActiveRecord::Migration[5.2]
  def change
    create_join_table :mechanics, :rides do |t|
      t.index :mechanic_id
      t.index :ride_id
    end
  end
end
