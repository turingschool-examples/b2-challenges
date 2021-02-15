class CreateStudentProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :student_professors do |t|
      t.references :student, foreign_key: true
      t.references :professor, foreign_key: true
    end
  end
end
