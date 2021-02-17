require 'rails_helper'
describe ProfessorStudent, type: :model do 
  describe 'relationship' do
    it { should belong_to :student}
    it { should belong_to :professor}
  end
end