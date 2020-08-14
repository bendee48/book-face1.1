require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create :user }

  before(:each) { sign_in user }

  describe "GET /users" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.name)
    end
  end

  describe "GET /users/:id" do
    it "returns http success" do
      get user_path(user.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.name)
    end
  end
end
