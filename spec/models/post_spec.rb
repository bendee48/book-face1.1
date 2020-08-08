require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build_stubbed :post }

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
