class Professor < ApplicationRecord
  has_many :students, dependent: :destroy

  def students_average_age
    students.average(:age)
  end
end
