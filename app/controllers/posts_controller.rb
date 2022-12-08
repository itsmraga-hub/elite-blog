class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
  end

  def new
    @post_new = Post.new
  end

  def create
    post = Post.new(author: current_user, **post_params)
    if post.save
      redirect_to user_posts_url notice: 'Post saved'
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      'Post deleted'
    else
      'Could not delete post'
    end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
