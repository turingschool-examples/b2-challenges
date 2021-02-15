class Professor < ApplicationRecord
  has_many :class_lists
  has_many :students, through: :class_lists
end