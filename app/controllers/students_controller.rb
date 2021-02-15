class StudentsController < ApplicationController
  has_many :professors, through: :professor_students
end
