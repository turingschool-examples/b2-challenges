class Student < ApplicationRecord
  has_many :rolls
  has_many :professors, through: :rolls
end
