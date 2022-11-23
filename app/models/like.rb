class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def likes_counter_update
    post.update(likes_counter: post.likes.all.length)
  end
end
