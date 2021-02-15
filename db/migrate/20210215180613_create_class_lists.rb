class CreateClassLists < ActiveRecord::Migration[5.2]
  def change
    create_table :class_lists do |t|
      t.references :professor, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
