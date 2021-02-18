class Professor < ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students

  def students_average_age
    students.average(:age)
  end
end
