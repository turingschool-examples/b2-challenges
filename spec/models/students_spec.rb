require "rails_helper"

describe Student, type: :model do 
  before :each do 
    Professor.destroy_all
    Student.destroy_all
    @harry = Student.create!(name: "Harry", age: 15)
    @ron = Student.create!(name: "Ron", age: 16)
    @hermione = Student.create!(name: "Hermione", age: 15)
    @draco = Student.create!(name: "Draco", age: 15)
    @frodo = Student.create!(name: "Frodo", age: 16)
    @marty = Student.create!(name: "Marty", age: 24)
    @samwise = Student.create!(name: "Samwise", age: 13)
  end
  describe 'relationships' do 
    it {should have_many :class_lists}
    it {should have_many(:professors).through(:class_lists)}
  end
end