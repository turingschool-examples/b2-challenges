class ProfessorStudent < ApplicationRecord
  belongs_to :professor
  belongs_to :student

  def self.find_student_by(id)
    where(student: id)
  end
end
