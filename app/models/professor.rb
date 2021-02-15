class Professor < ApplicationRecord
  has_many :class_lists
  has_many :students, through: :class_lists

  def student_list(id)
    student_records = ClassList.where("professor_id = #{id}")
    students = student_records.map{|s| Student.find(s.student_id)}
  end

  def average_age(students)
    age = students.reduce(0){|sum, num| sum + num.age.to_f}
    avg_age = age/students.count
    # will come back and try to do AR if I have time
    # ran out of time, maybe a class method? I'm at least only iterating over a few students and not a whole db
  end
end