class CreateProfessorStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_students do |t|
      t.references :professor, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps
    end
  end
end
