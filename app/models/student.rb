class Student < ApplicationRecord
  has_many :professors, through: :student_professors
end
