require 'rails_helper'

RSpec.describe Ride do
  before :each do
    @mech_1 = Mechanic.create!(name: 'Roald', years_experience: 25)
    @mech_2 = Mechanic.create!(name: 'Larry', years_experience: 10)
    @mech_3 = Mechanic.create!(name: 'Samantha', years_experience: 30)

    @ride_1 = Ride.create!(name: 'ThrillHouse', thrill_rating: 4, open: true)
    @ride_2 = Ride.create!(name: 'Thrillinator 500', thrill_rating: 7, open: true)
    @ride_3 = Ride.create!(name: 'Merry-go-round', thrill_rating: 1, open: false)
    @ride_4 = Ride.create!(name: 'The Closed Ride', thrill_rating: 0, open: false)

    @r_m_1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mech_1.id)
    @r_m_2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_1.id)
    @r_m_3 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_2.id)
    @r_m_4 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mech_3.id)
    @r_m_5 = RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mech_3.id)
    @r_m_5 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mech_3.id)
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:thrill_rating)}
    # it {should validate(:open)}
  end

  describe 'relationships' do
    it {should have_many(:ride_mechanics)}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe '#current_rides' do
    xit 'displays the instances of the current rides being worked on' do
      join_table = RideMechanic.where('mechanic_id = ?', @mech_1.id)

      rides = join_table.map do |table|
        Ride.current_rides(table)
      end

      expect(rides).to eq([@ride_1])
    end
  end
end
