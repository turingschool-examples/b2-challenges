class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.text :name
      t.boolean :open

      t.timestamps
    end
  end
end
