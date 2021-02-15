require 'rails-helper'

RSpec.describe 'the professor show page' do
  it 'displays prof attributes' do
    prof = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
  end
end
