class ClassList < ApplicationRecord
  belongs_to :professor
  belongs_to :student
end