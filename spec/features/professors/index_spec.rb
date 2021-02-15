require 'rails_helper'

RSpec.describe 'Professor index page' do
  before :each do
    @professor1 = Professor.create!(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")
    @professor2 = Professor.create!(name: "Severus Snape",
                                    age: 305,
                                    specialty: "Potions")
    @student1 = @professor1.students.create!(name: "Harry",
                                             age: 18)
    @student2 = @professor1.students.create!(name: "Ron",
                                             age: 20)
    @student3 = @professor1.students.create!(name: "Hermione",
                                             age: 16)
  end
  it 'displays all professors' do
    visit '/professors'

    expect(page).to have_content(@professor1)
    expect(page).to have_content(@professor2)
  end
end
