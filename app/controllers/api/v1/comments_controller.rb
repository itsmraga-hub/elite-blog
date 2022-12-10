class Api::V1::CommentsController < Api::V1::ApiController
  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments, status: :ok
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    render json: @comment, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.create(author: current_user, post: post, comment_params)
    comment = @user.comments.new(post:, **comment_params)
    return unless comment.save

    render json: comment, status: :ok
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
