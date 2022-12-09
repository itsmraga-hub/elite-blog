class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts, status: :ok
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
    render json: @post, status: :ok
  end
end