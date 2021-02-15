require 'rails_helper'

RSpec.describe 'As a Visitor' do
  before :each do
  	# @application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
   #  @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
   #  @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
   @professor_1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
   @student_1 = Student.create!(name: "Neville Shortbottom",age: 22)
   @student_2 = Student.create!(name: "Hairy Planter",age: 24)
   @student_3 = Student.create!(name: "Roland Weasel",age: 18)

   @professor_1.students << @student_1
   @professor_1.students << @student_2
   @professor_1.students << @student_3
  end

  describe'a professors show page'do
  	it'displays the information about a professor'do
  		visit "/professors/#{@professor_1.id}"

  		within("#shown-prof")do
  			expect(page).to have_content("#{@professor_1.name}")
  			expect(page).to have_content("#{@professor_1.age}")
  			expect(page).to have_content("#{@professor_1.specialty}")
  		end
  	end

  	it'shows the average age of the students'do
  		visit "/professors/#{@professor_1.id}"

  		within("#shown-prof")do
  			expect(page).to have_content("#{@professor_1.name}")
  		end
  		expect(page).to have_content("Average age of students: #{(@student_1.age + @student_2.age + @student_3.age)/3}")
  	end
	end

end