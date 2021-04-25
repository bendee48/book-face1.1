require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { create :post }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an associated user" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with unless picture is jpg or png" do
    subject.photo.attach(io: File.open('spec/support/images/photo.txt'), filename: 'photo.txt')
    expect(subject).to_not be_valid
  end

  describe ".posts_of_user_and_friends" do
    let(:user) { create :user }
    let(:friend) { create :user, name: "Horatio" }

    it "returns the users posts and those of it's friends" do
      user.friends << friend
      post1 = create :post
      post2 = create :post
      user.posts << post1
      friend.posts << post2
      expect(described_class.posts_of_user_and_friends(user).count).to eql 2
    end
  end
end
