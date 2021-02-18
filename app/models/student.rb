class Student < ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students

  def self.students_of_professor(professor)
    @students_of_professor = professor.students
  end

  def self.average_student_age(professor)
    require "pry"; binding.pry
  end
end
