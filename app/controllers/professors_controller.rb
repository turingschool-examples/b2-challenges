class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @pairs = ProfessorStudent.where(professor_id: "#{params[:id]}")

    @students = @pairs.map do |pair|
      Student.find(pair.student_id)
    end

    total_age = @students.sum do |student|
      student.age
    end

    @average_age = (total_age.to_f / @students.count).round(2)
  end

  def edit
    @professor = Professor.find(params[:id])
  end

end
