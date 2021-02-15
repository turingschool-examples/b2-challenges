class Student < ApplicationRecord
  has_many :professor_students, :dependent => :destroy
  has_many :professors, through: :professor_students

  def self.average_student_age
    average(:age)
  end
end
