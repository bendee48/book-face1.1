require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it 'is valid, with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if name is longer than 30 characters' do
    subject.name = "Michael Michaela Michaelson the Third"
    expect(subject).to_not be_valid
  end

  it 'is not valid if name is shorter than 3 characters' do
    subject.name = "Po"
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'responds to .friends' do
      expect(subject).to respond_to(:friends)
    end

    it 'responds to .friend_ofs' do
      expect(subject).to respond_to(:friend_ofs)
    end
  end

  describe "#all_friends" do
    it "returns all the user's friends" do
      friend1 = create :user, name: "Bob" 
      friend2 = create :user, name: "Emma"
      user = create :user, name: "Mike"
      user.friends << friend1
      friend2.friends << user
      expect(user.all_friends.count).to eql 2
    end
  end

  describe "#friend_ids" do
    it "returns all ids of user's friends" do
      friend1 = create :user, name: "Bob" 
      friend2 = create :user, name: "Emma"
      subject.friends << friend1 << friend2
      expect(subject.friend_ids).to eql [friend1.id, friend2.id]
    end
  end
end
