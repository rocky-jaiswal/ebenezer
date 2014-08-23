module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.where("user_id = ?", current_user.id)
        authorize posts
        render json: posts
      end

      def show
        post = Post.find(params[:id])
        authorize post
        render json: post
      end

      def create
        post = Post.new(post_params)
        post.user = current_user
        authorize post
        if post.save
          render json: post, status: :created, location: api_v1_post_path(post)
        else
          render json: post.errors, status: :unprocessable_entity
        end
      end

      def update
        post = Post.find(params[:id])
        authorize post
        if post.update(post_params)
          render json: post
        else
          render json: post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        post = Post.find(params[:id])
        authorize post
        post.destroy
        head :no_content
      end

      private
      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
    end
  end
end