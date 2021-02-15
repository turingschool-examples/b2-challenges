class Professor < ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students

  validates_presence_of :name

  def average_student_age
    students.select(:age).average(:age)
  end
end
