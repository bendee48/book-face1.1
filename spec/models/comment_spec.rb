require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { create :comment }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a valid user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a valid commentable_id" do
    subject.commentable_id = nil
    expect(subject).to_not be_valid
  end

  it "is invalid without a comment body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end
end
