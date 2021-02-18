class CreateRolls < ActiveRecord::Migration[5.2]
  def change
    create_table :rolls do |t|
      t.references :student, foreign_key: true
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
