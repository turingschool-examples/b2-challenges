require 'rails_helper'

describe Mechanic, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end
end
