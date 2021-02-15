class Professor < ApplicationRecord
  has_many :professor_students, :dependent => :destroy
  has_many :students, through: :professor_students
end
