require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject { create :friendship }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a valid friend_id" do
    subject.friend_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a valid friend_of_id" do
    subject.friend_of_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid if friendship already exists" do
    friend_id = subject.friend_of_id
    friend_of_id = subject.friend_id
    friendship = create :friendship, friend_id: friend_id, friend_of_id: friend_of_id
    expect(friendship).to_not be_valid
  end
end
