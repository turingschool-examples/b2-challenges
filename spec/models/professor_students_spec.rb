require 'rails_helper'

describe ProfessorStudents, model: :type do
  describe 'relationships' do
    it {should belong_to :professor}
    it {should belong_to :student}
  end
end
