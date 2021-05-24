class AddRideMechanics < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rides, :mechanics do |t|
      t.index %i[ride_id mechanic_id], unique: true
    end
    up_only do
      Ride.all.each do |ride|
        unless ride.mechanic_id.nil?
          ride.update(mechanics: [Mechanic.find(ride.ride_id)])
        end
      end
      remove_column :rides, :mechanic_id
    end
  end
end
