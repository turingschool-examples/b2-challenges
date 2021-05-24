require 'rails_helper' 

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:maintenances) }
    it { should have_many(:rides).through(:maintenances) }  
  end

  describe 'method' do 
    before(:each) do  
      @mechanic_1 = Mechanic.create!(name: "Dee", years_experience: 20)  
      @mechanic_2 = Mechanic.create!(name: "Bob", years_experience: 30)  
    end  

    describe 'average_years_experience' do   
      it 'return the average years of experience' do
        expect(Mechanic.average_years_experience).to eq(25)
      end
    end  
  end
end