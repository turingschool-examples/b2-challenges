class CreateMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :exp_in_years
      
      t.references :amusement_park 
      t.timestamps
    end
  end
end
