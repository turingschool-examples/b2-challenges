require 'rails_helper'

RSpec.describe Student do
  describe 'relationships' do
    it { should have_many :student_professors }
    it { should have_many(:professors).through(:student_professors)}
  end
end
