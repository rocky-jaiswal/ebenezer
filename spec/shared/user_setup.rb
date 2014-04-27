require 'spec_helper'

shared_context "user_setup" do
  
  let(:user1) { FactoryGirl.attributes_for(:user1) }
  let(:user2) { FactoryGirl.attributes_for(:user2) }

  let(:post1) { FactoryGirl.attributes_for(:post1) }
  let(:post2) { FactoryGirl.attributes_for(:post2) }

  let(:user) { User.find_by(email: user1[:email]) }
  let(:another_user) { User.find_by(email: user2[:email]) }

  before(:each) do
    FactoryGirl.create(:user1)
    FactoryGirl.create(:user2)
    FactoryGirl.create(:post1)
    FactoryGirl.create(:post2)
  end

  def login_user
    post "/api/v1/login", user: {email: user1[:email], password: user1[:password]}
    resp = JSON.parse(response.body)
    [resp["email"], resp["token"]]
  end
	
end