class Student < ApplicationRecord
  validates_presence_of :name, :age
  has_many :professor_students
  has_many :professors, through: :professor_students

  def self.average_age
    average(:age)
  end
end
