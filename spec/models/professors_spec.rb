require "rails_helper"

describe Professor, type: :model do 
  describe 'relationships' do 
    it {should have_many :students}
  end
  before :each do 
    Professor.destroy_all
    Song.destroy_all
    @snape = Professor.create!(name: "Snape", age: 56, specialty: "Potions")
    @lupin = Professor.create!(name: "Lupin", age: 60, specialty: "Defense")
    @hagrid = Professor.create!(name: "Hagrid", age: 45, specialty: "Gamekeeper")
    @sybill = Professor.create!(name: "Sybill", age: 62, specialty: "Divination")
  end
end