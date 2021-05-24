require 'rails_helper'

RSpec.describe Park, type: :model do
  it { should have_many :rides }
end
