class AddUserIdToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, foreign_key: true
    add_index :likes, :user
  end
end
