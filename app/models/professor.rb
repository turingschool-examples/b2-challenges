class Professor < ApplicationRecord
  has_many :students

  def total_students
    students.count
  end

  def total_students_age
    students.sum do |student|
      student.age
    end
  end

  def average_student_age
    total_students_age/total_students
  end
  
end
