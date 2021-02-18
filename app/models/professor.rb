class Professor < ApplicationRecord
  has_many :students

  def students_average_age
    students.average(:age)
  end
end
