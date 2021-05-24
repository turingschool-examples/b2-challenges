class CreateRide < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :thrill_rating
      t.boolean :open

      t.references :mechanic
      t.references :amusement_park 
      t.timestamps
    end
  end
end
