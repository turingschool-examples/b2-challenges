class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :thrill_rating
      t.boolean :open
      t.belongs_to :park, index: true, foreign_key: true
      t.timestamps
    end
  end
end
