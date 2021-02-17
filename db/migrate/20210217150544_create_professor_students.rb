class CreateProfessorStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_students do |t|
      t.references :professor
      t.references :student
    end
  end
end
