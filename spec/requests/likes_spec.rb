require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/likes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/likes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/likes/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
