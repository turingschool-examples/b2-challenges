require "rails_helper"

describe Professor, type: :model do 
  before :each do 
    Professor.destroy_all
    Student.destroy_all
    @snape = Professor.create!(name: "Snape", age: 56, specialty: "Potions")
    @lupin = Professor.create!(name: "Lupin", age: 60, specialty: "Defense")
    @hagrid = Professor.create!(name: "Hagrid", age: 45, specialty: "Gamekeeper")
  end
  describe 'relationships' do 
    it {should have_many :class_lists}
    it {should have_many(:students).through(:class_lists)}
  end
end