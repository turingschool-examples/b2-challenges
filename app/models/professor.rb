class Professor < ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students

  def average_age_of_students
    students.select(:age).average(:age)
  end
end
