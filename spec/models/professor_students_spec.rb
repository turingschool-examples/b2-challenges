require 'rails_helper'

describe ProfessorStudent, type: :model do
  describe 'relationships' do
    it { should belong_to :professor}
    it { should belong_to :student}
  end

  describe 'validations' do
    it {should validate_presence_of :professor_id}
    it {should validate_presence_of :student_id}
  end
end
