require 'rails_helper'
require 'json'

RSpec.describe "Posts", type: :request do
  let(:user) { create :user }
  let(:new_post) { build :post }

  before(:each) { sign_in user }

  describe "GET /users/:user_id/posts" do
    it "returns http success" do
      get user_posts_path(user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /users/:user_id/posts/new" do
    it "returns http success" do
      get new_user_post_path(user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /users/:user_id/posts" do
    it "creates a new Post" do
      
    end
  end
end
