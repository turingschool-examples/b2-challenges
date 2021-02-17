class Student < ApplicationRecord
  has_many :student_professors
  has_many :professors, through: :student_professors
end
