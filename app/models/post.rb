class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  after_save :posts_number_update
  after_destroy :update_posts_counter

  # Validations
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Update by use author associated with post
  def posts_number_update
    author.update(posts_counter: author.posts.all.length)
  end

  def recent_five_comments
    comments.limit(5).order(created_at: :desc)
  end
end
