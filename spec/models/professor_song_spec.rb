require 'rails_helper'

RSpec.describe ProfessorStudent, type: :model do
  describe "relationsips" do
    it { should belong_to :professor}
    it { should belong_to :student}
  end
end
