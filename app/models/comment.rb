class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :comment_counter_update

  def comment_counter_update
    post.update(comments_counter: post.comments.all.length)
  end
end
