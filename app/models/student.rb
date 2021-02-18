class Student < ApplicationRecord
  has_many :rolls
  has_many :professors, through: :rolls

  def self.average_age
    self.average(:age)
  end
end
