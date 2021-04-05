require 'rails_helper'

RSpec.describe "Rides", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/rides/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/rides/show"
      expect(response).to have_http_status(:success)
    end
  end

end
