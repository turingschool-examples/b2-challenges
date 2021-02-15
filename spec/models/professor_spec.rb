require "rails_helper"

 RSpec.describe Professor do
 	  before :each do
			@professor_1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
			@student_1 = Student.create!(name: "Neville Shortbottom",age: 22)
			@student_2 = Student.create!(name: "Hairy Planter",age: 24)
			@student_3 = Student.create!(name: "Roland Weasel",age: 18)

			@professor_1.students << @student_1
			@professor_1.students << @student_2
			@professor_1.students << @student_3
  	end
   describe "relationships" do
     it { should have_many :professor_students}
     it { should have_many(:students).through(:professor_students)}
   end


   describe "instance methods" do
	   
   	it'#average_student_age'do
   		expect(@professor_1.average_student_age).to eq(21)
   	end
   end
 end