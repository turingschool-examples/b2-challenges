require "rails_helper"

RSpec.describe "As a visitor on the Professor Index page" do
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

  describe "I see the name of each professor in the page" do
    it "Has a link to 'Update' next to each professor" do
      visit "/professors"
      expect(page).to have_content(@professor1.name)
      expect(page).to have_content(@professor2.name)
      within("#index-prof-#{@professor1.id}") do
        expect(page).to have_link("Update")
        click_link("Update")
      end
      expect(current_path).to eq("/professors/#{@professor1.id}/update")
      expect(page).to have_button("Update Professor")
      fill_in "name", :with => "New Prof"
      fill_in "age", :with => 55
      fill_in "specialty", :with => "No Arts"
      click_button("Update Professor")
      expect(current_path).to eq("/professors")
      within("#index-#{@professor1.id}") do
        expect(page).to have_content("New Prof")
        expect(page).to have_content("55")
        expect(page).to have_content("No Arts")
      end
    end
  end
end
