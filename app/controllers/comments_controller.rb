class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.create(author: current_user, post:, **comment_params)
    return unless comment.save

    redirect_to user_post_path(current_user.id, post.id), notice: 'Comment saved'
  end

  def destroy
    user = User.find(params[:user_id])
    comment = Comment.find(params[:post_id])
    post = Post.find(params[:id])
    if comment.destroy
      'Comment deleted'
    else
      flash[:error] = 'Could not delete comment'
    end
    redirect_to user_post_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
