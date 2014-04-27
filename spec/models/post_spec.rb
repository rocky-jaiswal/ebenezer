require 'spec_helper'

describe Post do
  it "should not allow a post to be created without a title" do
    expect(Post.new(title: nil).save).to be_false
  end

  it "should not allow a post to be created without a valid user" do
    expect(Post.new(title: "abc").save).to be_false
  end

  it "should allow a post to be created with valid data" do
    User.create(email: "abc@example.com", password: "12345678", password_confirmation: "12345678")
    expect(Post.new(title: "title1", user: User.first).save).to be_true
  end
end
