class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = Like.create(author: current_user, post: @post)

    if like.save
      'Post liked'
    else
      'Like not saved'
    end
    redirect_to user_post_path(@post.author.id, @post)
  end
end
