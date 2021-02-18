class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :name
      t.integer :age
      t.string :speciatly

      t.timestamps
    end
  end
end
