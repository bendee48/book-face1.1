require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create :user }
  let(:post_article) { create :post }
  before(:each) { sign_in user }

  describe "POST /comments" do
    it "creates a comment" do
      comment_params = attributes_for :comment, post_id: post_article.id
      expect{post comments_path, params: { comment: comment_params }}.to change{Comment.count}.by(1)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end

end
