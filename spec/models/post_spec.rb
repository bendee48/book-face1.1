require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: "John", email: "john@email.com", password: "password") }
  subject { described_class.new(body: "Lorem ipsum dolor sit amet, per doming evertitur complectitur eu.",
                                user_id: user.id
                                )
  }
  
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
end
