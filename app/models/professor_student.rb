class ProfessorStudent < ApplicationRecord
  belongs_to :professor
  belongs_to :student
  validates_presence_of :professor_id, :student_id
end
