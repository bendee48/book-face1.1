require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(id: 1,
                                name: 'Person',
                                email: 'email@email.com',
                                password: 'password')
  }
  let(:user2) { described_class.new(id: 2,
                                    name: 'Person2',
                                    email: 'person2@email.com',
                                    password: 'password')
  }

  describe 'validations' do
    it 'is valid, with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.name = nil
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
  end

  describe 'associations' do
    it 'responds to .friends' do
      expect(subject).to respond_to(:friends)
    end

    it 'responds to .friend_ofs' do
      expect(subject).to respond_to(:friend_ofs)
    end

    context 'adding friends' do
      before(:each) { subject.friends << user2 }

      it 'adds a user to .friends' do
        expect(subject.friends.first).to eql user2
      end

      it "is added to a user's .friends_of" do
        # doesn't work not sure why
      end

      it 'adds a friend once only'
    end
  end
end
