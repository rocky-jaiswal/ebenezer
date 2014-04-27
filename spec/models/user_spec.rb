require 'spec_helper'

describe User do
  it "should not allow a user to be created without an email" do
    expect(User.new(email: nil).save).to be_false
  end

  it "should not allow a user to be created without a valid email" do
    expect(User.new(email: "abc").save).to be_false
  end

  it "should allow a user to be created with valid data" do
    expect(User.new(email: "abc@example.com", password: "12345678", password_confirmation: "12345678").save).to be_true
  end
end
