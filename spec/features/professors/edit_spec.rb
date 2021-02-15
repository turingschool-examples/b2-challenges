require 'rails_helper'
RSpec.describe 'Professors edit page' do
  before :each do
    Professor.destroy_all
    Student.destroy_all
    StudentProfessor.destroy_all
    @professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @professor2 = Professor.create!(name: "Severus Snape", age: 52, specialty: "Defense Against the Dark Arts")
  end
  it "can edit a professor's info" do
    visit "/professors"

    within("#professor-#{@professor1.id}") do
      expect(page).to have_link "Update"
      click_link "Update"
      expect(current_path).to eq("/professors/#{@professor1.id}/edit")
    end
    fill_in "name", with: "Remus Lupin"
    fill_in "age", with: 45
    fill_in "specialty", with: "Werewolf"

    click_button "Update"

    expect(current_path).to eq("/professors")

    expect(page).to have_content("Remus Lupin")
    expect(page).to_not have_content("Minerva McGonagall")
  end
end
