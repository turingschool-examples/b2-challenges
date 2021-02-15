class ProfessorStudent < ApplicationRecord
  belongs_to :professor
  belongs_to :student

  def self.find_by(professor_id, student_id)
    where(professor: professor_id).where(student: student_id).take
  end
end
