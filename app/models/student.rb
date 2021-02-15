class Student < ApplicationRecord
  has_many :class_lists
  has_many :professors, through: :class_lists
end