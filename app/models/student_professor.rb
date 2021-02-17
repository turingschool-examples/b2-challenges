class StudentProfessor < ApplicationRecord
  belongs_to :student
  belongs_to :professor
end
