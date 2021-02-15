require 'rails_helper'

RSpec.describe StudentProfessor do
  describe 'relationships' do
    it { should belong_to :professor }
    it { should belong_to :student }
  end
end
