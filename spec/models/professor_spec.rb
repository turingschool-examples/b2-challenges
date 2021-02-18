require "rails_helper"

RSpec.describe Professor, type: :model do
  describe "relationships" do
    skip { should have_many :professor_students }
  end
end
