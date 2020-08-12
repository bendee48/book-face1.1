require 'rails_helper'

RSpec.describe "Friendships", type: :request do
  let(:user) { create :user }
  let(:friend) { create :user, name: "Helen" }
  before(:each) { sign_in user }

  describe "POST /friendships" do
    it "creates a Friendship" do
      expect{post friendships_path, params: { user_id: friend.id }}.to change{Friendship.count}.by(1)
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.name)
    end
  end
end
