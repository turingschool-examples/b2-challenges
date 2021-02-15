class Professor < ApplicationRecord
	validates :name, :age, :specialty, presence: true

	has_many :professor_students
  has_many :students, through: :professor_students
  
  def average_student_age
		students.average(:age).to_f.round
	end
end