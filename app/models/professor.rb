class Professor < ApplicationRecord
  has_many :student_professors
  has_many :students, through: :student_professors

  # def self.all_students
  #   students.each do |student|
  #     student.name
  #   end
  # end
end
