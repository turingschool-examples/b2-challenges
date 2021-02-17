class ProfessorStudent < ApplicationRecord
  belongs_to :professor
  belongs_to :student
  validates_presence_of :student_id, :professor_id
end
