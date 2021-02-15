require "rails_helper"

RSpec.describe "Professor show page" do
  before :each do
    @professor1 = Professor.create!(name: "Professor Snape", age: 65, specialty: "Magic")
    @professor2 = Professor.create!(name: "Professor Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @professor3 = Professor.create!(name: "Professor Orf", age: 30, specialty: "Levitating")
    @student1 = @professor1.students.create!(name: "Harry", age: 17)
    @student2 = @professor1.students.create!(name: "Ron", age: 15)
    @student3 = @professor3.students.create!(name: "Herminie", age: 14)

    @professor1.students << [@student1, @student2]
  end

  it "displays a professor and their attributes and the names of all students associated with that professor" do
    visit "professors/#{@professor1.id}"

    expect(page).to have_content(@professor1.name)
    expect(page).to have_content(@professor1.age)
    expect(page).to have_content(@professor1.specialty)
    expect(page).to_not have_content(@professor2.name)
    expect(page).to have_content(@student1.name)
    expect(page).to have_content(@student2.name)
    expect(page).to_not have_content(@student3.name)
  end
end
