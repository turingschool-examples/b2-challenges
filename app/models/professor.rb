class Professor < ApplicationRecord
  has_many :class_lists
  has_many :students, through: :class_lists

  def student_list(id)
    # binding.pry
    student_records = ClassList.where("professor_id = #{id}")
    students = student_records.map{|s| Student.find(s.student_id)}
  end
end