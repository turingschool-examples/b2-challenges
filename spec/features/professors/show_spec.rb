require 'rails_helper'

RSpec.describe 'Applications show page' do
  before :each do
    Professor.destroy_all
    Student.destroy_all
    StudentProfessor.destroy_all
    @professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @professor2 = Professor.create!(name: "Severus Snape", age: 52, specialty: "Defense Against the Dark Arts")
    @student1 = Student.create!(name: "Harry", age: 14)
    @student2 = Student.create!(name: "Ron", age: 14)
    @student3 = Student.create!(name: "Hermionie", age: 14)
    @student4 = Student.create!(name: "Fred", age: 15)
    @student5 = Student.create!(name: "George", age: 15)
    @professor1.students << @student1
    @professor1.students << @student2
    @professor1.students << @student3
    @professor1.students << @student4
    @professor1.students << @student5
    @professor2.students << @student1
    @professor2.students << @student2
    @professor2.students << @student3
  end

  it "shows professor with correct attributes and names of students" do
    visit "/professors/#{@professor1.id}"

    expect(page).to have_content("Name: #{@professor1.name}")
    expect(page).to have_content("Age: #{@professor1.age}")
    expect(page).to have_content("Specialty: #{@professor1.specialty}")
    expect(page).to have_content("Students:")
    expect(page).to have_content(@student1.name)
    expect(page).to have_content(@student2.name)
    expect(page).to have_content(@student3.name)
    expect(page).to have_content(@student4.name)
    expect(page).to have_content(@student4.name)
  end

  it "shows average age of students" do
    visit "/professors/#{@professor1.id}"
    expect(page).to have_content("Average Age of Students:")
    expect(page).to have_content(@professor1.students.average_age)
  end
end
