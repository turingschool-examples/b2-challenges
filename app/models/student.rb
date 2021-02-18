class Student < ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students

  def self.students_of_professor(professor)
    @students_of_professor = professor.students
  end

  def self.average_student_age(professor)
    Student.joins(:professors).where("professor_id = ?", professor.id).average("age").to_f
  end
end
