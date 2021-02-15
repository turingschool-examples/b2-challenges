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

  describe "I see the professors name, age & specialty" do
    it "Shows all student names associated with this professor" do
      visit "/professors/#{@professor2.id}"
      expect(page).to have_content(@professor2.name)
      expect(page).to have_content(@professor2.age)
      expect(page).to have_content(@professor2.specialty)
      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student2.name)
      expect(page).to have_content(@student3.name)
      visit "/professors/#{@professor1.id}"
      expect(page).to have_content(@professor1.name)
      expect(page).to have_content(@professor1.age)
      expect(page).to have_content(@professor1.specialty)
      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student3.name)
    end
  end

  describe "When Im on a professor show page" do
    it "Shows the average age of all students associated with prof" do
      visit "/professors/#{@professor2.id}"
      expect(page).to have_content("Average age of Students: 16.33")
    end
  end
end
