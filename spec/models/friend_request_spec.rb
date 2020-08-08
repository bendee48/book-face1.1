require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  subject { create :friend_request }

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
