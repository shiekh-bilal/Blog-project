require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      # get :index
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      user = FactoryBot.create(:user)
      # get :show, params: { id: user.id }
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
