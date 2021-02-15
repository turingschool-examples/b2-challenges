require 'rails_helper'

RSpec.describe 'Professor show page' do
  before :each do
    @professor1 = Professor.create!(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")
    @student1 = @professor1.students.create!(name: "Harry",
                                             age: 18)
    @student2 = @professor1.students.create!(name: "Ron",
                                             age: 17)
  end

  it 'displays professors attributes and associated students' do
    visit "/professors/#{@professor1.id}"

    expect(page).to have_content("Professor's name: #{@professor1.name}")
    expect(page).to have_content("Professor's age: #{@professor1.age}")
    expect(page).to have_content("Professor's specialty: #{@professor1.specialty}")
    @professor1.students.each do |student|
      expect(page).to have_content(student.name)
    end
  end
end
