require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(name: "John", email: "john@email.com", password: "password") }
  let(:post) { Post.create!(body: "Hi there", user_id: user.id) }
  subject { described_class.new(id: 1,
                                user_id: user.id,
                                likeable_type: 'Post',
                                likeable_id: post.id)
  }

  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a valid likeable_type" do
    subject.likeable_type = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a valid likeable_id" do
    subject.likeable_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a valid user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "invalid if like already exists" do
    subject.save
    like2 = subject.dup
    expect(like2).to_not be_valid
  end
end
