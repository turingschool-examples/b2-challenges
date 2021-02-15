require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe "relationsips" do
    it { should have_many :students}
  end
end
