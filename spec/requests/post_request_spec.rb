require 'rails_helper'
require 'json'

RSpec.describe "Posts", type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  describe "GET /users/:user_id/posts" do
    it "returns http success" do
      get user_posts_path(user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /users/:user_id/posts" do
    it "creates a new Post" do
      post_params = attributes_for :post
      expect{post user_posts_path(user.id), params: { post: post_params }}.to change{Post.count}.by(1)
      expect(response).to have_http_status(:redirect)
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(post_params[:body])
    end
  end
end
