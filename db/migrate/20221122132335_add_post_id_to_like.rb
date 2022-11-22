class AddPostIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, foreign_key: true
    add_index :likes, :post
  end
end
