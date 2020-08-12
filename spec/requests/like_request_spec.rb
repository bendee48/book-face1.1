require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create :user }
  let(:post_article) { create :post }

  before(:each) { sign_in user }

  describe "POST /likes" do
    it "creates a like" do
      like_params = attributes_for :like, user_id: user.id, post_id: post_article.id
      expect{post likes_path, params: like_params}.to change{Like.count}.by(1)
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end
end
