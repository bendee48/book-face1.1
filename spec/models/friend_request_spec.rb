require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  let(:user) { User.create!(name:"John", email: "john@email.com", password: "password") }
  let(:friend) { User.create!(name:"Gail", email: "gail@email.com", password: "password") }
  subject { described_class.new(user_id: user.id, friend_id: friend.id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a valid friend_id" do
    subject.friend_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid if friend request has already been sent" do
    subject.save
    second_request = subject.dup
    expect(second_request).to_not be_valid
  end
end
