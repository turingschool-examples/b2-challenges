require 'rails_helper'

RSpec.describe Professor do
  describe 'relationships' do
    it { should have_many :student_professors }
    it { should have_many(:students).through(:student_professors)}
  end
end
