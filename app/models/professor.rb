class Professor < ApplicationRecord
  has_many :student_professors
  has_many :students, through: :student_professors
  validates :name, :age, :specialty, presence: true

  def average_ages
    ( age_total / students.count ).round(2)
  end

  def age_total
    students.sum do |student|
      student.age
    end.to_f
  end
end
