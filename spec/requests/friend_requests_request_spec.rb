require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do
  let(:user) { create :user }
  let(:friend) { create :user, name: "Ruth" }

  before(:each) { sign_in user }

  describe "GET /friend_requests" do
    it "returns http success" do
      get friend_requests_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /friend_requests" do
    it "creates a FriendRequest" do
      expect{post friend_requests_path, params: { friend_id: friend.id }}.to change{FriendRequest.count}.by(1)
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end
end
