require 'spec_helper'
require 'shared/user_setup'

describe "Posts" do
  include_context "user_setup"

  describe "actions" do
  	it "shows index for a user" do
      email, token = login_user
      get "/api/v1/posts/", {}, {email: email, token: token}
      expect(response.status).to eq(200)
      resp = JSON.parse(response.body)
      resp.each do |post|
        post.each do |k, v|
          expect(v).to eq(user.id) if k == "user_id"
        end
      end
    end

    it "shows a post for a user" do
      email, token = login_user
      get "/api/v1/posts/#{user.posts.first.id}", {}, {email: email, token: token}
      expect(response.status).to eq(200)
      post = JSON.parse(response.body)
      expect(post["user_id"]).to eq(user.id)
    end

  	it "creates a post for a user" do
  	  email, token = login_user
  	  post "/api/v1/posts", {post: {title: "post99"}}, {email: email, token: token}
  	  expect(response.status).to eq(201)
  	  post = JSON.parse(response.body)
      expect(post["user_id"]).to eq(user.id)
      expect(Post.find_by(title: "post99")).not_to be_nil
  	end

  	it "destoys a post for a user" do
  	  email, token = login_user
  	  delete "/api/v1/posts/#{user.posts.first.id}", {}, {email: email, token: token}
  	  expect(response.status).to eq(204)
  	end
  end

  describe "authorization" do
    it "returns 401 if user tries to delete posts belonging to another user" do
      email, token = login_user
      user = User.find_by(email: user2[:email])
      delete "/api/v1/posts/#{user.posts.first.id}", {}, {email: email, token: token}
      expect(response.status).to eq(401)
    end
  end
end