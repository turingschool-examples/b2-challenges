class Student < ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students
  validates_presence_of :name, :age

  def self.find_average_age(professor)
    binding.pry
    where(professors: professor).avg(:age)
  end
end