require 'rails_helper'

RSpec.describe User, type: :model do
  it "should validate username" do
    user = User.create(email: "test1@example.com", password: "password")
    expect(user.errors[:username]).to_not be_empty
  end
  it "should validate username uniqueness" do
    user1 = User.create(email: "test1@example.com", username: "test1", password: "password")
    user2 = User.create(email: "test2@example.com", username: "test1", password: "password")
    expect(user2.errors[:username]).to_not be_empty
  end
  it "should validate email" do
    user = User.create(username: "test1", password: "password")
    expect(user.errors[:email]).to_not be_empty
  end
  it "should validate email uniqueness" do
    user1 = User.create(email: "test1@example.com", username: "test1", password: "password")
    user2 = User.create(email: "test1@example.com", username: "test2", password: "password")
    expect(user2.errors[:email]).to_not be_empty
  end
  it "should validate password" do
    user = User.create(email: "test1@example.com", username: "test1")
    expect(user.errors[:password]).to_not be_empty
  end
end
