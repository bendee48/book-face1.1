require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(id: 1,
                                name: 'Bob',
                                email: 'email@email.com',
                                password: 'password')
  }

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
end
