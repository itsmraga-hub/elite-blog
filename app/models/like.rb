class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :likes_counter_update

  def likes_counter_update
    post.update(likes_counter: post.likes.all.length)
  end
end
