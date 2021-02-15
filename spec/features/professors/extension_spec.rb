require "rails_helper"

RSpec.describe "As a visitor on a Professors show page" do
  before :each do
    @professor1 = Professor.create!(
      name: "Evil Professor",
      age: 31,
      specialty: "Dark Arts"
    )
    @professor2 = Professor.create!(
      name: "Great Professor",
      age: 48,
      specialty: "Not Dark Arts"
    )
    @professor3 = Professor.create!(
      name: "Next Prof",
      age: 100,
      specialty: "Sports"
    )
    @student1 = Student.create!(
      name: "Whacky kid",
      age: 18
    )
    @student2 = Student.create!(
      name: "Funny one",
      age: 15
    )
    @student3 = Student.create!(
      name: "Loud kiddo",
      age: 16
    )
    @professor1.students << [@student1, @student3]
    @professor2.students << [@student1, @student2, @student3]
  end

  describe "Next to each student theres a button 'Unenroll'" do
    describe "When I click the button im taken back to prof show page" do
      it "No longer shows the student listed" do
        visit "/professors/#{@professor2.id}"
        within("#unenroll-#{@student1.id}") do
          expect(page).to have_button("Unenroll")
          click_button("Unenroll")
        end
        expect(current_path).to eq("/professors/#{@professor2.id}")
        within("#students-of-#{@professor2.id}") do
          expect(page).to have_content(@student2.name)
          expect(page).to have_content(@student3.name)
          expect(page).not_to have_content(@student1.name)
        end
        visit "/professors/#{@professor1.id}"
        within("#students-of-#{@professor1.id}") do
          expect(page).to have_content(@student1.name)
          expect(page).to have_content(@student3.name)
        end
      end
    end
  end
end
