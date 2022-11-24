class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  # Validations
  validates :title, presence: true

  # Update by use author associated with post
  def posts_number_update
    author.update(posts_counter: author.posts.all.length)
  end

  def recent_five_comments
    comments.limit(5).order(created_at: :desc)
  end
end
