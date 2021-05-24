require 'rails_helper'

RSpec.describe RideMechanic do
  it {should belong_to :mechanic}
  it {should belong_to :ride}
end
