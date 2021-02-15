require 'rails_helper'

RSpec.describe 'Professors index page' do
  before :each do
    Professor.destroy_all
    Student.destroy_all
    StudentProfessor.destroy_all
    @professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @professor2 = Professor.create!(name: "Severus Snape", age: 52, specialty: "Defense Against the Dark Arts")
  end

  it "Can show all professor's names" do
    visit "/professors"

    expect(page).to have_content(@professor1.name)
    expect(page).to have_content(@professor2.name)
  end
end
