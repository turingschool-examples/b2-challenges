class Professor < ApplicationRecord
  has_many :student_professors
  has_many :students, through: :student_professors
end
