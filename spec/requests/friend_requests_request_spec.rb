require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do
  let(:user) { create :user }

  before(:each) { sign_in user }

  describe "GET /friend_requests" do
    it "returns http success" do
      get friend_requests_path
      expect(response).to have_http_status(:ok)
    end
  end
end
