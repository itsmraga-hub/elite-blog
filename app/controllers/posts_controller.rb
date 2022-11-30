class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by_id(params[:id])
    @post_comments = @post.comments
  end
end
