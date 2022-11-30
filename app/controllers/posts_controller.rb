class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @user_posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
