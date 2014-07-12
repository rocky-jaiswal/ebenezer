require 'spec_helper'

describe "Authentication" do

  let(:post1) do
    FactoryGirl.create(:post1)
  end

  let(:user1) do
    post1.user
  end

  def login_user
    post "/api/v1/login", user: {email: user1.email, password: user1.password}
    resp = JSON.parse(response.body)
    [resp["email"], resp["token"]]
  end

  it "returns 401 if user tries to access post index page without logging in" do
    get "/api/v1/posts/"
    expect(response.status).to eq(401)
  end
  
  it "returns the email and token if user provides the right email and password" do
    post "/api/v1/login", user: {email: user1.email, password: user1.password}
    expect(response.status).to eq(200)
    resp = JSON.parse(response.body)
    expect(resp["success"]).to be(true)
  end
  
  it "returns 401 if email invalid" do
    post "/api/v1/login", user: {email: user1.email + "foo" , password: user1.password}
    expect(response.status).to eq(401)
  end

  it "returns 401 if password invalid" do
    post "/api/v1/login", user: {email: user1.email, password: user1.password + "blah"}
    expect(response.status).to eq(401)
  end

  it "returns 401 if token is invalid" do
    email, token = login_user
    get "/api/v1/posts/#{post1.id}", {}, {email: email, token: token + "e"} 
    expect(response.status).to eq(401)
  end

  it "returns success if token is valid" do
    email, token = login_user
    get "/api/v1/posts/#{post1.id}", {}, {email: email, token: token}
    expect(response.status).to eq(200)
  end
end