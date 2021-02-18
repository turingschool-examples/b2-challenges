class Professor < ApplicationRecord
  has_many :students

  def average_age
    students.average(:age)
  end
end