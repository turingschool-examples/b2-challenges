class Professor < ApplicationRecord
  has_many :Students, through: :student_professors
end
