require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: "John", email: "john@email.com", password: "password") }
  let(:post) { Post.create!(body: "Hi there", user_id: user.id) }
  subject { described_class.new(body: "This is a post.",
                                commentable_type: "Post",
                                commentable_id: post.id,
                                user_id: user.id) 
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a valid user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a valid commentable_id" do
    subject.commentable_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a comment body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end
end
